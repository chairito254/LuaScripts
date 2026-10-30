-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\WorldRace\\WorldRaceMUComponent.lua

local Class = require("Core.Framework.Class")
local HudSplicingCfg = require("Guis.Panels.HudV2.HudSplicingCfg")
local BaseMUComponent = require("Guis.Panels.HudV2.BaseLayoutComponent.BaseMUComponent")
local WorldRaceRaceInfoUIComponent = require("Guis.Panels.HudV2.WorldRace.WorldRaceRaceInfoUIComponent")
local WorldRaceMUComponent = Class.LightClass("WorldRaceMUComponent", BaseMUComponent)

function WorldRaceMUComponent:bindComponent()
	BaseMUComponent.bindComponent(self)

	self.worldRaceRaceInfo = WorldRaceRaceInfoUIComponent.new(self, nil, {
		isAutoLoad = true,
		parentTrans = self.view.uiNode.transform,
		compName = HudSplicingCfg.componentName.worldRaceRaceInfo
	})
end

function WorldRaceMUComponent:onDestroy()
	BaseMUComponent.onDestroy(self)

	self.worldRaceRaceInfo = nil
end

return WorldRaceMUComponent
