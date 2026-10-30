-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRaceSettlement\\WorldRaceSettlementView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local WorldRaceSettlementView = Class.LightClass("WorldRaceSettlementView", UIView)

function WorldRaceSettlementView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.timeUSDFText = objectReference:GetRefValue("timeUSDFText")
	self.newRecordUWidget = objectReference:GetRefValue("newRecordUWidget")
	self.textTitleUBaseText = objectReference:GetRefValue("textTitleUBaseText")
	self.newRecordTxt = objectReference:GetRefValue("newRecordTxt")
	self.btnRetryUButton = objectReference:GetRefValue("btnRetryUButton")
	self.btnLeaveUButton = objectReference:GetRefValue("btnLeaveUButton")
	self.resultTxt = objectReference:GetRefValue("resultTxt")

	local btnRetryObjRef = self.btnRetryUButton:GetComponent("ObjectReference")

	if btnRetryObjRef then
		self.btnRetryTxt = btnRetryObjRef:GetRefValue("txtNameUText")
	end

	local btnLeaveObjRef = self.btnLeaveUButton:GetComponent("ObjectReference")

	if btnLeaveObjRef then
		self.btnLeaveTxt = btnLeaveObjRef:GetRefValue("txtNameUText")
	end
end

function WorldRaceSettlementView:registerObjects()
	return
end

function WorldRaceSettlementView:initView()
	return
end

return WorldRaceSettlementView
