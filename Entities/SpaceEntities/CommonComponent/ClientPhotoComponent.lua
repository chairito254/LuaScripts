-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientPhotoComponent.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local ServiceUtils = require("Common.Utils.ServiceUtils")
local Utils = require("Common.Utils.Utils")
local Const = require("Common.Const.Const")
local IDManager = require("Core.Common.IDManager")
local PhotoOfficialPresetData = require("Data.photo_official_preset_data")
local ClientUtils = require("Utils.ClientUtils")
local NoticeDef = require("Common.NoticeDef")
local ClientSettingUtils = require("Utils.ClientSettingUtils")
local SysConfigData = require("Data.sys_config_data")
local MEMORY_CAPTURE_PREFIX = "__photo_capture_"

local function clearPhotoAudit(owner, task, tasks)
	if task.timer then
		owner:removeTimer(task.timer)

		task.timer = nil
	end

	if tasks then
		if task.imageKey and tasks[task.imageKey] == task then
			tasks[task.imageKey] = nil
		end

		if task.imageCheckId and tasks[task.imageCheckId] == task then
			tasks[task.imageCheckId] = nil
		end
	end
end

local ClientPhotoComponent = Class.Component("ClientPhotoComponent")

function ClientPhotoComponent:RPC_SC_NotifyImageCheckApproved(imageCheckId, url, riskLevel, status)
	self.logger:info("拍照流程[审核返回码] imageCheckId=%s riskLevel=%s status=%s", tostring(imageCheckId), tostring(riskLevel), tostring(status))

	if status ~= Const.IMAGE_CHECK_STATUS.PASS and status ~= Const.IMAGE_CHECK_STATUS.FAIL then
		return
	end

	local passed = status == Const.IMAGE_CHECK_STATUS.PASS
	local presetTask = self.photoPresetAuditTasks and self.photoPresetAuditTasks[imageCheckId]

	if presetTask then
		presetTask.onAudit(passed)
	end

	local coverTask = self.photoCoverAuditTasks and self.photoCoverAuditTasks[imageCheckId]

	if coverTask then
		coverTask.finish(passed, "audit")
	end

	local task = self.photoAuditTasks and self.photoAuditTasks[imageCheckId]

	if task then
		task.auditPassed = passed

		if task.state == "pending" then
			self:finishPhotoSaveTask(task, passed, "audit")
		end
	end
end

function ClientPhotoComponent:destroy()
	for _, task in pairs(self.photoPresetUploadTasks or {}) do
		task.finish()
	end

	self.photoPresetUploadTasks = nil
	self.photoPresetAuditTasks = nil

	for _, task in pairs(self.photoCoverAuditTasks or {}) do
		task.cancel()
	end

	self.photoCoverAuditTasks = nil

	for _, task in pairs(self.photoSaveTasks or {}) do
		task.finished = true
		task.onComplete = nil

		clearPhotoAudit(self, task, self.photoAuditTasks)

		if NotNil(task.sprite) then
			pg.global.mobileCameraMgr:DestroySpriteTexture(task.sprite)
		end

		task.sprite = nil
	end

	self.photoSaveTasks = nil
	self.photoAuditTasks = nil
	self.localSaveQueue = nil
	self.localSaveBusy = nil
end

function ClientPhotoComponent:createPhotoSaveTask(sprite, saveInfo, checkParams, onComplete)
	if IsNil(sprite) or not saveInfo then
		return nil
	end

	local taskId = tostring(IDManager.genStrID())
	local memoryKey = MEMORY_CAPTURE_PREFIX .. taskId

	if pg.global.mobileCameraMgr:SaveSpriteToShareCache(sprite, memoryKey) ~= memoryKey then
		return nil
	end

	saveInfo.path = memoryKey

	local task = {
		state = "captured",
		id = taskId,
		sprite = sprite,
		saveInfo = saveInfo,
		checkParams = checkParams or {
			CheckType = Const.PhotoCheckScene.Share
		},
		memoryKey = memoryKey,
		onComplete = onComplete
	}

	self.photoSaveTasks = self.photoSaveTasks or {}
	self.photoSaveTasks[taskId] = task

	return task
