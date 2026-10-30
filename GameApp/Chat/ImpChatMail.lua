-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Chat\\ImpChatMail.lua

local ChatSystem = require("GameApp.Chat.ChatSystem")

if getmetatable(ChatSystem) == "IMP_MODULE" then
	return
end

local MessageName = require("Const.MessageName")
local Const = require("Common.Const.Const")
local IDManager = require("Core.Common.IDManager")
local MailData = require("Data.mail_data")
local ClientRepo = require("Core.Client.ClientRepo")
local MailContentRequestHelper = require("GameApp.Chat.MailContentRequestHelper")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ItemData = require("Data.item_data")
local DropUtils = require("Common.Utils.DropUtils")
local Utils = require("Common.Utils.Utils")
local logger = require("Core.Log.LoggerManager").getLogger("ImpChatMail")

function ChatSystem:normalizeMailId(mailId)
	if mailId == nil then
		return nil
	end

	local normalizedMailId = tostring(mailId)

	if string.isNilOrEmpty(normalizedMailId) then
		return nil
	end

	return normalizedMailId
end

function ChatSystem:findVisibleMail(mailId)
	mailId = self:normalizeMailId(mailId)

	if string.isNilOrEmpty(mailId) or not Utils.isTable(self.mailList) then
		return nil
	end

	for _, mail in ipairs(self.mailList) do
		if self:normalizeMailId(mail and (mail.MailId or mail.id)) == mailId then
			return mail
		end
	end

	return nil
end

function ChatSystem:applyVisibleMailSideEffects(mail, options)
	options = options or {}

	if not self:handleMailConfig(mail) and not options.skipFetchContent then
		self:requestMailContent(mail.MailId or mail.id)
	end
end

function ChatSystem:requestMailContent(mailId, options)
	return MailContentRequestHelper.request(self, mailId, options)
end

function ChatSystem:markMailsLanguageDirty()
	self.mailLanguageDirty = true
	self.mailLanguageVersion = self.mailLanguageVersion + 1
end

function ChatSystem:ensureMailsForLanguage()
	if not self.mailLanguageDirty or self.mailListRequestPending or not pg.me then
		return false
	end

	self.mailListRequestPending = true
	self.mailListRequestVersion = self.mailLanguageVersion

	pg.me:getUserMailList(0, true)

	return true
end

function ChatSystem:ensureRawMails()
	if not Utils.isTable(self.rawMailList) then
		self.rawMailList = {}
	end

	if not Utils.isTable(self.rawMailById) then
		self.rawMailById = {}

		for _, mail in ipairs(self.rawMailList) do
			local mailId = self:normalizeMailId(mail and (mail.MailId or mail.id))

			if not string.isNilOrEmpty(mailId) then
				self.rawMailById[mailId] = mail
			end
		end
	end

	return self.rawMailList, self.rawMailById
end

