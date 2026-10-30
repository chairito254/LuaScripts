-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\EntityMixin\\ImpPlatformClientFriendComponent.lua

local M = {}
local EventConst = require("Const.EventConst")
local PlatformShellInviteService = require("SDK.Platform.PlatformShellInviteService")
local PlatformShellConst = require("Common.Const.PlatformShellConst")
local PlatformIdentityUtils = require("SDK.Platform.PlatformIdentityUtils")
local PlatformSocialService = require("SDK.Platform.PlatformSocialService")
local Time = require("Core.Common.Time")
local json = require("json")
local PsnAuthConst = require("Common.Const.PlatformPsnAuthConst")
local PlatformBridgeLuaFacade = CS.FunPlus.WorldX.SDK.Platform.PlatformBridgeLuaFacade

M.platformAttributes = {
	"platformUserId",
	"platformFamily",
	"platformDisplayName",
	"platformUGCSwitch"
}
M.PSN_BLOCK_REQUEST_COOLDOWN = 15

function M:fetchAndSyncPsnAuthCode(context)
	if PlatformIdentityUtils.getCurrentPlatformFamily() ~= PlatformIdentityUtils.Family.PlayStation then
		return false
	end

	if self.destroyed or pg.me ~= self then
		return false
	end

	local requestId = context and context.authRequestId

	if requestId ~= nil and (type(requestId) ~= "string" or requestId == "") then
		return false
	end

	if requestId ~= nil and self._psnAuthCompletedRequestId == requestId then
		return false
	end

	local fetch = self._psnAuthCodeFetch

	if fetch ~= nil then
		if requestId ~= nil then
			fetch.requestId = requestId
		end

		return true
	end

	if not PlatformBridgeLuaFacade or not PlatformBridgeLuaFacade.FetchPlatformAuthorizationCode then
		return false
	end

	fetch = {
		requestId = requestId
	}
	self._psnAuthCodeFetch = fetch

	PlatformBridgeLuaFacade.FetchPlatformAuthorizationCode(PsnAuthConst.AUTH_CODE_TIMEOUT_MS, function(ok, errCode, _msg, payload)
		if self._psnAuthCodeFetch ~= fetch or self.destroyed or pg.me ~= self then
			return
		end

		self._psnAuthCodeFetch = nil
		self._psnAuthCompletedRequestId = fetch.requestId

		if ok ~= true then
			print(string.format("[PSN_AUTH] FetchPlatformAuthorizationCode failed errCode=%s", tostring(errCode)))

			return
		end

		local decoded, auth = pcall(json.decode, payload)

		if not decoded or type(auth) ~= "table" or type(auth.authCode) ~= "string" or auth.authCode == "" then
			print("[PSN_AUTH] FetchPlatformAuthorizationCode invalid payload")

			return
		end

		auth.authRequestId = fetch.requestId

		self:syncPsnAuthCode(json.encode(auth))
	end)

	return true
end

function M.appendAttributesUnique(attributesList, attributes)
	if not attributesList then
		return
	end

	local existing = {}

	for _, attr in ipairs(attributesList) do
		existing[attr] = true
	end

	for _, attr in ipairs(attributes) do
		if not existing[attr] then
			table.insert(attributesList, attr)

			existing[attr] = true
		end
	end
end

function M:appendFriendQueryAttributes(attributesList)
	M.appendAttributesUnique(attributesList, M.platformAttributes)
end

function M:FriendService_onSpecialFriendSet(specialFriendId)
	local oldUid = pg.game.chat.specialFriendUId

	if pg.global and pg.global.eventEmitter then
		pg.global.eventEmitter:emit(EventConst.PLATFORM_ACHIEVEMENT_VARIANT_TRIGGERED, {
			oldUid = oldUid or "",
			newUid = specialFriendId
		})
	end
end

function M:shouldIgnoreFriendApply(applyId)
	if PlatformIdentityUtils.getCurrentPlatformFamily() ~= PlatformIdentityUtils.Family.PlayStation then
		return false
	end

	local senderInfo = pg.game.chat:getPlayerInfo(applyId)

	return PlatformSocialService:peekPlatformUserBlockedByLocalUser(senderInfo) == true
end

