-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\Homeland\\MobileHomelandRDComponent.lua

local Class = require("Core.Framework.Class")
local HudSplicingCfg = require("Guis.Panels.HudV2.HudSplicingCfg")
local HudBaseComponent = require("Guis.Panels.HudV2.HudBaseComponent")
local MobileHomelandRDComponent = Class.LightClass("MobileHomelandRDComponent", HudBaseComponent)
local ExploreBtnComponent = require("Guis.Panels.HudV2.BaseComponent.ExploreBtnComponent")

function MobileHomelandRDComponent:findObjects()
	return
end

function MobileHomelandRDComponent:initView()
	return
end

function MobileHomelandRDComponent:bindComponent()
	self.mobile3C = self:getBaseComponentCls(HudSplicingCfg.componentName.mobile3C).new(self, nil, {
		isAutoLoad = true,
		parentTrans = self.view.uiNode.transform,
		compName = HudSplicingCfg.componentName.mobile3C
	})
	self.mobileSkill = self:getBaseComponentCls(HudSplicingCfg.componentName.mobileSkill).new(self, nil, {
		isAutoLoad = true,
		parentTrans = self.view.uiNode.transform,
		compName = HudSplicingCfg.componentName.mobileSkill
	})
	self.interactGesture = self:getBaseComponentCls(HudSplicingCfg.componentName.interactGesture).new(self, nil, {
		parentTrans = self.view.uiNode.transform,
		compName = HudSplicingCfg.componentName.interactGesture
	})
	self.exploreBtn = ExploreBtnComponent.new(self, nil, {
		isAutoLoad = true,
		parentTrans = self.view.uiNode.transform,
		compName = HudSplicingCfg.componentName.exploreBtn
	})
end

function MobileHomelandRDComponent:onDestroy()
	HudBaseComponent.onDestroy(self)
end

return MobileHomelandRDComponent