function ChatSystem:upsertRawMail(mail, insertToFront)
	if not Utils.isTable(mail) then
		return false
	end

	local mailId = self:normalizeMailId(mail.MailId or mail.id)

	if string.isNilOrEmpty(mailId) then
		return false
	end

	mail.MailId = mailId
	mail.id = mailId

	local rawList, rawById = self:ensureRawMails()
	local oldMail = rawById[mailId]

	if oldMail then
		for key, value in pairs(mail) do
			oldMail[key] = value
		end

		return false
	end

	rawById[mailId] = mail

	if insertToFront then
		table.insert(rawList, 1, mail)
	else
		rawList[#rawList + 1] = mail
	end

	return true
end

function ChatSystem:removeRawMailById(mailId)
	mailId = self:normalizeMailId(mailId)

	if string.isNilOrEmpty(mailId) then
		return false
	end

	local rawList, rawById = self:ensureRawMails()

	rawById[mailId] = nil

	MailContentRequestHelper.remove(self, mailId)

	local removed = false

	for index = #rawList, 1, -1 do
		local mail = rawList[index]

		if self:normalizeMailId(mail and (mail.MailId or mail.id)) == mailId then
			table.remove(rawList, index)

			removed = true

			break
		end
	end

	local _h = ChatSystem._platformHooks

	if _h and _h.onMailRemoved then
		_h.onMailRemoved(self, mailId)
	end

	return removed
end

function ChatSystem:rebuildVisibleMails(options)
	options = options or {}

	local rawList = self:ensureRawMails()
	local _h = ChatSystem._platformHooks

	self.mailList = {}

	for _, mail in ipairs(rawList) do
		local shouldShow = true
		local decision

		if _h and _h.shouldShowMail then
			shouldShow, decision = _h.shouldShowMail(self, mail)
		end

		if shouldShow then
			self.mailList[#self.mailList + 1] = mail

			self:applyVisibleMailSideEffects(mail, options)

			if _h and _h.onVisibleMailPending then
				_h.onVisibleMailPending(self, mail, decision)
			end
		end
	end
end

function ChatSystem:updateMailGiftState(mailId)
	mailId = self:normalizeMailId(mailId)

	if string.isNilOrEmpty(mailId) then
		return false
	end

	local _, rawById = self:ensureRawMails()
	local changed = false
	local rawMail = rawById[mailId]

	if rawMail and rawMail.Params then
		rawMail.Params.giftReceived = true
		rawMail.Params.haveRead = true
		changed = true
	end

	local visibleMail = self:findVisibleMail(mailId)

	if visibleMail and visibleMail.Params and visibleMail ~= rawMail then
		visibleMail.Params.giftReceived = true
		visibleMail.Params.haveRead = true
		changed = true
	end

	return changed
end

function ChatSystem:recvUserMailListCallback(result, resp, isInit)
	self.mailListRequestPending = false

	local requestVersion = self.mailListRequestVersion

	self.mailListRequestVersion = nil

	if result.status and resp.MailList then
		if requestVersion == self.mailLanguageVersion then
			self.mailLanguageDirty = false
		end

		self.mailContent = {}
		self.mailContentPending = {}
		self.mailContentQueue = {}
		self.mailContentDrainScheduled = false
		self.rawMailList = {}
		self.rawMailById = {}

		for _, item in ipairs(resp.MailList) do
			item.MailId = IDManager.bytesToStr(item.MailId)
			item.id = item.MailId

			self:upsertRawMail(item, false)
		end

		if isInit then
			self:rebuildVisibleMails({
				skipFetchContent = true
			})
		else
			self:rebuildVisibleMails()
		end

		facade:SendMessageCommand(MessageName.CHAT_RED_DOT_UPDATE)
		facade:SendMessageCommand(MessageName.RECV_MAIL)
	end
end

function ChatSystem:recvMailContentInner(serverMailId, content)
	if not serverMailId then
		return false
	end

	local mailId = IDManager.bytesToStr(serverMailId)

	mailId = self:normalizeMailId(mailId)

	if string.isNilOrEmpty(mailId) then
		return false
	end

	MailContentRequestHelper.complete(self, mailId)

	content = content or ""

	if string.isNilOrEmpty(content) then
		local mail = self:findVisibleMail(mailId)

		if mail and self:handleMailConfig(mail) then
			content = mail.Content
		end
	end

	self.mailContent[mailId] = content

	return true
end

function ChatSystem:recvMailContentCallback(result, resp, requestMailId)
	if not result.status then
		MailContentRequestHelper.complete(self, requestMailId)

		return
	end

	local success = self:recvMailContentInner(resp and resp.MailId, resp and resp.Content)

	if success then
		facade:SendMessageCommand(MessageName.RECV_MAIL_CONTENT)
	end
end

function ChatSystem:recvMailContentsCallback(result, resp, requestMailIds)
	if not Utils.isTable(requestMailIds) then
		return
	end

	local contents = result.status and resp and resp.Contents or nil

	if not contents then
		for _, requestMailId in ipairs(requestMailIds) do
			MailContentRequestHelper.complete(self, requestMailId)
		end

		return
	end

	local changed = false

	for serverMailId, content in pairs(contents) do
		changed = self:recvMailContentInner(serverMailId, content) or changed
	end

	if changed then
		facade:SendMessageCommand(MessageName.RECV_MAIL_CONTENT)
	end
end

function ChatSystem:recvMailGift(mailIds)
	for _, mailId in ipairs(mailIds) do
		self:updateMailGiftState(mailId)
	end

	facade:SendMessageCommand(MessageName.RECV_MAIL)
	facade:SendMessageCommand(MessageName.CHAT_RED_DOT_UPDATE)
end

function ChatSystem:recvDeleteMail(status, errmsg, mailIds)
	if status then
		for _, mailId in ipairs(mailIds) do
			local normalizedMailId = self:normalizeMailId(mailId)

			if normalizedMailId then
				self:removeRawMailById(normalizedMailId)

				self.mailContent[normalizedMailId] = nil

				MailContentRequestHelper.remove(self, normalizedMailId)
			end
		end

		self:rebuildVisibleMails({
			skipFetchContent = true
		})
		facade:SendMessageCommand(MessageName.RECV_MAIL)
		facade:SendMessageCommand(MessageName.CHAT_RED_DOT_UPDATE)
	end
end

function ChatSystem:recvDeleteReadedMail(status, errmsg, deleteList)
	if status then
		local mailIds = {}

		for _, item in ipairs(deleteList) do
			local mailId = IDManager.bytesToStr(item)

			table.insert(mailIds, mailId)
		end

		self:recvDeleteMail(status, errmsg, mailIds)
	end
end

function ChatSystem:recvNewMailNotice(mailInfo)
	local playAni = #self.mailList == 0
	local oldVisibleCount = #self.mailList
	local newMails = {}

	for _, mail in ipairs(mailInfo) do
		mail.MailId = IDManager.bytesToStr(mail.MailId)
		mail.id = mail.MailId

		if self:upsertRawMail(mail, true) then
			newMails[#newMails + 1] = mail
		end

		if not string.isNilOrEmpty(mail.MailId) and mail.Content ~= nil then
			self.mailContent[mail.MailId] = mail.Content
		end
	end

	self:rebuildVisibleMails()

	for _, mail in ipairs(newMails) do
		self:pushImportantMailQuickUseItem(mail)
	end

	local indexDiff = math.max(#self.mailList - oldVisibleCount, 0)

	facade:SendMessageCommand(MessageName.CHAT_RED_DOT_UPDATE)
	facade:SendMessageCommand(MessageName.RECV_MAIL, {
		indexDiff = indexDiff,
		playAni = playAni
	})
end

function ChatSystem:getMailFirstItemId(mail)
	local gifts = self:getMailGiftInfo(mail)

	if not Utils.isTable(gifts) then
		return nil
	end

	local itemId
	local itemQuality = 0

	if Utils.isTable(gifts.items) then
		for id in pairs(gifts.items) do
			id = tonumber(id)

			local itemConfig = id and ItemData[id]
			local quality = itemConfig and itemConfig.quality or 0

			if itemConfig and (not itemId or itemQuality < quality or quality == itemQuality and id < itemId) then
				itemId = id
				itemQuality = quality
			end
		end
	end

	if Utils.isTable(gifts.rewardIds) then
		for _, rewardId in ipairs(gifts.rewardIds) do
			local rewardIdNumber = tonumber(rewardId)

			if rewardIdNumber then
				local idNumDict = DropUtils.genDropDisplayInfo(rewardIdNumber)

				for id in pairs(idNumDict) do
					id = tonumber(id)

					local itemConfig = id and ItemData[id]
					local quality = itemConfig and itemConfig.quality or 0

					if itemConfig and (not itemId or itemQuality < quality or quality == itemQuality and id < itemId) then
						itemId = id
						itemQuality = quality
					end
				end
			end
		end
	end

	if Utils.isTable(gifts.customData) then
		for _, item in ipairs(gifts.customData) do
			if Utils.isTable(item) then
				local id = tonumber(item.itemId or item.itemid)
				local itemConfig = id and ItemData[id]
				local quality = itemConfig and itemConfig.quality or 0

				if itemConfig and (not itemId or itemQuality < quality or quality == itemQuality and id < itemId) then
					itemId = id
					itemQuality = quality
				end
			end
		end
	end

	return itemId
end

function ChatSystem:pushImportantMailQuickUseItem(mail)
	if not mail or not Utils.isTable(mail.Params) or tonumber(mail.Params.importMailType) ~= 1 then
		return
	end

	local itemId = self:getMailFirstItemId(mail)

	if not itemId then
		return
	end

	pg.global.ui.tips:pushQuickUseItem({
		isImportantMail = true,
		num = 1,
		id = itemId,
		mailId = mail.MailId
	})
end

function ChatSystem:recvNewGroupMailNotice(result)
	return
end

function ChatSystem:localizeMailFormatParams(...)
	local paramCount = select("#", ...)
	local formatParams = {
		...
	}

	for index = 1, paramCount do
		local param = formatParams[index]
		local paramType = type(param)

		if Utils.isTable(param) and param.localizationTextId then
			formatParams[index] = pg.getLocalizationText(param.localizationTextId) or ""
		elseif paramType == "number" or paramType == "string" then
			local paramText = tostring(param)
			local localizedText = pg.getLocalizationText(paramText)

			if localizedText ~= paramText then
				formatParams[index] = localizedText
			end
		end
	end

	return table.unpack(formatParams, 1, paramCount)
end

function ChatSystem:handleMailConfig(mail)
	local configId = tonumber(mail.SrcId)

	if configId and MailData[configId] then
		local mailData = MailData[configId]

		if not Utils.isTable(mail.Params) then
			mail.Params = {}
		end

		if not mail.SrcName or mail.SrcName == "" then
			mail.SrcName = pg.getLocalizationText(mailData.sender)
		end

		if not mail.Title or mail.Title == "" then
			mail.Title = pg.getLocalizationText(mailData.title)
		end

		if mailData.importMailType == 1 then
			mail.Params.importMailType = 1
		end

		if not string.isNilOrEmpty(mailData.bannerPicture) then
			mail.Params.bannerPicture = mailData.bannerPicture
		end

		if not string.isNilOrEmpty(mailData.bgPicture) then
			mail.Params.bgPicture = mailData.bgPicture
		end

		if not mail.Content or mail.Content == "" then
			mail.Content = pg.getLocalizationText(mailData.text)

			local gifts = self:getMailGiftInfo(mail)

			if gifts and Utils.isTable(gifts.customData) and gifts.customData.formatParam then
				local success, formatParam = pcall(ClientRepo.protoCodec.decode, ClientRepo.protoCodec, gifts.customData.formatParam)

				if success and Utils.isTable(formatParam) then
					local formatSuccess, content = pcall(function()
						if configId == Const.MAIL_ID.CAPTURE_ABNORMAL_RECYCLE_NOTICE then
							formatParam[1] = LuaUIUtils.timeStampToUtcString(formatParam[1])
						end

						return string.format(mail.Content, self:localizeMailFormatParams(table.unpack(formatParam, 1, #formatParam)))
					end)

					if formatSuccess then
						mail.Content = content
					else
						logger:error("Failed to format mail content, mailId=%s, srcId=%s", tostring(mail.MailId), tostring(mail.SrcId))
					end
				else
					logger:error("Invalid mail format params, mailId=%s, srcId=%s", tostring(mail.MailId), tostring(mail.SrcId))
				end
			end

			if configId == Const.MAIL_ID.MONTHCARD_EXPIRE_STOREWARD_MAIL and gifts and Utils.isTable(gifts.customData) then
				local days = gifts.customData.storeDailys or 0

				mail.Content = string.gsub(mail.Content, "{0}", tostring(days))
			end
		end

		self.mailContent[mail.MailId] = mail.Content

		return true
	end

	if not string.isNilOrEmpty(mail.SrcName) and tonumber(mail.SrcName) then
		local srcName = pg.getLocalizationText(tonumber(mail.SrcName))

		mail.SrcName = srcName

		return false
	end

	return false
end
