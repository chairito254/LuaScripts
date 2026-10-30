-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\BossRushBuffSelect\\BossRushBuffSelectView.lua

local logger = require("Core.Log.LoggerManager").getLogger("BossRushBuffSelectView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientTextUtils = require("Utils.ClientTextUtils")
local BossRushBuffSelectView = Class.LightClass("BossRushBuffSelectView", UIView)

function BossRushBuffSelectView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.listTabUList = objectReference:GetRefValue("listTabUList")
	self.listBuffUList = objectReference:GetRefValue("listBuffUList")
	self.buffSpecialTabUButton = objectReference:GetRefValue("buffSpecialTabUButton")
	self.buffNormalTabUButton = objectReference:GetRefValue("buffNormalTabUButton")
	self.btnConfirmUButton = objectReference:GetRefValue("btnConfirmUButton")
	self.listTabCheckUList = objectReference:GetRefValue("listTabCheckUList")
	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.specialBuffUBaseText = objectReference:GetRefValue("specialBuffUBaseText")
	self.specialBuffUImage = objectReference:GetRefValue("specialBuffUImage")
	self.normalBuffUBaseText = objectReference:GetRefValue("normalBuffUBaseText")
	self.normalBuffUImage = objectReference:GetRefValue("normalBuffUImage")
	self.supportBuff1ObjectReference = objectReference:GetRefValue("supportBuff1ObjectReference")
	self.supportBuff2ObjectReference = objectReference:GetRefValue("supportBuff2ObjectReference")
	self.windowAnimation = objectReference:GetRefValue("windowAnimation")
	self.consoleBarConsoleBar = objectReference:GetRefValue("consoleBarConsoleBar")
	self.btnInfoUButton = objectReference:GetRefValue("btnInfoUButton")
	self.btnRecommendUButton = objectReference:GetRefValue("btnRecommendUButton")
	self.textInfoUSDFText = objectReference:GetRefValue("textInfoUSDFText")
	self.panelRecommendUWidget = objectReference:GetRefValue("panelRecommendUWidget")
	self.textSpecialTitleUSDFText = objectReference:GetRefValue("textSpecialTitleUSDFText")
	self.textNormalTitleUSDFText = objectReference:GetRefValue("textNormalTitleUSDFText")
	self.textSpecialEmptyUSDFText = objectReference:GetRefValue("textSpecialEmptyUSDFText")
	self.textNormalEmptyUSDFText = objectReference:GetRefValue("textNormalEmptyUSDFText")
	self.fxGlowUWidget = objectReference:GetRefValue("fxGlowUWidget")
	self.panelRecommendLeftUWidget = objectReference:GetRefValue("panelRecommendLeftUWidget")
end

function BossRushBuffSelectView:registerObjects()
	local objectReference = self.btnConfirmUButton:GetComponent("ObjectReference")

	self.btnConfirmText = objectReference:GetRefValue("txtNameUText")
	objectReference = self.btnRecommendUButton:GetComponent("ObjectReference")
	self.btnCRecommendText = objectReference:GetRefValue("txtNameUText")
end

function BossRushBuffSelectView:initView()
	ClientTextUtils.setText(self.btnConfirmText, pg.getGameString("BOSS_RUSH_BUFF_SELECT"))
	ClientTextUtils.setText(self.btnCRecommendText, pg.getGameString("BOSS_RUSH_BUFF_RECOMMEND"))
	ClientTextUtils.setText(self.textInfoUSDFText, pg.getGameString("BOSS_RUSH_SEASON_BUFF_TIPS"))
	ClientTextUtils.setText(self.textSpecialTitleUSDFText, pg.getGameString("BOSS_RUSH_BUFF_CURRENT_ASSEMBLY"))
	ClientTextUtils.setText(self.textNormalTitleUSDFText, pg.getGameString("BOSS_RUSH_BUFF_CURRENT_ASSEMBLY"))
	ClientTextUtils.setText(self.textSpecialEmptyUSDFText, pg.getGameString("BOSS_RUSH_BUFF_NOT_ASSEMBLED"))
	ClientTextUtils.setText(self.textNormalEmptyUSDFText, pg.getGameString("BOSS_RUSH_BUFF_NOT_ASSEMBLED"))
end

return BossRushBuffSelectView
