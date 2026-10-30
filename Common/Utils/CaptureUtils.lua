-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\CaptureUtils.lua

local Const = require("Common.Const.Const")
local CaptureConst = require("Common.Const.CaptureConst")
local AttributeConst = require("Common.Const.AttributeConst")
local Utils = require("Common.Utils.Utils")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("CaptureUtils")
local ItemEffectData = require("Data.item_effect_data")
local CastItemData = require("Data.cast_item_data")
local PetCubeItemData = require("Data.pet_hatch_egg_cube_data")
local CaptureUtils = {}

function CaptureUtils.getFetilityCubeCfg(ballItemId)
	local cubeCfg = PetCubeItemData[ballItemId]

	return cubeCfg or {}
end

function CaptureUtils.isHatchCubeItem(ballItemId)
	return PetCubeItemData[ballItemId] ~= nil
end

function CaptureUtils.getBallCfg(ballItemId)
	local iedd = ItemEffectData[ballItemId]
	local ballCfgId = iedd and iedd.castItemId

	return CastItemData[ballCfgId], ballCfgId
end

function CaptureUtils.getBallEntName(ballItemId)
	local ballCfg = CaptureUtils.getBallCfg(ballItemId) or {}

	return ballCfg.proxy
end

function CaptureUtils.getBallMaxCaptureCount(ballItemId)
	local ballCfg = CaptureUtils.getBallCfg(ballItemId) or {}
	local maxCount = ballCfg.maxCount or 1

	if ballCfg.proxy == "CatchBall" and maxCount > 1 then
		ALARM("@capture ballCfg proxy is CatchBall but maxCount > 1, ballItemId=%s, maxCount=%s", ballItemId, maxCount)

		return 1
	end

	return maxCount
end

function CaptureUtils.getBallMaxHitDistance(ballItemId)
	local ballCfg = CaptureUtils.getBallCfg(ballItemId) or {}
	local maxHitDistance = ballCfg.maxHitDistance or CaptureConst.MAX_HIT_DISTANCE

	return maxHitDistance
end

function CaptureUtils.isAffinityPet(player, puppetEnt)
	if not player or not puppetEnt then
		return false, false, ""
	end

	local hasEntityTag = Utils.hasEntityTag(puppetEnt, "TE_Wild_Affinity") or false
	local hasClosePet = false
	local entry = player.actorAttributeEntry

	if entry then
		local familyId = Utils.getPuppetEthnicGroup(puppetEnt.templateId)
		local petPrototypeId = puppetEnt.petPrototypeId or Utils.getPuppetPetPrototypeId(puppetEnt.templateId)
		local affinityFamilies = entry:getAttrComplexValue(AttributeConst.close_pet)
		local affinityPrototypes

		if familyId and familyId > 0 then
			hasClosePet = affinityFamilies[familyId] == true
		end

		if not hasClosePet and petPrototypeId and petPrototypeId > 0 then
			affinityPrototypes = entry:getAttrComplexValue(AttributeConst.close_pet_by_prototype)
			hasClosePet = affinityPrototypes[petPrototypeId] == true
		end

		if LoggerManager.checkLogger(LoggerConst.DEBUG) then
			logger:debug("CaptureUtils.isAffinityPet playerUid:%s, templateId:%s, familyId:%s, petPrototypeId:%s, affinityFamilies:%s, affinityPrototypes:%s", player.uid, puppetEnt.templateId, familyId, petPrototypeId, inspect(affinityFamilies), inspect(affinityPrototypes))
		end
	end

	local reason = ""

	if hasEntityTag and hasClosePet then
		reason = CaptureConst.AFFINITY_REASON_BOTH
	elseif hasEntityTag then
		reason = CaptureConst.AFFINITY_REASON_TAG
	elseif hasClosePet then
		reason = CaptureConst.AFFINITY_REASON_ATTR
	end

	return hasEntityTag, hasClosePet, reason
end

function CaptureUtils.isPendingCaptureDestroy(ent)
	return ent ~= nil and ent.pendingCaptureDestroy == true
end

return CaptureUtils