end

function ClientPhotoComponent:requestPhotoSaveTask(task, automatic)
	if not task or not self.photoSaveTasks or self.photoSaveTasks[task.id] ~= task then
		return false
	end

	if task.state ~= "captured" then
		local pending = task.state == "uploading" or task.state == "pending" or task.state == "queued" or task.state == "saving"

		if not automatic and pending then
			pg.global.showBubbleMessageRaw(pg.getGameString("PHOTO_AUDIT_SAVE_PENDING"))
		end

		return pending
	end

	task.automatic = automatic == true
	task.state = "uploading"

	if not task.automatic then
		pg.global.showBubbleMessageRaw(pg.getGameString("PHOTO_AUDIT_SAVE_PENDING"))
	end

	task.storageMode = ClientSettingUtils.getPhotoStorageMode()

	if task.saveToLocal == nil then
		task.saveToLocal = ClientSettingUtils.shouldSavePhotoToLocal(task.storageMode)
	end

	if task.saveToCloud == nil then
		task.saveToCloud = ClientSettingUtils.shouldSavePhotoToCloud(task.storageMode)
	end

	self.logger:info("拍照流程[上传服务器] taskId=%s automatic=%s checkType=%s photoNumber=%s", tostring(task.id), tostring(task.automatic), tostring(task.checkParams and task.checkParams.CheckType), tostring(task.checkParams and task.checkParams.photoNumber))

	local params = {}

	for key, value in pairs(task.checkParams or {}) do
		params[key] = value
	end

	params.CheckType = task.saveToCloud and Const.PhotoCheckScene.OSS or Const.PhotoCheckScene.Share

	self:addPhotoImgSprite(task.sprite, function(key, success, imgUrl)
		if not self.photoSaveTasks or self.photoSaveTasks[task.id] ~= task then
			return
		end

		self.logger:info("拍照流程[上传成功] taskId=%s success=%s imageCheckId=%s", tostring(task.id), tostring(success), tostring(key))

		if not success or string.isNilOrEmpty(imgUrl) then
			self:finishPhotoSaveTask(task, false, "upload")

			return
		end

		task.imageKey = key
		task.imageCheckId = key
		task.imgUrl = imgUrl
		self.photoAuditTasks = self.photoAuditTasks or {}
		self.photoAuditTasks[key] = task
		params.imageCheckId = key

		local function submitAudit()
			if task.finished then
				return
			end

			self.logger:info("拍照流程[发送审核] taskId=%s imageCheckId=%s checkType=%s", tostring(task.id), tostring(task.imageCheckId), tostring(params.CheckType))
			self:serverMsg("RPC_CS_TakePhoto", params, imgUrl, key, function(result, returnedId)
				self.logger:info("拍照流程[审核提交结果] taskId=%s imageCheckId=%s result=%s returnedId=%s", tostring(task.id), tostring(key), tostring(result), tostring(returnedId))

				if not self.photoSaveTasks or self.photoSaveTasks[task.id] ~= task then
					return
				end

				if result ~= NoticeDef.SUCCESS then
					self:finishPhotoSaveTask(task, false, "audit")

					return
				end

				task.imageCheckId = returnedId or key
				self.photoAuditTasks[task.imageCheckId] = task
				task.state = "pending"

				if task.auditPassed ~= nil then
					self:finishPhotoSaveTask(task, task.auditPassed, "audit")
				else
					task.timer = self:addTimer(tonumber(SysConfigData.PHOTO_AUDIT_TIMEOUT) or 2, function()
						task.timer = nil

						self:finishPhotoSaveTask(task, true)
					end)
				end
			end)
		end

		if task.saveToCloud then
			self:serverMsg("RPC_CS_CheckPhotoUploadLimit", function(result, failureReason)
				if task.finished then
					return
				end

				if result ~= NoticeDef.SUCCESS then
					self:finishPhotoSaveTask(task, false, failureReason or "photo_upload_limit")

					return
				end

				submitAudit()
			end)
		else
			submitAudit()
		end
	end)

	return true
