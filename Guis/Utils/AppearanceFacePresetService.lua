-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Utils\\AppearanceFacePresetService.lua

local AppearanceCustomData = require("Data.appearance_custom_data")
local PresetUtils = require("Common.Utils.AppearanceFacePresetUtils")
local AvatarUtils = require("Guis.Utils.AvatarUtils")
local Utils = require("Common.Utils.Utils")
local TimerManager = require("Core.Timer.TimerManager")
local AppearanceFacePresetService = {}
local presetDisplayResults = setmetatable({}, {
	__mode = "k"
})
local saveDrafts = setmetatable({}, {
	__mode = "k"
})
local slotUnlocks = setmetatable({}, {
	__mode = "k"
})

local function displayResultKey(category, slotId)
	return category .. ":" .. tostring(slotId)
end

local function clearDisplayResult(player, category, slotId)
	local results = presetDisplayResults[player]

	if results then
		results[displayResultKey(category, slotId)] = nil
	end
end

AppearanceFacePresetService.TEXT_KEY = {
	SAVING_CONSUME = "APPEARANCE_CONSUME_TEXT",
	ENTER_PINCH_FACE = "ENTER_PINCH_FACE",
	SAVING_BACK = "BACK_TO_PRE",
	MAKEUP_PRESET_TYPE = "MAKEUP_PRESET_TYPE",
	SLOT_UNLOCK = "APPEARANCE_FACE_PRESET_SLOT_UNLOCK",
	UNLOCK_DESC = "HOME_BUY_DESC",
	SAVING_FULL_DESC = "APPEARANCE_FACE_PRESET_SAVING_FULL_DESC",
	SAVING_FULL_TITLE = "APPEARANCE_FACE_PRESET_SAVING_FULL_TITLE",
	SAVING_DESC = "APPEARANCE_FACE_PRESET_SAVING_DESC",
	SAVING_TITLE = "APPEARANCE_FACE_PRESET_SAVING_TITLE",
	PRESET_DEFAULT_NAME = "APPEARANCE_FACE_PRESET_DEFAULT_NAME",
	PRESET_UNSET = "APPEARANCE_FACE_PRESET_UNSET",
	MAKEUP_CUSTOM_TAB = "APPEARANCE_FACE_MAKEUP_CUSTOM_TAB",
	MAKEUP_SUIT_TAB = "APPEARANCE_FACE_MAKEUP_SUIT_TAB",
	MAKEUP_TAB = "APPEARANCE_FACE_MAKEUP_TAB",
	UNLOCK_TITLE = "UNLOCK_TITLE",
	SCULPT_TAB = "APPEARANCE_FACE_SCULPT_TAB",
	SCULPT_PRESET_TYPE = "SCULPT_PRESET_TYPE",
	FACE_TAB = "APPEARANCE_FACE_TAB",
	MAKEUP_PRESET_DESC = "APPEARANCE_FACE_MAKEUP_PRESET_DESC",
	SCULPT_PRESET_DESC = "APPEARANCE_FACE_SCULPT_PRESET_DESC"
}

function AppearanceFacePresetService.getPresetName(name, slotId)
	if name and name ~= "" then
		return name
	end

	local defaultName = pg.getGameString(AppearanceFacePresetService.TEXT_KEY.PRESET_DEFAULT_NAME)

	return string.format(defaultName, slotId)
end

AppearanceFacePresetService.SOURCE = "appearance_face"
AppearanceFacePresetService.STANDARD_SOURCE = "avatar_face"
AppearanceFacePresetService.SAVE_TYPE = {
	MAKEUP = 2,
	FACE = 1
}
AppearanceFacePresetService.CREATION_PRESET_ICON = "$UI_Img_Avatar_PhotographRoom_GeneralPresetPlaceholderFemale.png"

function AppearanceFacePresetService.getPresetDefaultIcon(category, slotId, hasContent)
	if category == "face" and slotId == 1 and hasContent then
		return AppearanceFacePresetService.CREATION_PRESET_ICON
	end
end

local function categoryForType(saveType)
	if saveType == 1 then
		return "face"
	end

	if saveType == 2 then
		return "makeupCustom"
	end
end

local function getCustom(player, category)
	if not player then
		return nil
	end

	if category == "face" then
		return player.avatarConfigCustom
	end

	if category == "makeupCustom" then
		return player.makeUpCustom
	end
