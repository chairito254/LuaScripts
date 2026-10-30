-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\GrabEgg\\GrabEggPvpNestMark.lua

local RobEggBornData = require("Data.rob_egg_born_data")
local SceneUtils = require("Common.Utils.SceneUtils")
local Time = require("Core.Common.Time")
local TimerManager = require("Core.Timer.TimerManager")
local ClientTextUtils = require("Utils.ClientTextUtils")
local GrabEggPvpNestMark = {}

GrabEggPvpNestMark.PREFAB = "$UI_MapMisc_GetEgg_HugeEgg.prefab"

function GrabEggPvpNestMark.isMark(markId, markConfigId, sceneId)
	local space = pg.space

	if not space or not space:isGrabEgg() or not space.isPvp or markConfigId ~= 1010 then
		return false
	end

	if sceneId and sceneId ~= space.sceneId then
		return false
	end

	local cfg = RobEggBornData[space.sceneId]
	local sceneSpawners = SceneUtils.getSceneSpawnerData(space.sceneId, space.id)
	local targetMarkId = tonumber(markId)

	for _, spawnerIds in pairs(cfg and cfg.egglinknestplace or {}) do
		for _, spawnerId in ipairs(spawnerIds) do
			local spawnerData = sceneSpawners[spawnerId]
			local markConfig = spawnerData and spawnerData.markConfig

			if spawnerId == targetMarkId or targetMarkId and markConfig and markConfig.markContent1 == targetMarkId then
				return true
			end
		end
	end

	return false
end

function GrabEggPvpNestMark.getState(space)
	local info = space and space.superEggInfo
	local endTime = info and info.expireOpenTime or 0

	if endTime <= 0 then
		return 0, 0
	end

	return endTime > Time.secondCache and 1 or 2, endTime
end

local function formatCountdown(day, hour, minute, second)
	return string.format("%02d:%02d", day * 1440 + hour * 60 + minute, second)
end

function GrabEggPvpNestMark.clear(owner)
	local binding = owner.pvpNestMark

	if not binding then
		return
	end

	owner.pvpNestMark = nil

	if binding.timer then
		TimerManager.removeTimer(binding.timer)
	end

	if NotNil(binding.countDown) then
		binding.countDown:Stop()

		binding.countDown.luaFinished = nil
		binding.countDown.onGetBaseText = nil
	end
end

function GrabEggPvpNestMark.bind(owner, gameObject)
	GrabEggPvpNestMark.clear(owner)

	local refs = gameObject:GetComponent("ObjectReference")
	local binding = {
		gameObject = gameObject,
		space = pg.space,
		root = refs:GetRefValue("root"),
		countDown = refs:GetRefValue("countDownUCountDown")
	}

	owner.pvpNestMark = binding

	ClientTextUtils.setText(refs:GetRefValue("txtInactive"), pg.getGameString("GRAB_EGG_PVP_MAXEGG_MAPICON_3"))

	binding.countDown.positiveTiming = false
	binding.countDown.useGameTime = false
	binding.countDown.enabledMilli = false
	binding.countDown.onGetBaseText = formatCountdown

	local function refresh()
		if owner.pvpNestMark ~= binding then
			return
		end

		if not NotNil(gameObject) or pg.space ~= binding.space then
			GrabEggPvpNestMark.clear(owner)

			return
		end

		local state, endTime = GrabEggPvpNestMark.getState(binding.space)

		if binding.state ~= state then
			binding.root:TryChangePage("State", state)
		end

		if state == 1 then
			if binding.state ~= state or binding.endTime ~= endTime then
				binding.countDown:Play(endTime - Time.secondCache)
			end
		elseif binding.state ~= state then
			binding.countDown:Stop()
		end

		binding.state, binding.endTime = state, endTime
	end

	function binding.countDown.luaFinished()
		binding.endTime = nil

		refresh()
	end

	refresh()

	if owner.pvpNestMark == binding then
		binding.timer = TimerManager.addRepeatTimer(1, refresh)
	end
end

return GrabEggPvpNestMark