end

function ClientPhotoComponent:releasePhotoSaveTask(task)
	if not task or task.state ~= "captured" or not self.photoSaveTasks or self.photoSaveTasks[task.id] ~= task then
		return
	end

	if NotNil(task.sprite) then
		pg.global.mobileCameraMgr:DestroySpriteTexture(task.sprite)
	end

	task.finished = true
	task.onComplete = nil
	task.sprite = nil
	self.photoSaveTasks[task.id] = nil
end

function ClientPhotoComponent:requestPhotoCoverAudit(params, imgUrl, imageCheckId, onAudit)
	if string.isNilOrEmpty(imgUrl) or imageCheckId == nil then
		return nil
	end

	self.photoCoverAuditTasks = self.photoCoverAuditTasks or {}

	local task = {
		imageKey = imageCheckId,
		onAudit = onAudit
	}

	function task.finish(passed, reason)
		if task.finished then
			return
		end

		task.finished = true

		clearPhotoAudit(self, task, self.photoCoverAuditTasks)

		if task.onAudit then
			task.onAudit(passed == true, reason)
		end
	end

	function task.cancel()
		if task.finished then
			return
		end

		task.finished = true
		task.onAudit = nil

		clearPhotoAudit(self, task, self.photoCoverAuditTasks)
	end

	self.photoCoverAuditTasks[task.imageKey] = task
	task.timer = self:addTimer(tonumber(SysConfigData.PHOTO_AUDIT_TIMEOUT) or 2, function()
		task.timer = nil

		task.finish(false, "timeout")
	end)

	local checkParams = type(params) == "table" and Utils.deepCopyTable(params) or {
		CheckType = params
	}

	checkParams.CheckType = checkParams.CheckType or Const.PhotoCheckScene.Share
	checkParams.imageCheckId = imageCheckId

	self:serverMsg("RPC_CS_TakePhoto", checkParams, imgUrl, imageCheckId, function(result, returnedId)
		if task.finished then
			return
		end

		if result ~= NoticeDef.SUCCESS then
			task.finish(false, "submit")

			return
		end

		task.imageCheckId = returnedId or imageCheckId
		self.photoCoverAuditTasks[task.imageCheckId] = task
	end)

	return task
end

function ClientPhotoComponent:saveNextLocalPhoto()
	if self.localSaveBusy or not self.localSaveQueue then
		return
	end

	local task = table.remove(self.localSaveQueue, 1)

	while task and (task.finished or not self.photoSaveTasks or self.photoSaveTasks[task.id] ~= task) do
		task = table.remove(self.localSaveQueue, 1)
	end

	if not task then
		return
	end

	self.localSaveBusy = true
	task.state = "saving"

	pg.global.mobileCameraMgr:SaveImageToAlbum(task.saveInfo, function(path)
		if task.finished then
			return
		end

		self.localSaveBusy = false

		self:completePhotoSaveTask(task, path ~= nil and path ~= "", path)
		self:saveNextLocalPhoto()
	end)
end

function ClientPhotoComponent:completePhotoSaveTask(task, success, path, failureReason)
	if task.finished or not self.photoSaveTasks or self.photoSaveTasks[task.id] ~= task then
		return
	end

	task.finished = true
	task.state = success and "saved" or "failed"
	self.photoSaveTasks[task.id] = nil

	clearPhotoAudit(self, task, self.photoAuditTasks)

	local onComplete = task.onComplete

	task.onComplete = nil

	if onComplete then
		ClientUtils.tryWithLogErrorEx(onComplete, success, path, not success and (failureReason or "local_save") or nil)
	end

	if not task.keepSprite and NotNil(task.sprite) then
		pg.global.mobileCameraMgr:DestroySpriteTexture(task.sprite)
	end

	task.sprite = nil
end

