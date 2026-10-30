-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeGashapon\\HomeGashaponView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LuaUIUtils = require("Utils.LuaUIUtils")
local HomeGashaponView = Class.LightClass("HomeGashaponView", UIView)

function HomeGashaponView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.windowUWidget = self.transform:GetComponent("UComponent")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.tMPUSDFText = objectReference:GetRefValue("tMPUSDFText")
	self.listCurrencyUList = objectReference:GetRefValue("listCurrencyUList")
	self.listRewardUList = objectReference:GetRefValue("listRewardUList")
	self.txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	self.txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	self.txtNumUSDFText = objectReference:GetRefValue("txtNumUSDFText")
	self.btnPlayUButton = objectReference:GetRefValue("btnPlayUButton")
	self.niuDanUSDFText = objectReference:GetRefValue("niuDanUSDFText")
	self.txtCostUSDFText = objectReference:GetRefValue("txtCostUSDFText")
	self.iconCostUImage = objectReference:GetRefValue("iconCostUImage")
	self.btnInfoUButton = objectReference:GetRefValue("btnInfoUButton")
	self.btnSkipUButton = LuaUIUtils.safeGetRefValue(objectReference, "btnSkipUButton")
	self.topBackUWidget = objectReference:GetRefValue("topBackUWidget")
	self.bottomUWidget = objectReference:GetRefValue("bottomUWidget")
end

function HomeGashaponView:registerObjects()
	return
end

function HomeGashaponView:initView()
	return
end

return HomeGashaponView
