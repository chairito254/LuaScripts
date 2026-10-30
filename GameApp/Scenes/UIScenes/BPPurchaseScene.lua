-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Scenes\\UIScenes\\BPPurchaseScene.lua

local Class = require("Core.Framework.Class")
local BattlePassScene = require("GameApp.Scenes.UIScenes.BattlePassScene")
local BPPurchaseScene = Class.LightClass("BPPurchaseScene", BattlePassScene)

BPPurchaseScene.BACKGROUND_MATERIAL_NAME = "MI_LVUIBP_BackGround_Plane_02_7C37A768"

function BPPurchaseScene:getBackgroundConfigKey()
	return "purchaseBG"
end

function BPPurchaseScene:getBackgroundMaterialName()
	return BPPurchaseScene.BACKGROUND_MATERIAL_NAME
end

return BPPurchaseScene