function ClientPhotoComponent:finishPhotoSaveTask(task, passed, failureReason)
	if not task or task.finished or not self.photoSaveTasks or self.photoSaveTasks[task.id] ~= task then
		return
	end

	if task.state == "queued" or task.state == "saving" then
		return
	end

	clearPhotoAudit(self, task, self.photoAuditTasks)

	if not passed then
		if failureReason == "audit" then
			task.auditPassed = false
		end

		if failureReason == "upload" then
			pg.global.ui.tips:showTextTip(pg.getGameString("VERIFY_PIC_UPLOAD_FAIL"))
		elseif failureReason == "photo_upload_limit" then
			local failureText = ClientSettingUtils.getPhotoSaveFailureText(failureReason)

			if failureText then
				pg.global.showBubbleMessageRaw(failureText)
			end
		else
			pg.global.showBubbleMessageRaw(pg.getGameString(task.automatic and "PHOTO_AUDIT_AUTO_SAVE_REJECTED" or "PHOTO_AUDIT_SAVE_REJECTED"))
		end

		self:completePhotoSaveTask(task, false, nil, failureReason)

		return
	end

	if not task.saveToLocal then
		self:completePhotoSaveTask(task, true, nil)

		return
	end

	self.localSaveQueue = self.localSaveQueue or {}
	task.state = "queued"

	table.insert(self.localSaveQueue, task)
	self:saveNextLocalPhoto()
end

function ClientPhotoComponent:callPhotoGet(photoId, callback)
	local function cb(status, response)
		if LoggerManager.checkLogger(LoggerConst.DEBUG) then
			self.logger:debug("callPhotoGet callback", inspect(status), inspect(response.key))
		end

		local isOk = status.status

		if callback ~= nil then
			callback(isOk, response.value)
		end
	end

	ServiceUtils.kvServiceFind("photo-" .. photoId, cb)

	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("callPhotoGet", photoId, self.uid)
	end
end

function ClientPhotoComponent:getOSSPhotoPictureKey(photoKey, callback)
	self:callPhotoGet(photoKey, function(isOk, photoUrl)
		if not isOk or string.isNilOrEmpty(photoUrl) then
			if callback then
				callback(nil)
			end

			return
		end

		local pictureKey = string.match(photoUrl, "/picture/([^/?#]+)")

		if string.isNilOrEmpty(pictureKey) then
			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				self.logger:error("getOSSPhotoPictureKey invalid photo url, photoKey=%s", tostring(photoKey))
			end

			if callback then
				callback(nil)
			end

			return
		end

		if callback then
			callback(pictureKey)
		end
	end)
end

function ClientPhotoComponent:pullOSSPhoto(photoKey, callback)
	self:getOSSPhotoPictureKey(photoKey, function(pictureKey)
		if string.isNilOrEmpty(pictureKey) then
			if callback then
				callback(nil)
			end

			return
		end

		ClientUtils.pullPicture(pictureKey, function(_, sprite)
			if callback then
				callback(sprite)
			end
		end)
	end)
end

function ClientPhotoComponent:removeOSSPhoto(photoKey, callback)
	if string.isNilOrEmpty(photoKey) then
		if callback then
			callback(false)
		end

		return
	end

	self:getOSSPhotoPictureKey(photoKey, function(pictureKey)
		if string.isNilOrEmpty(pictureKey) then
			if callback then
				callback(false)
			end

			return
		end

		ClientUtils.deletePicture(pictureKey, function(_, err)
			if err then
				if callback then
					callback(false)
				end

				return
			end

			self:serverMsg("RPC_CS_RemoveOSSPhoto", photoKey, function(result)
				if callback then
					callback(result == NoticeDef.SUCCESS)
				end
			end)
		end)
	end)
end

function ClientPhotoComponent:testPhotoGet(photoId)
	self:callPhotoGet(photoId, function(isOk, photoContent)
		if isOk then
			if LoggerManager.checkLogger(LoggerConst.INFO) then
				self.logger:info("get photo success, photoId:%s, content:%s", photoId, photoContent)
			end
		elseif LoggerManager.checkLogger(LoggerConst.INFO) then
			self.logger:info("get photo failed")
		end
	end)
end

function ClientPhotoComponent:testPhotoGetByConfigId(photoConfigId)
	local photoId = self.photoRecordMap[photoConfigId] and self.photoRecordMap[photoConfigId].photoId

	self:testPhotoGet(photoId)
