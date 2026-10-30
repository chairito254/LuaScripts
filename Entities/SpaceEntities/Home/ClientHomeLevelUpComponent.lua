-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\Home\\ClientHomeLevelUpComponent.lua

local Class = require("Core.Framework.Class")
local HomeObjectData = require("Data.home_object_data")
local HomelandFacilityData = require("Data.homeland_facility_data")
local HomelandFormulaData = require("Data.homeland_formula_data")
local InteractionConst = require("Common.Const.InteractionConst")
local HomelandOperateData = require("Data.homeland_operate_data")
local ClientConst = require("Const.ClientConst")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local GlobalData = require("Core.Client.GlobalData")
local EffectConst = require("Const.EffectConst")
local Time = require("Core.Common.Time")
local UIConst = require("Const.UIConst")
local HomeFacilityData = require("Data.homeland_facility_data")
local HomeUpgradeData = require("Data.home_upgrade_data")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local ClientHomeLevelUpComponent = Class.Component("ClientHomeLevelUpComponent")

function ClientHomeLevelUpComponent:init(dict)
	return true
end

function ClientHomeLevelUpComponent:EVENT_InitInteractionList()
	self:initInteractionList()
end

function ClientHomeLevelUpComponent:initInteractionList()
	local config = self:getConfigData()

	if not GlobalData.Space:isSelfHomeland() then
		return
	end

	self.interactionListData = self.interactionListData or {}
	self.interactionListData[#self.interactionListData + 1] = {
		globalId = self:getGlobalId(),
		actionPrototypeId = InteractionConst.INTERACT_HOME_LEVEL_UP_ID,
		overrideInteractDis = config.interactDistance,
		canInteractiveFunc = function()
			return self:checkCanPerformLevelUp()
		end,
		interactFunc = function()
			pg.global.ui:open(UIConst.UI_ID_HOMELAND_LEVEL_UP, {
				homeTemplateId = self.homeTemplateId,
				facilityId = config.facilityId,
				ornamentId = self.ornamentId
			})
		end
	}
end

function ClientHomeLevelUpComponent:checkCanPerformLevelUp()
	if pg.me:RIDING_ST() then
		return false
	end

	if pg.me:SPECIAL_VEHICLE_RIDE_ST() then
		return false
	end

	if not pg.me.space then
		return false
	end

	if not pg.me.space:isSelfHomeland(pg.me) then
		return false
	end

	return HomeLandUtils.checkOrnamentUpgradeUnlocked(self.homeTemplateId, pg.me.triggerMap)
end

return ClientHomeLevelUpComponent
