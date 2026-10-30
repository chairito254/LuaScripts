-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\BaseComponent\\AimUIComponent.lua

local logger = require("Core.Log.LoggerManager").getLogger("AimUIComponent")
local Class = require("Core.Framework.Class")
local HudBaseComponent = require("Guis.Panels.HudV2.HudBaseComponent")
local MessageName = require("Const.MessageName")
local ClientUtils, UIConst, HotkeyConst = require("Utils.ClientUtils"), require("Const.UIConst"), require("Const.HotkeyConst")
local AimUIComponent = Class.LightClass("AimUIComponent", HudBaseComponent)
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local AIM_STATE_NONE = 0
local AIM_STATE_SKILL = 1
local AIM_STATE_HOOK_CLAW = 2

AimUIComponent.messages = {
	[MessageName.ENTER_HOOK_SKILL_AIM] = {
		"onEnterHookSkillAim",
		true
	},
	[MessageName.LEAVE_HOOK_SKILL_AIM] = {
		"onLeaveHookSkillAim",
		true
	},
	[MessageName.ENTER_HOOK_NORMAL_STATE] = {
		"onEnterHookNormalState",
		true
	},
	[MessageName.ENTER_HOOK_FOCUS_STATE] = {
		"onEnterHookFocusState",
		true
	},
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"refreshHookSkillGamepadInput",
		true
	}
}

function AimUIComponent:findObjects()
	return
end

function AimUIComponent:initView()
	self:initHookSkillGamepadPatch()

	local objectReference = self.transform:GetComponent("ObjectReference")
	local panelHookAimUContainer = objectReference:GetRefValue("panelHookAimUContainer")

	panelHookAimUContainer:LoadDefaultUrlManually(function(content)
		local panelHookAimReference = content:GetComponent("ObjectReference")

		self.panelHookAimUComponent = panelHookAimReference:GetRefValue("panelHookAimUComponent")
	end)
end

function AimUIComponent:setIsInAim(isInAim, abilityId, movableAimMode)
	self.inAimAbilityId = abilityId
	self.isInAim = isInAim

	if NotNil(self.uWidget) then
		self.uWidget:TryChangePage("AimState", isInAim and AIM_STATE_SKILL or AIM_STATE_NONE)
		self:setAimControlAndTip(isInAim, movableAimMode)
	end
end

function AimUIComponent:onEnterHookSkillAim()
	self:setAimControlAndTip(true)
	self.uWidget:TryChangePage("AimState", AIM_STATE_HOOK_CLAW)
end

function AimUIComponent:onLeaveHookSkillAim()
	self:setAimControlAndTip(false)
	self.uWidget:TryChangePage("AimState", AIM_STATE_NONE)
end

function AimUIComponent:setAimControlAndTip(isInSkillAim, movableAimMode)
	local isConsole = ClientUtils.getAdaptionPlatform() == UIConst.PLATFORM.Console

	self.isInSkillAim = isConsole and isInSkillAim
	self.aimMovableMode = ToBool(isInSkillAim) and ToBool(movableAimMode)
	pg.global.ui.tips.isAimUIVisible = isConsole and isInSkillAim

	self:refreshHookSkillGamepadInput()
	facade:SendMessageCommand(MessageName.REFRESH_SHORTCUT_KEY)
end

function AimUIComponent:onEnterHookNormalState()
	self:tryChangeHookStage(0)
end

function AimUIComponent:onEnterHookFocusState()
	self:tryChangeHookStage(1)
end

function AimUIComponent:tryChangeHookStage(stageIdx)
	if not self.panelHookAimUComponent then
		return
	end

	local _, curIndex = self.panelHookAimUComponent:TryGetCurrentPage("stage")
	local pageChange = stageIdx ~= curIndex

	if pageChange then
		self.panelHookAimUComponent:TryChangePage("stage", stageIdx)
	end
end

function AimUIComponent:onDestroy()
	self.isInSkillAim = false

	self:refreshHookSkillGamepadInput()

	self.panelHookAimUComponent = nil

	self:setAimControlAndTip(false)
	HudBaseComponent.onDestroy(self)
end

function AimUIComponent:initHookSkillGamepadPatch()
	local leftStickAimBinding = KeyBindingPro.GetOrAddKeyBindingByName(self.transform.gameObject, "leftStickHookAim")

	leftStickAimBinding.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadLeftStickMove
	leftStickAimBinding.isVirtual = true
	leftStickAimBinding.priority = 1000000

	function leftStickAimBinding.luaTrigger(inputInfo)
		if not self.leftStickAimEnabled then
			return true
		end

		pg.game.input.cameraProcessor:handleViewAxisGamepadAction(inputInfo)

		return false
	end
end

function AimUIComponent:refreshHookSkillGamepadInput()
	local enabled = ToBool(self.isInSkillAim) and not ToBool(self.aimMovableMode)

	if ToBool(self.leftStickAimEnabled) == enabled then
		return
	end

	local wasEnabled = self.leftStickAimEnabled

	self.leftStickAimEnabled = enabled

	pg.game.input:setInputActionEnabled(HotkeyConst.INPUT_MAP_ACTION_KEY.Move, not enabled, HotkeyConst.INPUT_BLOCK_FLAG.Skill)

	if enabled then
		pg.global.inputMgr:SetMoveAxis(0, 0, 0)
	elseif wasEnabled then
		pg.game.input.cameraProcessor:setViewAxis(0, 0)
	end
end

return AimUIComponent