end

function ClientPhotoComponent:onLeaveSpace()
	pg.global.ui.photo:clearTemplateCache()
end

function ClientPhotoComponent:getPhotoLightScheme(slot)
	local rawScheme = self.photoLightSchemeList and self.photoLightSchemeList[slot]

	if string.isNilOrEmpty(rawScheme) then
		return nil
	end

	local decodeOk, scheme = pcall(Utils.decodeFromStr, rawScheme)

	if not decodeOk or type(scheme) ~= "table" then
		self.logger:error("getPhotoLightScheme decode failed, slot=%s", tostring(slot))

		return nil
	end

	return scheme
end

function ClientPhotoComponent:uploadPhotoLightScheme(slot, scheme, callback)
	local maxCount = tonumber(self.photoLightSchemeCount) or 0

	if type(slot) ~= "number" or slot < 1 or maxCount < slot or type(scheme) ~= "table" then
		if callback then
			callback(NoticeDef.FAIL)
		end

		return false
	end

	local schemeStr = Utils.encodeToStr(scheme)

	if string.isNilOrEmpty(schemeStr) then
		self.logger:error("uploadPhotoLightScheme encode failed, slot=%s", tostring(slot))

		if callback then
			callback(NoticeDef.FAIL)
		end

		return false
	end

	if callback then
		self:serverMsg("RPC_CS_UploadPhotoLightScheme", slot, schemeStr, callback)
	else
		self:serverMsg("RPC_CS_UploadPhotoLightScheme", slot, schemeStr)
	end

	return true
end

function ClientPhotoComponent:savePhotoPresetAdd(presetInfo, callback)
	local presetStr = Utils.encodeToStr(presetInfo) or ""

	self:serverMsg("RPC_CS_SavePhotoPresetAdd", presetStr, callback)
end

function ClientPhotoComponent:savePhotoPresetDel(presetId, callback)
	local isOfficial, rawId = Utils.parsePhotoPresetUniqueId(presetId)

	assert(not isOfficial, "cannot delete official preset")
	self:serverMsg("RPC_CS_SavePhotoPresetDel", presetId, callback)
end

function ClientPhotoComponent:likePhotoPresetAdd(presetId, callback)
	self:serverMsg("RPC_CS_LikePhotoPresetAdd", presetId, callback)
end

function ClientPhotoComponent:likePhotoPresetDel(presetId, callback)
	self:serverMsg("RPC_CS_LikePhotoPresetDel", presetId, callback)
end

function ClientPhotoComponent:onPhotoPresetInfo_SavedIdMap_EntryAdded(key, value)
	if pg.logDebug() then
		self.logger:debug("photoPreset onPhotoPresetInfo_SavedIdMap_EntryAdded key=%s, value=%s", key, inspect(value))
	end
end

function ClientPhotoComponent:onPhotoPresetInfo_SavedIdMap_EntryDeleted(key, value)
	if pg.logDebug() then
		self.logger:debug("photoPreset onPhotoPresetInfo_SavedIdMap_EntryDeleted key=%s, value=%s", key, inspect(value))
	end
end

function ClientPhotoComponent:onPhotoPresetInfo_LikedIdMap_EntryAdded(key, value)
	if pg.logDebug() then
		self.logger:debug("photoPreset onPhotoPresetInfo_LikedIdMap_EntryAdded key=%s, value=%s", key, inspect(value))
	end
end

function ClientPhotoComponent:onPhotoPresetInfo_LikedIdMap_EntryDeleted(key, value)
	if pg.logDebug() then
		self.logger:debug("photoPreset onPhotoPresetInfo_LikedIdMap_EntryDeleted key=%s, value=%s", key, inspect(value))
	end
end

