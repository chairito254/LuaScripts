-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\QteTimeline\\QteTimelineCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local QteTimelineCtrl = Class.LightClass("QteTimelineCtrl", UICtrl)

QteTimelineCtrl.DEFAULT_CLICK_INTERVAL = 0.2
QteTimelineCtrl.CLICK_CLIP_NAME = "VX_Pb_RapidClick_Click"
QteTimelineCtrl.DEFAULT_CLICK_CLIP_LENGTH = 0.3
QteTimelineCtrl.MAX_FEEDBACK_SPEED = 6

function QteTimelineCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.callback = info.callback
	self.clickCount = info.clickCount or 5
	self.curClickCount = 0
end

function QteTimelineCtrl:addListener()
	local btnBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.rapidClickObjRef.gameObject, "qteC")

	btnBind.isVirtual = false
	btnBind.priority = 10
	btnBind.actionPath = "Hud/QteC"

	function btnBind.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" then
			self:onRapidClickInput()

			self.keySimulateClick = true

			self.view.clickBtn:OnClickSimulate()

			self.keySimulateClick = nil

			return true
		end
	end

	local keyHotKeyContent = self.view.rapidClickObjRef:GetRefValue("keyHotKeyContent")

	keyHotKeyContent:SetHotKeyPaths("Hud/QteC")

	self.view.clickBtn.enabledIntervalClick = false

	function self.view.clickBtn.luaClick()
		if self.keySimulateClick then
			self.keySimulateClick = nil

			return
		end

		self:onRapidClickInput()
	end
end

function QteTimelineCtrl:onRapidClickInput()
	self.curClickCount = self.curClickCount + 1

	if self.clickCount ~= 1 then
		self.view.progress.value = self.curClickCount / self.clickCount or 0

		self:playClickFeedback()
	end

	if self.curClickCount == self.clickCount then
		self.curClickCount = 0

		self.view.clickBtn:TryChangePage("State", 1)
		self.view.widget:SetActive(true)
		pg.game.audio:triggerEvent("SFX_UI_Qte_Success")
		UIUtils.PlayAnimation(self.view.rapidClickAnim, "VX_Pb_RapidClick_Out", function()
			self:dismiss()
		end)

		if self.callback then
			self.callback()
		end
	end
end

function QteTimelineCtrl:refreshProgress(target, duration)
	local progress = self.view.progress

	if not progress then
		return
	end

	if progress.ProgressToValue then
		progress:ProgressToValue(target, nil, duration)
	else
		progress.value = target
	end
end

function QteTimelineCtrl:getClickClipLength()
	if self.clickClipLength == nil then
		local len = UIUtils.GetAnimationClipLength(self.view.rapidClickAnim, QteTimelineCtrl.CLICK_CLIP_NAME)

		self.clickClipLength = len ~= nil and len > 0 and len or QteTimelineCtrl.DEFAULT_CLICK_CLIP_LENGTH
	end

	return self.clickClipLength
end

function QteTimelineCtrl:playClickFeedback(gap)
	local clipLen = self:getClickClipLength()
	local minDuration = clipLen / QteTimelineCtrl.MAX_FEEDBACK_SPEED
	local duration = math.max(minDuration, math.min(clipLen, gap > 0 and gap or clipLen))

	UIUtils.PlayAnimation(self.view.rapidClickAnim, QteTimelineCtrl.CLICK_CLIP_NAME, nil, clipLen / duration)
end

function QteTimelineCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	if self.delayTimer ~= nil then
		self:killTimer(self.delayTimer)
	end

	if info ~= nil and info.closeImmediately ~= nil then
		if info.closeImmediately then
			self:dismiss()
		else
			self.view.clickBtn:OnClickSimulate()

			self.delayTimer = self:startTimer(function()
				self:dismiss()
			end, 1)
		end
	end
end

function QteTimelineCtrl:onShow()
	self.lastClickTime = nil
	self.curClickCount = 0
	self.keySimulateClick = nil
	self.clickClipLength = nil
	self.view.progress.value = 0

	self.view.widget:SetActive(false)
	self.view.clickBtn:TryChangePage("State", 0)
	UIUtils.PlayAnimation(self.view.rapidClickAnim, "VX_Pb_RapidClick_In", function()
		self.view.rapidClickAnim:Play("VX_Pb_RapidClick_Click_Loop")
	end)
	pg.game.audio:playEvent("SFX_UI_Qte_Continued")
end

function QteTimelineCtrl:checkUIShowVirtualMouseCursor()
	return false
end

return QteTimelineCtrl
