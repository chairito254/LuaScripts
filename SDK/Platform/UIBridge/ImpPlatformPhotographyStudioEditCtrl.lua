-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\UIBridge\\ImpPlatformPhotographyStudioEditCtrl.lua

local EventConst = require("Common.Const.EventConst")
local TriggerConst = require("Common.Const.TriggerConst")
local ImpPlatformPhotoCtrl = require("SDK.Platform.UIBridge.ImpPlatformPhotoCtrl")
local M = {}

function M:getPhotoAchievementPayload()
	local scene = self:getAvatarScene()

	if not scene or not pg.me then
		return nil
	end

	local friendUids = {}
	local memberSet = scene:getPhotographyStudioMemberSet(self.studioUid)

	for uid in pairs(scene.studioPlayerIds or {}) do
		if tostring(uid) ~= tostring(pg.me.uid) and memberSet[tostring(uid)] and ImpPlatformPhotoCtrl.isFriendPlayerUid(uid) then
			table.insert(friendUids, uid)
		end
	end

	return {
		isPhotoStudio = true,
		friendPlayerUidsInView = friendUids
	}
end

function M:takePhoto(payload)
	if not payload or type(payload.friendPlayerUidsInView) ~= "table" or #payload.friendPlayerUidsInView <= 0 then
		return
	end

	if not pg or not pg.global or not pg.global.eventEmitter then
		return
	end

	pg.global.eventEmitter:emit(EventConst.PLATFORM_ACHIEVEMENT_TAKE_PHOTO, payload)
end

return M
