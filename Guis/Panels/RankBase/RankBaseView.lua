-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RankBase\\RankBaseView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RankBaseView = Class.LightClass("RankBaseView", UIView)

function RankBaseView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	self.btnInfoUButton = objectReference:GetRefValue("btnInfoUButton")
	self.listLeftTabUList = objectReference:GetRefValue("listLeftTabUList")
	self.nameUWidget = objectReference:GetRefValue("nameUWidget")
	self.listTab3thUList = objectReference:GetRefValue("listTab3thUList")
	self.titleObjectReference = objectReference:GetRefValue("titleObjectReference")
	self.listRankingUList = objectReference:GetRefValue("listRankingUList")
	self.btnRewardUButton = objectReference:GetRefValue("btnRewardUButton")
	self.btnFilterUButton = objectReference:GetRefValue("btnFilterUButton")
	self.rankingSelfObjectReference = objectReference:GetRefValue("rankingSelfObjectReference")
	self.tab2thUWidget = objectReference:GetRefValue("tab2thUWidget")
	self.countDownUCountDown = objectReference:GetRefValue("countDownUCountDown")
	self.emptyUSDFText = objectReference:GetRefValue("emptyUSDFText")
	self.rankScheduleUContainer = objectReference:GetRefValue("rankScheduleUContainer")
end

function RankBaseView:registerObjects()
	local objectReference = self.titleObjectReference

	self.txtRankingTitleUSDFText = objectReference:GetRefValue("txtRankingTitleUSDFText")
	self.txtNameTitleUSDFText = objectReference:GetRefValue("txtNameTitleUSDFText")
	self.txtOneteamTitleUSDFText = objectReference:GetRefValue("txtOneteamTitleUSDFText")
	self.txtTwoNum1TitleUSDFText = objectReference:GetRefValue("txtTwoNum1TitleUSDFText")
	self.txtTwoNum2TitleUSDFText = objectReference:GetRefValue("txtTwoNum2TitleUSDFText")
	self.txtScoreTitleUSDFText = objectReference:GetRefValue("txtScoreTitleUSDFText")
end

function RankBaseView:initView()
	self.nameUWidget:SetActive(false)
	ClientTextUtils.setText(self.emptyUSDFText, pg.getGameString("RANK_EMPTY"))
end

return RankBaseView
