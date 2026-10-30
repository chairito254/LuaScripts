-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\MobileOperate\\MobileOperateCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("MobileOperateCtrl")
local MessageName = require("Const.MessageName")
local MoveJoyStickUIComponent = require("Guis.Panels.MobileOperate.Component.MoveJoyStickUIComponent")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local UIConst = require("Const.UIConst")
local ClientConst = require("Const.ClientConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local lshift = bit.lshift
local bor = bit.bor
local Utils = require("Common.Utils.Utils")
local MobileOperateCtrl = Class.LightClass("MobileOperateCtrl", UICtrl)

MobileOperateCtrl.messages = {
	[MessageName.MAGNESIS_MODE_CHANGE] = {
		"onMagnesisModeChange",
		true
	},
	[MessageName.DUNGEON_TEAMMATEVIEW_CHANGE] = {
		"onTeammateViewChange",
		true
	}
}

function MobileOperateCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.moveJoyStick = MoveJoyStickUIComponent.new(self, self.view.transform)
end

function MobileOperateCtrl:addListener()
	self.view.clickObject:SetCameraWorldCamera()

	self.view.clickObject.layerMask = bor(lshift(1, ClientConst.LayerDefine.LAYER_PLAYER), lshift(1, ClientConst.LayerDefine.LAYER_ENTITY))

	function self.view.clickObject.luaClick(go, ent, dist)
		if not go or not ent then
			return
		end

		local entity = pg.getEntity(ent.id)

		if not entity then
			return
		end

		if go.layer == ClientConst.LayerDefine.LAYER_PLAYER then
			if Utils.isPlayer(entity) then
				self.playerId = entity.id

				if pg.game.social.interactGestureComponent:checkIsSelecting() then
					return
				end

				if not pg.global.ui:checkUIOpen(UIConst.UI_ID_INTERACT_GESTURE) then
					local param = {
						openType = ClientConst.PlayerInfoOpenType.MobFaceToFace,
						playerId = entity.uid,
						openSource = pg.game.chat.AddFriendSource.FaceToFace
					}

					LuaUIUtils.openInfoPlayerCard(param)
				end
			end
		elseif go.layer == ClientConst.LayerDefine.LAYER_ENTITY and Utils.isPuppet(entity) then
			pg.game.controller.lockHelper:tryManualForceLockTarget(dist, entity.actorId, 0)
		end
	end
end

function MobileOperateCtrl:onTeammateViewChange()
	if pg.me.inTeammateView then
		self.view.safeMobileBoxUWidget.gameObject:SetActiveEx(false)
	else
		self.view.safeMobileBoxUWidget.gameObject:SetActiveEx(true)
	end
end

function MobileOperateCtrl:onDestroy()
	UICtrl.onDestroy(self)
end

function MobileOperateCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function MobileOperateCtrl:onShow()
	return
end

function MobileOperateCtrl:onHide()
	return
end

function MobileOperateCtrl:checkUIShowVirtualMouseCursor()
	return false
end

function MobileOperateCtrl:onMagnesisModeChange(enable)
	if self.moveJoystick then
		self.moveJoystick:changeMagnesisGestureBehavior(enable)
	end
end

function MobileOperateCtrl:onVisibleChange(visible)
	if visible and self.moveJoystick then
		self.moveJoystick:initGesture()
	end
end

return MobileOperateCtrl
