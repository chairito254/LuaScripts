-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRaceSettlement\\WorldRaceSettlementModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local WorldRaceSettlementModel = Class.LightClass("WorldRaceSettlementModel", UIModel)

function WorldRaceSettlementModel:ctor()
	self.settlementInfo = nil
end

function WorldRaceSettlementModel:setSettlementInfo(info)
	self.settlementInfo = info
end

function WorldRaceSettlementModel:getSettlementInfo()
	return self.settlementInfo
end

return WorldRaceSettlementModel