function ClientPhotoComponent:_queryPhotoPreset(presetId, callback)
	local isOfficial, rawId = Utils.parsePhotoPresetUniqueId(presetId)

	if isOfficial then
		local content = PhotoOfficialPresetData[tonumber(rawId)]

		callback(content)
	else
		local kvKey = Utils.genKVKey(Const.KV_KEY.PHOTO_PRESET, presetId)

		ServiceUtils.kvServiceFind(kvKey, function(status, response)
			local contentStr = status.status and response.value
			local content = contentStr and Utils.decodeFromStr(contentStr)

			if content == nil then
				self.logger:error("photoPreset _queryPhotoPreset failed, presetId=%s", presetId)
			end

			callback(content)
		end)
	end
end

function ClientPhotoComponent:addPhotoImgSprite(sprite, callback)
	local picId = Utils.genPhotoPresetPicId(IDManager.genStrID())

	ClientUtils.uploadPicture(picId, sprite, callback)
end

function ClientPhotoComponent:genPresetWithImgUrlSprite(preset, sprite, callback)
	self:addPhotoImgSprite(sprite, function(key, result, imgUrl)
		if result == true then
			preset.imgKey = key
		end

		callback(result, key, imgUrl)
	end)
end

function ClientPhotoComponent:uploadPresetWithImgSprite(preset, sprite, callback)
	self.photoPresetUploadTasks = self.photoPresetUploadTasks or {}

	if self.photoPresetUploadTasks[preset] then
		return
	end

	local task = {
		preset = Utils.deepCopyTable(preset)
	}

	self.photoPresetUploadTasks[preset] = task

	local function clearAudit()
		clearPhotoAudit(self, task, self.photoPresetAuditTasks)
	end

	function task.finish(id, tip)
		if task.finished then
			return
		end

		task.finished = true

		clearAudit()

		self.photoPresetUploadTasks[preset] = nil

		if not id and task.imageKey and not task.saving then
			ClientUtils.deletePicture(task.imageKey)
		end

		if tip then
			pg.global.showBubbleMessageRaw(pg.getGameString(tip))
		end

		if callback then
			callback(id, id ~= nil)
		end
	end

	function task.onAudit(passed)
		if task.finished or task.saving then
			return
		end

		task.auditPassed = passed

		if not passed then
			task.finish(nil, "VERIFY_PIC_FAIL")

			return
		end

		if not task.accepted then
			return
		end

		task.saving = true

		clearAudit()
		self:savePhotoPresetAdd(task.preset, function(result, id)
			if task.finished then
				return
			end

			task.saving = false

			if result ~= NoticeDef.SUCCESS then
				self.logger:error("photoPreset uploadPresetWithImgSprite failed! result = %s", result)
				task.finish(nil, "VERIFY_PIC_UPLOAD_FAIL")

				return
			end

			task.finish(id)
		end)
	end

	self:genPresetWithImgUrlSprite(task.preset, sprite, function(result, key, imgUrl)
		if task.finished then
			if key then
				ClientUtils.deletePicture(key)
			end

			return
		end

		task.imageKey = key

		if result ~= true or string.isNilOrEmpty(imgUrl) then
			task.finish(nil, "VERIFY_PIC_UPLOAD_FAIL")

			return
		end

		self.photoPresetAuditTasks = self.photoPresetAuditTasks or {}
		self.photoPresetAuditTasks[key] = task
		task.timer = self:addTimer(tonumber(SysConfigData.PHOTO_AUDIT_TIMEOUT) or 2, function()
			task.timer = nil

			task.finish(nil, "VERIFY_PIC_FAIL")
		end)

		Utils.checkPhoto(Const.PhotoCheckScene.Share, imgUrl, function(accepted, returnedId)
			if task.finished or task.saving then
				return
			end

			if not accepted then
				task.finish()

				return
			end

			task.imageCheckId = returnedId or key
			self.photoPresetAuditTasks[task.imageCheckId] = task
			task.accepted = true

			if task.auditPassed ~= nil then
				task.onAudit(task.auditPassed)
			end
		end, key)
	end)
end

function ClientPhotoComponent:deleteMyPhotoPreset(presetId, imgKey, callback)
	self:savePhotoPresetDel(presetId, function(result)
		if result == NoticeDef.SUCCESS then
			if imgKey then
				ClientUtils.deletePicture(imgKey)
			end

			callback()
		end
	end)
end

return ClientPhotoComponent
