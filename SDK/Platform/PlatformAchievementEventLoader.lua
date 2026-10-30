-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\PlatformAchievementEventLoader.lua

local M = {}

M.DynamicHookLoader = require("SDK.Platform.UIBridge.PlatformDynamicHookLoader")
M.loaded = false

function M.load()
	if M.loaded then
		return true
	end

	local friendTarget = M.DynamicHookLoader.registerDynamicHooks("Entities.SpaceEntities.PlayerComponent.ClientFriendComponent", "SDK.Platform.EntityMixin.ImpPlatformClientFriendComponent", {
		{
			methodName = "FriendService_onSpecialFriendSet"
		}
	})
	local costumeTarget = M.DynamicHookLoader.registerDynamicHooks("Guis.Panels.WorkShopCostumeStain.WorkShopCostumeStainModel", "SDK.Platform.EntityMixin.ImpPlatformWorkShopCostumeStainModel", {
		{
			methodName = "onSubmitChanged"
		}
	})
	local combatTarget = M.DynamicHookLoader.registerDynamicHooks("Entities.SpaceEntities.CommonComponent.ClientCombatEntityComponent", "SDK.Platform.EntityMixin.ImpPlatformClientCombatEntityComponent", {
		{
			methodName = "onLifeChange"
		}
	}, "_platformImpPlatformClientCombatEntityComponent")
	local photoSaveTarget = M.DynamicHookLoader.registerDynamicHooks("Guis.Panels.Photo.Component.NormalPhotoUIComponent", "SDK.Platform.EntityMixin.ImpPlatformNormalPhotoUIComponent", {
		{
			methodName = "savePhoto"
		}
	}, "_platformImpPlatformNormalPhotoUIComponent")
	local photoTakeTarget = M.DynamicHookLoader.registerDynamicHooks("Guis.Panels.Photo.PhotoCtrl", "SDK.Platform.UIBridge.ImpPlatformPhotoCtrl", {
		{
			methodName = "takePhoto"
		}
	}, "_platformImpPlatformPhotoCtrl")
	local photoStudioTarget = M.DynamicHookLoader.registerDynamicHooks("Guis.Panels.PhotographyStudioEdit.PhotographyStudioEditCtrl", "SDK.Platform.UIBridge.ImpPlatformPhotographyStudioEditCtrl", {
		{
			methodName = "getPhotoAchievementPayload"
		},
		{
			methodName = "takePhoto"
		}
	})

	if friendTarget == nil or costumeTarget == nil or combatTarget == nil or photoSaveTarget == nil or photoTakeTarget == nil or photoStudioTarget == nil then
		return false
	end

	M.loaded = true

	return true
end

return M