end

local function isConfiguredSlot(category, slotId)
	if type(slotId) ~= "number" or slotId < 1 or slotId % 1 ~= 0 then
		return false
	end

	local config = AppearanceCustomData[slotId]

	if not config then
		return false
	end

	local prefix = category == "face" and "face" or "makeUp"

	return config[prefix .. "CostType"] ~= nil and config[prefix .. "CostNum"] ~= nil
end

function AppearanceFacePresetService.getPresetDisplayData(player, category, slotId)
	local custom = getCustom(player, category)
	local preset = custom and custom[slotId]
	local hasContent = false

	if preset then
		if category == "face" then
			hasContent = type(preset.avatarConfig) == "string" and preset.avatarConfig ~= ""
		else
			hasContent = PresetUtils.hasMakeupPreset(preset)
		end
	end

	local name = hasContent and preset.customName or ""
	local results = presetDisplayResults[player]
	local result = results and results[displayResultKey(category, slotId)]

	if result then
		local content = preset and (category == "face" and preset.avatarConfig or preset.makeupSnapshot)

		if not hasContent or not result.deleted and name == result.name or content ~= result.previousContent then
			clearDisplayResult(player, category, slotId)
		else
			return {
				hasContent = not result.deleted,
				name = result.deleted and "" or result.name
			}
		end
	end

	return {
		hasContent = hasContent,
		name = hasContent and AppearanceFacePresetService.getPresetName(name, slotId) or ""
	}
end

function AppearanceFacePresetService.getSaveSlots(player, saveType)
	local category = categoryForType(saveType)

	if not category then
		return nil, "invalid_save_type"
	end

	local custom = getCustom(player, category) or {}
	local prefix = saveType == 1 and "face" or "makeUp"
	local result = {
		full = false,
		total = 0,
		used = 0,
		items = {}
	}

	for slotId, config in ipairs(AppearanceCustomData) do
		local costItemId, costNum = config[prefix .. "CostType"], config[prefix .. "CostNum"]

		if costItemId ~= nil and costNum ~= nil then
			local unlocked = custom[slotId] ~= nil or costNum == 0
			local display = AppearanceFacePresetService.getPresetDisplayData(player, category, slotId)
			local hasContent = unlocked and display.hasContent or false

			result.items[#result.items + 1] = {
				id = slotId,
				slotId = slotId,
				category = category,
				unlocked = unlocked,
				hasContent = hasContent,
				name = hasContent and display.name or pg.getGameString(AppearanceFacePresetService.TEXT_KEY.PRESET_UNSET),
				costItemId = not unlocked and costItemId or nil,
				costNum = not unlocked and costNum or nil,
				state = not unlocked and 2 or hasContent and 0 or 1
			}

			if not unlocked then
				break
			end

			result.total = result.total + 1

			if hasContent then
				result.used = result.used + 1
			end
		end
	end

	result.full = result.total > 0 and result.used == result.total

	return result
end

