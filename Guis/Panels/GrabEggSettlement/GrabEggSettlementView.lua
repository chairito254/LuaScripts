-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\GrabEggSettlement\\GrabEggSettlementView.lua

local logger = require("Core.Log.LoggerManager").getLogger("GrabEggSettlementView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local GrabEggSettlementView = Class.LightClass("GrabEggSettlementView", UIView)
local ClientTextUtils = require("Utils.ClientTextUtils")

function GrabEggSettlementView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.bg = objectReference:GetRefValue("bg")
	self.txtMapNameUBaseText = objectReference:GetRefValue("txtMapNameUBaseText")
	self.txtTimeUBaseText = objectReference:GetRefValue("txtTimeUBaseText")
	self.listTaskUList = objectReference:GetRefValue("listTaskUList")
	self.txtHarvestUBaseText = objectReference:GetRefValue("txtHarvestUBaseText")
	self.txtDefeatUBaseText = objectReference:GetRefValue("txtDefeatUBaseText")
	self.btnOrganizeUButton = objectReference:GetRefValue("btnOrganizeUButton")
	self.btnShareUButton = objectReference:GetRefValue("btnShareUButton")
	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.txtDifficultyUBaseText = objectReference:GetRefValue("txtDifficultyUBaseText")
	self.btnHarvestDetailsUButton = objectReference:GetRefValue("btnHarvestDetailsUButton")
	self.btnDefeatDetailsUButton = objectReference:GetRefValue("btnDefeatDetailsUButton")
	self.openAnim = objectReference:GetRefValue("openAnim")
	self.valueUWidget = objectReference:GetRefValue("valueUWidget")
	self.txtPointAddUBaseText = objectReference:GetRefValue("txtPointAddUBaseText")
	self.doublePointUWidget = objectReference:GetRefValue("doublePointUWidget")
	self.txtDoubleUBaseText = objectReference:GetRefValue("txtDoubleUBaseText")
	self.txtSuccessRoleUBaseText = objectReference:GetRefValue("txtSuccessRoleUBaseText")
	self.txtFailUSDFText = objectReference:GetRefValue("txtFailUSDFText")
	self.txtTitleProfitUBaseText = objectReference:GetRefValue("txtTitleProfitUBaseText")
	self.treasureChestUWidget = objectReference:GetRefValue("treasureChestUWidget")
	self.rewardBoxIconUImage = objectReference:GetRefValue("rewardBoxIconUImage")
	self.textTimeTitleUSDFText = objectReference:GetRefValue("textTimeTitleUSDFText")
	self.textTimeSubUSDFText = objectReference:GetRefValue("textTimeSubUSDFText")
	self.textLuckyBoxTitleUSDFText = objectReference:GetRefValue("textLuckyBoxTitleUSDFText")
	self.btnLuckyInfoUButton = objectReference:GetRefValue("btnLuckyInfoUButton")
	self.textGetBoxNumUSDFText = objectReference:GetRefValue("textGetBoxNumUSDFText")
	self.textFullGetUSDFText = objectReference:GetRefValue("textFullGetUSDFText")
	self.protectInfoUSDFText = objectReference:GetRefValue("protectInfoUSDFText")
	self.protectInfoUWidget = objectReference:GetRefValue("protectInfoUWidget")
	self.txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	self.TeamMateUSDFText = objectReference:GetRefValue("TeamMateUSDFText")
	self.NotGetUSDFText = objectReference:GetRefValue("NotGetUSDFText")
	self.FullEggUList = objectReference:GetRefValue("FullEggUList")
	self.listSingleUList = objectReference:GetRefValue("listSingleUList")
	self.listSharedUList = objectReference:GetRefValue("listSharedUList")
	self.layoutBoxUWidget = objectReference:GetRefValue("layoutBoxUWidget")
	self.tipInfo = objectReference:GetRefValue("tipInfo")
	self.tipInfoTxt = objectReference:GetRefValue("tipInfoTxt")
	self.tipInfoTxt.supportRichText = true
	self.difficultyPanel = objectReference:GetRefValue("difficultyPanel")
	self.harvestUWidget = objectReference:GetRefValue("harvestUWidget")
	self.textTitleUSDFText = objectReference:GetRefValue("textTitleUSDFText")
	self.bigEggUList = objectReference:GetRefValue("bigEggUList")
	self.noBigEggUList = objectReference:GetRefValue("noBigEggUList")
	self.panelGetUWidget = objectReference:GetRefValue("panelGetUWidget")
end

function GrabEggSettlementView:registerObjects()
	return
end

function GrabEggSettlementView:initView()
	ClientTextUtils.setText(self.txtTitleUSDFText, pg.getGameString("GRAB_EGG_SETTLEMENT_GET_EGG"))
	ClientTextUtils.setText(self.TeamMateUSDFText, pg.getGameString("GRAB_EGG_SETTLEMENT_TEAM_SHARED"))
	ClientTextUtils.setText(self.NotGetUSDFText, pg.getGameString("GRAB_EGG_SETTLEMENT_NO_EGG"))
	ClientTextUtils.setText(self.textTimeTitleUSDFText, pg.getGameString("BOX_OPEN_REMAINING_TIME_TITLE"))
	ClientTextUtils.setText(self.textLuckyBoxTitleUSDFText, pg.getGameString("GRABEGG_LUCKYCHEST_TITLE"))

	local objectReference = self.btnOrganizeUButton:GetComponent("ObjectReference")
	local txtNameUText = objectReference:GetRefValue("txtNameUText")

	ClientTextUtils.setText(txtNameUText, pg.getGameString("GRAB_EGG_SETTLEMENT_NEXT"))
end

return GrabEggSettlementView