function M:inviteEnterPhotoWorldByShellActivity(uid)
	local targetPlayerInfo = pg.game.chat and pg.game.chat.getPlayerInfo and pg.game.chat:getPlayerInfo(uid) or nil
	local handled = PlatformShellInviteService:sendShellActivityInvite(PlatformShellConst.TokenType.InviteEnterPhotoWorld, targetPlayerInfo) == true

	print(string.format("[PHOTO_SHELL] invite hook uid=%s hasTargetInfo=%s handled(shellPath)=%s", tostring(uid), tostring(targetPlayerInfo ~= nil), tostring(handled)))

	return handled
end

function M:onInit(avtDict)
	if self.uid ~= pg.me.uid or self._psnAuthInitialized then
		return
	end

	self._psnAuthInitialized = true

	M.fetchAndSyncPsnAuthCode(self)
end

function M:RPC_SC_PsnAuthCodeRequired(context)
	if self.uid ~= pg.me.uid then
		return
	end

	M.fetchAndSyncPsnAuthCode(self, context)
end

function M:onPsnBlockStatesUpdated()
	local ImpPlatformSpeechSystem = require("SDK.Platform.UIBridge.ImpPlatformSpeechSystem")

	ImpPlatformSpeechSystem.syncCurrentSpeechRoomVoicePolicy()
end

function M.getPsnBlockStateTime()
	return Time.realSecondCache or os.time()
end

function M:RPC_SC_SyncPsnBlockStates(response)
	if type(response) ~= "table" then
		return
	end

	self._psnBlockStates = self._psnBlockStates or {}

	local states = response.blockStates or response

	self.logger:info("psn_block_states_received count=%s", tostring(type(states) == "table" and #states or "not_table"))

	if type(states) ~= "table" then
		return
	end

	local updateTime = M.getPsnBlockStateTime()

	for _, entry in ipairs(states) do
		if entry.accountId then
			local accountId = tostring(entry.accountId)

			self._psnBlockStates[accountId] = {
				relation = entry.relation or "NONE",
				updateTime = updateTime
			}
		end
	end

	if #states == 0 then
		return
	end

	if type(pg.game.chat.refreshPlatformFilteredChatMessages) == "function" then
		pg.game.chat:refreshPlatformFilteredChatMessages("psn_block_states_updated")
	end

	M.onPsnBlockStatesUpdated(self)
end

function M:getPsnBlockRelation(accountId, ttl)
	if string.isNilOrEmpty(accountId) or self._psnBlockStates == nil then
		return nil
	end

	accountId = tostring(accountId)

	local state = self._psnBlockStates[accountId]

	if type(state) ~= "table" then
		return state
	end

	local expired = false

	if type(ttl) == "number" and type(state.updateTime) == "number" then
		expired = ttl <= M.getPsnBlockStateTime() - state.updateTime
	end

	return state.relation, expired
end

function M:isPsnBlockedBy(accountId)
	local relation = M.getPsnBlockRelation(self, accountId)

	return relation == "BLOCKED_BY" or relation == "BLOCKED_BOTH"
end

function M:requestPsnBlockStates(targetAccountIds, forceCheck, cooldownOverride)
	if PlatformIdentityUtils.getCurrentPlatformFamily() ~= PlatformIdentityUtils.Family.PlayStation then
		return
	end

	if type(targetAccountIds) ~= "table" or #targetAccountIds == 0 then
		return
	end

	local effectiveCooldown = type(cooldownOverride) == "number" and cooldownOverride >= 0 and cooldownOverride or M.PSN_BLOCK_REQUEST_COOLDOWN
	local now = M.getPsnBlockStateTime()
	local accountIds = {}
	local seen = {}
	local selfAccountId = self.platformUserId and tostring(self.platformUserId) or nil

	self._psnBlockStateLastRequestTime = self._psnBlockStateLastRequestTime or {}

	for _, rawAccountId in ipairs(targetAccountIds) do
		if not string.isNilOrEmpty(rawAccountId) then
			local accountId = tostring(rawAccountId)
			local relation, expired = M.getPsnBlockRelation(self, accountId, effectiveCooldown)
			local lastRequestTime = self._psnBlockStateLastRequestTime[accountId] or 0

			if accountId ~= selfAccountId and not seen[accountId] and (forceCheck or relation == nil or expired) and effectiveCooldown <= now - lastRequestTime then
				seen[accountId] = true
				self._psnBlockStateLastRequestTime[accountId] = now
				accountIds[#accountIds + 1] = accountId
			end
		end
	end

	if #accountIds == 0 then
		return
	end

	self.logger:info("psn_block_request_send count=%s ids=%s", tostring(#accountIds), table.concat(accountIds, ","))
	self:serverMsg("RPC_CS_RequestPsnBlockStates", accountIds)
end

return M