function AppearanceFacePresetService.unlockPresetSlot(player, saveType, slotId, costItemId, costNum, callback)
	local function reject(err)
		if callback then
			callback(false, err)
		end

		return false, err
	end

	if not player or player ~= pg.me then
		return reject("player_changed")
	end

	local category = categoryForType(saveType)

	if not category then
		return reject("invalid_save_type")
	end

	local slots = AppearanceFacePresetService.getSaveSlots(player, saveType)
	local nextSlot = slots.items[#slots.items]

	if not nextSlot or nextSlot.unlocked or nextSlot.slotId ~= slotId then
		return reject("invalid_unlock_slot")
	end

	if nextSlot.costItemId ~= costItemId or nextSlot.costNum ~= costNum then
		return reject("unlock_cost_changed")
	end

	local ItemUtils = require("Common.Utils.ItemUtils")

	if costNum > (ItemUtils.getItemCountById(player, costItemId) or 0) then
		return reject("insufficient_items")
	end

	local pending = slotUnlocks[player]

	if pending and pending[saveType] then
		return reject("unlock_in_progress")
	end

	pending = pending or {}
	slotUnlocks[player] = pending

	local operation = {}

	pending[saveType] = operation

	local finished, timeoutTimer, pollTimer = false

	local function finish(success, err)
		if finished then
			return
		end

		finished = true

		if timeoutTimer then
			TimerManager.removeTimer(timeoutTimer)
		end

		if pollTimer then
			TimerManager.removeTimer(pollTimer)
		end

		if pending[saveType] == operation then
			pending[saveType] = nil
		end

		if callback then
			callback(success, err)
		end
	end

	local function waitForSlot()
		if finished then
			return
		end

		if player ~= pg.me then
			finish(false, "player_changed")

			return
		end

		local custom = getCustom(player, category)

		if custom and custom[slotId] ~= nil then
			finish(true)

			return
		end

		pollTimer = TimerManager.addTimer(0.1, waitForSlot)
	end

	timeoutTimer = TimerManager.addTimer(30, function()
		finish(false, "operation_timeout")
	end)

	local rpc = saveType == 1 and "RPC_CS_UnlockAvatarConfigCustom" or "RPC_CS_UnlockMakeUpCustom"
	local replied = false
	local ok, requestId = pcall(function()
		return player:serverMsg(rpc, function(success)
			if replied or finished then
				return
			end

			replied = true

			if player ~= pg.me then
				finish(false, "player_changed")
			elseif success == true then
				waitForSlot()
			else
				finish(false, "unlock_failed")
			end
		end)
	end)

	if not ok or not requestId then
		if finished then
			return true
		end

		finish(false, "request_failed")

		return false, "request_failed"
	end

	return true
end

local function managePreset(player, category, slotId, name, callback)
	local custom = getCustom(player, category)

	if player ~= pg.me or category ~= "face" and category ~= "makeupCustom" or not isConfiguredSlot(category, slotId) or not custom or not custom[slotId] or not AppearanceFacePresetService.getPresetDisplayData(player, category, slotId).hasContent then
		return false, "invalid_preset"
	end

	local customType = category == "face" and "avatarConfigCustom" or "makeUpCustom"
	local rpc, args

	if name == nil then
		rpc, args = "RPC_CS_UpdateAppearanceCustom", {
			customType,
			slotId,
			false,
			{}
		}
	else
		if type(name) ~= "string" or name == "" or name:match("^%s*$") or #name > 256 then
			return false, "invalid_name"
		end

		rpc, args = "RPC_CS_SetCustomNameAndBag", {
			customType,
			slotId,
			name,
			true
		}
	end

	local finished, timer = false

	local function finish(success, err)
		if finished then
			return
		end

		finished = true

		if timer then
			TimerManager.removeTimer(timer)
		end

		if success and player == pg.me then
			local currentCustom = getCustom(player, category)
			local target = currentCustom and currentCustom[slotId]

			if target then
				local results = presetDisplayResults[player] or {}

				presetDisplayResults[player] = results
				results[displayResultKey(category, slotId)] = {
					deleted = name == nil,
					name = name,
					previousContent = category == "face" and target.avatarConfig or target.makeupSnapshot
				}
			end
		end

		if callback then
			callback(success, err)
		end
	end

	timer = TimerManager.addTimer(30, function()
		finish(false, "operation_timeout")
	end)
	args[#args + 1] = function(success)
		finish(success == true, success ~= true and "save_failed" or nil)
	end

	local ok, requestId = pcall(function()
		return player:serverMsg(rpc, unpack(args))
	end)

	if not ok or not requestId then
		finish(false, "request_failed")

		return false, "request_failed"
	end

	return true
end

function AppearanceFacePresetService.deletePreset(player, category, slotId, callback)
	return managePreset(player, category, slotId, nil, callback)
end

function AppearanceFacePresetService.renamePreset(player, category, slotId, name, callback)
	if name == nil then
		return false, "invalid_name"
	end

	return managePreset(player, category, slotId, name, callback)
end

local function isStandardContext(player, context)
	return player ~= nil and player == pg.me and context.category == "face" and context.slotId == nil
end

function AppearanceFacePresetService.resolveSaveSlot(player, context, saveType)
	local category = categoryForType(saveType)

	if not category then
		return nil, "invalid_save_type"
	end

	if not context then
		return nil, "invalid_preset_context"
	end

	if context.source == AppearanceFacePresetService.STANDARD_SOURCE then
		if not isStandardContext(player, context) then
			return nil, "invalid_preset_context"
		end
	elseif context.source == AppearanceFacePresetService.SOURCE then
		local sourceCustom = getCustom(player, context.category)

		if not sourceCustom or not isConfiguredSlot(context.category, context.slotId) or not sourceCustom[context.slotId] then
			return nil, "source_slot_locked"
		end

		if context.category == category then
			return context.slotId
		end
	else
		return nil, "invalid_preset_context"
	end

	local custom = getCustom(player, category)

	for slotId in ipairs(AppearanceCustomData) do
		if isConfiguredSlot(category, slotId) and custom and custom[slotId] and not AppearanceFacePresetService.getPresetDisplayData(player, category, slotId).hasContent then
			return slotId
		end
	end

	return nil, "no_empty_slot"
end

function AppearanceFacePresetService.capture(ctrl, saveType)
	if not categoryForType(saveType) then
		return nil, "invalid_save_type"
	end

	local scene = ctrl and ctrl.avatarScene
	local entity = scene and scene:getCurEntity()
	local manager = pg.global and pg.global.avatarMgr

	if not scene or scene.expire or not entity or not entity.eModel or not manager then
		return nil, "avatar_not_ready"
	end

	local modelView = entity.eModel.modelModelView

	if not modelView or not modelView.firstLoaded then
		return nil, "avatar_not_ready"
	end

	local ok, packed = pcall(function()
		manager:SetAvatarInstance(entity.eModel)

		local raw = AvatarUtils.getCustomDataStringForSave()

		if type(raw) ~= "string" or raw == "" then
			return nil
		end

		return compressToStr(raw)
	end)

	if not ok or not packed then
		return nil, "invalid_avatar_config"
	end

	if saveType == 1 then
		return PresetUtils.buildFaceConfig(packed)
	end

	return PresetUtils.buildMakeupSnapshot(packed)
end

local function getCosts(player, saveType, slotId, payload)
	if saveType == 2 then
		return {}
	end

	local needsPayment, err = PresetUtils.needsBonePayment(player, payload, slotId)

	if needsPayment == nil then
		return nil, err
	end

	if not needsPayment then
		return {}
	end

	return Utils.calculateWsAvatarConfigConsume()
end

function AppearanceFacePresetService.getSaveCosts(ctrl, saveType)
	if saveType == nil or saveType == 2 then
		return {}
	end

	local context = ctrl.openData and ctrl.openData.appearancePresetContext
	local slotId, err = AppearanceFacePresetService.resolveSaveSlot(pg.me, context, saveType)

	if not slotId then
		return nil, err
	end

	local payload, captureError = AppearanceFacePresetService.capture(ctrl, saveType)

	if not payload then
		return nil, captureError
	end

	return getCosts(pg.me, saveType, slotId, payload)
end

local function getSourceContext(ctrl, session)
	local openData = session and session.openData
	local context = openData and openData.appearancePresetContext

	if not context then
		return nil, "invalid_preset_context"
	end

	if context.source == AppearanceFacePresetService.STANDARD_SOURCE then
		if not isStandardContext(pg.me, context) or openData.isDesignMode ~= true or openData.avatarType ~= AvatarUtils.AVATAR_TYPE.FACE or openData.isFeedTrial == true or ctrl.isFeedTrial == true then
			return nil, "invalid_preset_context"
		end

		return context
	end

	if context.source ~= AppearanceFacePresetService.SOURCE then
		return nil, "invalid_preset_context"
	end

	local custom = getCustom(pg.me, context.category)

	if not custom or not isConfiguredSlot(context.category, context.slotId) or not custom[context.slotId] then
		return nil, "source_slot_locked"
	end

	return context
end

local function validateDraft(draft, allowSelection)
	local record = type(draft) == "table" and saveDrafts[draft]

	if not record then
		return nil, "invalid_preset_context"
	end

	for _, key in ipairs({
		"ctrl",
		"session",
		"player",
		"avatarScene",
		"entity",
		"saveType",
		"payload"
	}) do
		if draft[key] ~= record[key] then
			return nil, "invalid_preset_context"
		end
	end

	local ctrl, session, player = record.ctrl, record.session, record.player

	if not ctrl:isAppearancePresetSessionCurrent(session) or pg.me ~= player then
		return nil, "invalid_preset_context"
	end

	if session.saving or session.confirming or session.finishing or session.pendingPhoto then
		return nil, "save_in_progress"
	end

	local dialog = session.selectionDialog

	if dialog and (not allowSelection or dialog.draft ~= draft and (not dialog.drafts or dialog.drafts[record.saveType] ~= draft)) then
		return nil, "save_in_progress"
	end

	if not ctrl.avatarScene or ctrl.avatarScene ~= record.avatarScene or ctrl.avatarScene.expire or ctrl.avatarScene:getCurEntity() ~= record.entity then
		return nil, "avatar_not_ready"
	end

	local context = session.openData and session.openData.appearancePresetContext

	if context ~= record.sourceContext or context.source ~= record.source or context.category ~= record.sourceCategory or context.slotId ~= record.sourceSlotId then
		return nil, "invalid_preset_context"
	end

	local validContext, err = getSourceContext(ctrl, session)

	if not validContext then
		return nil, err
	end

	return record
end

function AppearanceFacePresetService.createSaveDraft(ctrl, saveType)
	local session = ctrl and ctrl._appearancePresetSession

	if not session or not ctrl:isAppearancePresetSessionCurrent(session) then
		return nil, "invalid_preset_context"
	end

	if session.saving or session.confirming or session.finishing or session.selectionDialog or session.pendingPhoto then
		return nil, "save_in_progress"
	end

	if not categoryForType(saveType) then
		return nil, "invalid_save_type"
	end

	local context, contextError = getSourceContext(ctrl, session)

	if not context then
		return nil, contextError
	end

	local player = pg.me
	local payload, captureError = AppearanceFacePresetService.capture(ctrl, saveType)

	if not payload then
		return nil, captureError or "invalid_avatar_config"
	end

	local costs, costError = getCosts(player, saveType, nil, payload)

	if not costs then
		return nil, costError
	end

	local draft = {
		ctrl = ctrl,
		session = session,
		player = player,
		avatarScene = ctrl.avatarScene,
		entity = ctrl.avatarScene:getCurEntity(),
		saveType = saveType,
		payload = payload,
		costs = costs
	}

	saveDrafts[draft] = {
		ctrl = ctrl,
		session = session,
		player = player,
		avatarScene = draft.avatarScene,
		entity = draft.entity,
		saveType = saveType,
		payload = payload,
		sourceContext = context,
		source = context.source,
		sourceCategory = context.category,
		sourceSlotId = context.slotId
	}

	return draft
end

local function copySlotMap(source)
	local copy = {}

	for key, value in pairs(source or {}) do
		copy[key] = value
	end

	return copy
end

local function captureTarget(target, saveType)
	local result = {
		target = target,
		name = target.customName
	}

	if saveType == 1 then
		result.content = target.avatarConfig
	else
		result.content = target.makeupSnapshot
		result.customShow = copySlotMap(target.customShow)
		result.makeUpInfo = copySlotMap(target.makeUpInfo)
	end

	return result
end

local function sameSlotMap(left, right)
	right = right or {}

	for key, value in pairs(left) do
		if right[key] ~= value then
			return false
		end
	end

	for key, value in pairs(right) do
		if left[key] ~= value then
			return false
		end
	end

	return true
end

local function sameTarget(snapshot, target, saveType)
	if not target or snapshot.target ~= target or snapshot.name ~= target.customName then
		return false
	end

	if saveType == 1 then
		return snapshot.content == target.avatarConfig
	end

	return snapshot.content == target.makeupSnapshot and sameSlotMap(snapshot.customShow, target.customShow) and sameSlotMap(snapshot.makeUpInfo, target.makeUpInfo)
end

local preparedTargets = setmetatable({}, {
	__mode = "k"
})

function AppearanceFacePresetService.prepareSaveForSlot(draft, slotId, name)
	local record, draftError = validateDraft(draft, true)

	if not record then
		return nil, draftError
	end

	local category = categoryForType(record.saveType)
	local custom = getCustom(record.player, category)
	local target = custom and custom[slotId]

	if not isConfiguredSlot(category, slotId) or not target then
		return nil, "target_slot_locked"
	end

	if name == nil or type(name) == "string" and not name:find("%S") then
		name = AppearanceFacePresetService.getPresetDisplayData(record.player, category, slotId).name
	end

	if type(name) ~= "string" then
		return nil, "invalid_name"
	end

	name = AppearanceFacePresetService.getPresetName(name, slotId)

	if #name > 256 then
		return nil, "invalid_name"
	end

	local costs, costError = getCosts(record.player, record.saveType, slotId, record.payload)

	if not costs then
		return nil, costError
	end

	local prepared = {
		explicitSlot = true,
		ctrl = record.ctrl,
		session = record.session,
		player = record.player,
		avatarScene = record.avatarScene,
		entity = record.entity,
		saveType = record.saveType,
		slotId = slotId,
		name = name,
		payload = record.payload,
		costs = costs,
		draft = draft,
		savedInfo = {
			category = category,
			slotId = slotId,
			saveType = record.saveType,
			name = name
		}
	}
	local targetSnapshot = captureTarget(target, record.saveType)

	targetSnapshot.slotId = slotId
	preparedTargets[prepared] = targetSnapshot

	return prepared
end

function AppearanceFacePresetService.prepareSave(ctrl, saveType, requestedSlotId, name)
	local session = ctrl and ctrl._appearancePresetSession

	if not session or not ctrl:isAppearancePresetSessionCurrent(session) then
		return nil, "invalid_preset_context"
	end

	if session.saving or session.confirming or session.finishing or session.selectionDialog or session.pendingPhoto then
		return nil, "save_in_progress"
	end

	local context = session.openData.appearancePresetContext
	local slotId, slotError = AppearanceFacePresetService.resolveSaveSlot(pg.me, context, saveType)

	if not slotId then
		return nil, slotError
	end

	if requestedSlotId ~= nil and requestedSlotId ~= slotId then
		return nil, "invalid_target_slot"
	end

	local draft, draftError = AppearanceFacePresetService.createSaveDraft(ctrl, saveType)

	if not draft then
		return nil, draftError
	end

	local prepared, prepareError = AppearanceFacePresetService.prepareSaveForSlot(draft, slotId, name)

	if prepared then
		prepared.explicitSlot = false
	end

	return prepared, prepareError
end

local function runOperation(player, rpc, args, callback)
	local finished, timeoutTimer, pollTimer = false

	local function finish(success, err)
		if finished then
			return
		end

		finished = true

		if timeoutTimer then
			TimerManager.removeTimer(timeoutTimer)
		end

		if pollTimer then
			TimerManager.removeTimer(pollTimer)
		end

		callback(success, err)
	end

	timeoutTimer = TimerManager.addTimer(60, function()
		finish(false, "operation_timeout")
	end)

	local function poll(operationId)
		if finished then
			return
		end

		if pg.me ~= player then
			finish(false, "player_changed")

			return
		end

		local ok, rid = pcall(function()
			return player:serverMsg("RPC_CS_GetFacePresetOperationResult", operationId, function(state, err)
				if finished then
					return
				end

				if state == 1 then
					finish(true)
				elseif state == 2 or state == -1 then
					finish(false, err or "save_failed")
				else
					pollTimer = TimerManager.addTimer(0.5, function()
						poll(operationId)
					end)
				end
			end)
		end)

		if not ok or not rid then
			finish(false, "request_failed")
		end
	end

	args[#args + 1] = function(accepted, operationId, err)
		if finished then
			return
		end

		if accepted and operationId then
			poll(operationId)
		else
			finish(false, err or "save_failed")
		end
	end

	local ok, rid = pcall(function()
		return player:serverMsg(rpc, unpack(args))
	end)

	if not ok or not rid then
		finish(false, "request_failed")

		return false, "request_failed"
	end

	return true
end

function AppearanceFacePresetService.restoreMakeupSuitPreview(ctrl)
	local preview = ctrl and ctrl._makeupSuitPreview

	if not preview then
		return true
	end

	local scene = ctrl.avatarScene
	local entity = scene and scene:getCurEntity()

	if scene ~= preview.scene or not scene or scene.expire or entity ~= preview.entity then
		ctrl._makeupSuitPreview = nil

		return true
	end

	local modelView = entity.eModel and entity.eModel.modelModelView
	local manager = pg.global.avatarMgr

	if not modelView or not modelView.firstLoaded or not modelView.modelInfo or not manager then
		return false, "avatar_not_ready"
	end

	local ok, applied, err = pcall(function()
		manager:SetAvatarInstance(entity.eModel)

		local current = compressToStr(AvatarUtils.getCustomDataStringForSave())
		local restored, mergeError = PresetUtils.mergeMakeupConfig(current, preview.config.avatarConfig)

		if not restored then
			return false, mergeError
		end

		manager:InitAvatarPart()
		manager.avatarMakeup:ResetMakeupVisualStateBeforeImport()
		modelView.modelInfo:ParseCustomData(decompressFromStr(restored))
		modelView.modelInfo:ProcessCustomData()
		manager:SetAvatarInstance(entity.eModel)
		manager:InitAvatarPart()
		manager.avatarMakeup:ClearPreviewDecal()
		modelView:RefreshDecal()
		modelView:RefreshMakeup()

		return true
	end)

	if not ok then
		return false, "makeup_preview_failed: " .. tostring(applied)
	end

	if not applied then
		return false, err or "makeup_preview_failed"
	end

	ctrl._makeupSuitPreview = nil

	return true
end

function AppearanceFacePresetService.previewMakeupSuit(ctrl, model, data)
	local restored, restoreError = AppearanceFacePresetService.restoreMakeupSuitPreview(ctrl)

	if not restored then
		return nil, restoreError
	end

	if not data.owned then
		local original, captureError = AppearanceFacePresetService.capture(ctrl, 1)

		if not original then
			return nil, captureError
		end

		local config, decodeError = PresetUtils.decodeConfig(original)

		if not config then
			return nil, decodeError
		end

		ctrl._makeupSuitPreview = {
			scene = ctrl.avatarScene,
			entity = ctrl.avatarScene:getCurEntity(),
			config = {
				templateId = config.templateId,
				presetKey = config.presetKey,
				avatarConfig = original
			}
		}
	end

	local MakeupComponent = require("Guis.Panels.Avatar.Component.MakeupComponent")
	local ok, applied, err = pcall(MakeupComponent.previewMakeupSuit, ctrl.avatarScene, ctrl.curPresetKey, model, data)

	if not ok or not applied then
		AppearanceFacePresetService.restoreMakeupSuitPreview(ctrl)

		return nil, not ok and "makeup_preview_failed: " .. tostring(applied) or err
	end

	local snapshot, captureError = AppearanceFacePresetService.capture(ctrl, 2)

	if not snapshot then
		AppearanceFacePresetService.restoreMakeupSuitPreview(ctrl)
	end

	return snapshot, captureError
end

local makeupSuitSaves = setmetatable({}, {
	__mode = "k"
})

function AppearanceFacePresetService.isMakeupSuitSavePending(player)
	return makeupSuitSaves[player] ~= nil
end

function AppearanceFacePresetService.saveMakeupSuit(player, snapshot, suitId, callback)
	if player ~= pg.me then
		return false, "player_changed"
	end

	local state = makeupSuitSaves[player]
	local request = {
		snapshot = snapshot,
		suitId = suitId,
		callback = callback
	}

	if state then
		local previous = state.queued

		state.queued = request

		if previous and previous.callback then
			previous.callback(false, "superseded")
		end

		return true
	end

	state = {}
	makeupSuitSaves[player] = state

	local dispatch

	function dispatch(current)
		return runOperation(player, "RPC_CS_ApplyMakeupSuit", {
			current.snapshot,
			current.suitId
		}, function(success, err)
			local queued = state.queued

			state.queued = nil

			if not queued then
				makeupSuitSaves[player] = nil
			end

			if current.callback then
				current.callback(success, err)
			end

			if queued then
				if pg.me ~= player then
					makeupSuitSaves[player] = nil

					if queued.callback then
						queued.callback(false, "player_changed")
					end
				else
					dispatch(queued)
				end
			end
		end)
	end

	return dispatch(request)
end

function AppearanceFacePresetService.submitPreparedSave(prepared, callback)
	if type(prepared) ~= "table" then
		return false, "invalid_preset_context"
	end

	local ctrl, session, player = prepared.ctrl, prepared.session, prepared.player

	if not ctrl or not ctrl:isAppearancePresetSessionCurrent(session) or pg.me ~= player then
		return false, "invalid_preset_context"
	end

	if session.saving or session.confirming or session.finishing or session.selectionDialog or session.pendingPhoto then
		return false, "save_in_progress"
	end

	if not ctrl.avatarScene or ctrl.avatarScene ~= prepared.avatarScene or ctrl.avatarScene.expire or ctrl.avatarScene:getCurEntity() ~= prepared.entity then
		return false, "avatar_not_ready"
	end

	local record, draftError = validateDraft(prepared.draft, false)

	if not record then
		return false, draftError
	end

	for _, key in ipairs({
		"ctrl",
		"session",
		"player",
		"avatarScene",
		"entity",
		"saveType",
		"payload"
	}) do
		if prepared[key] ~= record[key] then
			return false, "invalid_preset_context"
		end
	end

	local slotId = prepared.slotId

	if prepared.explicitSlot then
		local category = categoryForType(prepared.saveType)
		local custom = getCustom(player, category)
		local target = custom and custom[slotId]
		local targetSnapshot = preparedTargets[prepared]

		if not isConfiguredSlot(category, slotId) or not targetSnapshot or targetSnapshot.slotId ~= slotId or not sameTarget(targetSnapshot, target, prepared.saveType) then
			return false, "target_slot_changed"
		end
	else
		local resolved = AppearanceFacePresetService.resolveSaveSlot(player, session.openData.appearancePresetContext, prepared.saveType)

		if resolved ~= slotId then
			return false, "target_slot_changed"
		end
	end

	local costs, costError = getCosts(player, prepared.saveType, slotId, prepared.payload)

	if not costs then
		return false, costError
	end

	for itemId, count in pairs(costs) do
		if count > (prepared.costs[itemId] or 0) then
			return false, "save_cost_changed"
		end
	end

	session.saving = true

	return runOperation(player, "RPC_CS_SaveAndApplyFacePreset", {
		prepared.saveType,
		slotId,
		prepared.name,
		prepared.payload
	}, function(success, err)
		session.saving = false

		if success then
			clearDisplayResult(player, categoryForType(prepared.saveType), slotId)
		end

		if callback then
			callback(success, err, prepared.savedInfo)
		end
	end)
end

function AppearanceFacePresetService.syncAppliedPreview(avatarScene, expectedEntity)
	local ShareService = require("Guis.Utils.AvatarShareService")
	local currentScene, entity = ShareService.getAvatarContext()

	if not avatarScene or currentScene ~= avatarScene or avatarScene.expire or not entity or expectedEntity and expectedEntity ~= entity then
		return false, "avatar_not_ready"
	end

	local config, err = PresetUtils.decodeConfig(pg.me.avatarConfig)

	if not config then
		return false, err
	end

	local ok, applied, applyError = pcall(ShareService.applyFacePreview, {
		templateId = config.templateId,
		presetKey = pg.game.avatar:getPresetKey(pg.me),
		avatarConfig = pg.me.avatarConfig
	})

	if not ok or not applied then
		return false, applyError or "preview_failed"
	end

	avatarScene:recordInitialAvatarFaceConfig()

	return true
end

function AppearanceFacePresetService.applyPreset(player, category, slotId, callback)
	local saveType = category == "face" and 1 or category == "makeupCustom" and 2 or nil
	local custom = getCustom(player, category)

	if not saveType or player ~= pg.me or not isConfiguredSlot(category, slotId) or not custom or not custom[slotId] or not AppearanceFacePresetService.getPresetDisplayData(player, category, slotId).hasContent then
		if callback then
			callback(false, "invalid_preset")
		end

		return false, "invalid_preset"
	end

	local ShareService = require("Guis.Utils.AvatarShareService")
	local avatarScene, entity = ShareService.getAvatarContext()
	local snapshot = custom[slotId].makeupSnapshot
	local isLegacyMakeup = saveType == 2 and (type(snapshot) ~= "string" or snapshot == "")

	return runOperation(player, "RPC_CS_ApplyFacePreset", {
		saveType,
		slotId
	}, function(success, err)
		if success and not isLegacyMakeup then
			local synced, syncError = AppearanceFacePresetService.syncAppliedPreview(avatarScene, entity)

			if not synced then
				err = syncError
			end
		end

		if callback then
			callback(success, err)
		end
	end)
end

return AppearanceFacePresetService
