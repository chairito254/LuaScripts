-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetShiny\\PetShinyView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PetShinyView = Class.LightClass("PetShinyView", UIView)

function PetShinyView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.tMPUSDFText = objectReference:GetRefValue("tMPUSDFText")
	self.btnInfoUButton = objectReference:GetRefValue("btnInfoUButton")
	self.btnHistoryUButton = objectReference:GetRefValue("btnHistoryUButton")
	self.btnReplaceUButton = objectReference:GetRefValue("btnReplaceUButton")
	self.btnCubeUButton = objectReference:GetRefValue("btnCubeUButton")
	self.lineUWidget = objectReference:GetRefValue("lineUWidget")
	self.tab01UButton = objectReference:GetRefValue("tab01UButton")
	self.tab03UButton = objectReference:GetRefValue("tab03UButton")
	self.tab01NameUSDFText = objectReference:GetRefValue("tab01NameUSDFText")
	self.tab03NameUSDFText = objectReference:GetRefValue("tab03NameUSDFText")
	self.reRollTitleUSDFText = objectReference:GetRefValue("reRollTitleUSDFText")
	self.txtStateUSDFText = objectReference:GetRefValue("txtStateUSDFText")
	self.txtStateNewUSDFText = objectReference:GetRefValue("txtStateNewUSDFText")
	self.txtNullUSDFText = objectReference:GetRefValue("txtNullUSDFText")
	self.iconUImage = objectReference:GetRefValue("iconUImage")
	self.btnBack2UButton = objectReference:GetRefValue("btnBack2UButton")
	self.replaceTitleUSDFText = objectReference:GetRefValue("replaceTitleUSDFText")
	self.txtReplaceUSDFText = objectReference:GetRefValue("txtReplaceUSDFText")
	self.ballTitleUSDFText = objectReference:GetRefValue("ballTitleUSDFText")
	self.ballDescUSDFText = objectReference:GetRefValue("ballDescUSDFText")
	self.cubeNullUWidget = objectReference:GetRefValue("cubeNullUWidget")
	self.consumeUList = objectReference:GetRefValue("consumeUList")
	self.consumeObjectReference = objectReference:GetRefValue("consumeObjectReference")
	self.btnRefreshUButton = objectReference:GetRefValue("btnRefreshUButton")
	self.petListObjectReference = objectReference:GetRefValue("petListObjectReference")
	self.detailUContainerUContainer = objectReference:GetRefValue("detailUContainerUContainer")
	self.previewUSDFText = objectReference:GetRefValue("previewUSDFText")
	self.randomIconUImage = objectReference:GetRefValue("randomIconUImage")
	self.btnSelectIconUImage = objectReference:GetRefValue("btnSelectIconUImage")
	self.showListUList = objectReference:GetRefValue("showListUList")
	self.rightPnlUComponent = objectReference:GetRefValue("rightPnlUComponent")
	self.cubeUButton = objectReference:GetRefValue("cubeUButton")
	self.cubeStaeUButton = objectReference:GetRefValue("cubeStaeUButton")
	self.onwCubeUButton = objectReference:GetRefValue("onwCubeUButton")
	self.btnConfirmUButton = objectReference:GetRefValue("btnConfirmUButton")
	self.previewBgUWidget = objectReference:GetRefValue("previewBgUWidget")
	self.replaceStateUComponent = objectReference:GetRefValue("replaceStateUComponent")
	self.cubeListUList = objectReference:GetRefValue("cubeListUList")
	self.consumeUWidget = objectReference:GetRefValue("consumeUWidget")
	self.onwCubeUImage = objectReference:GetRefValue("onwCubeUImage")
	self.cubeRightUImage = objectReference:GetRefValue("cubeRightUImage")
	self.cubeiconUImage = objectReference:GetRefValue("cubeiconUImage")
	self.txtCubeUSDFText = objectReference:GetRefValue("txtCubeUSDFText")
	self.tabBarUWidget = objectReference:GetRefValue("tabBarUWidget")
	self.listCurrencyUList = objectReference:GetRefValue("listCurrencyUList")
	self.btnSelectBackUButton = objectReference:GetRefValue("btnSelectBackUButton")
	self.selectTitleUSDFText = objectReference:GetRefValue("selectTitleUSDFText")
	self.dragButtonUButton = objectReference:GetRefValue("dragButtonUButton")
	self.btnCurrentNameUSDFText = objectReference:GetRefValue("btnCurrentNameUSDFText")
	self.oneTabUSDFText = objectReference:GetRefValue("oneTabUSDFText")
	self.consumeItemUList = self.consumeObjectReference:GetRefValue("listUList")
	self.consumeTitleUSDFText = self.consumeObjectReference:GetRefValue("txtTitleUSDFText")

	local btnRefreshOC = self.btnRefreshUButton:GetComponent("ObjectReference")

	self.btnRefreshNameUText = btnRefreshOC:GetRefValue("txtNameUText")

	local btnConfirmOC = self.btnConfirmUButton:GetComponent("ObjectReference")

	self.btnConfirmNameUText = btnConfirmOC:GetRefValue("txtNameUText")
end

function PetShinyView:registerObjects()
	return
end

function PetShinyView:initView()
	return
end

return PetShinyView
