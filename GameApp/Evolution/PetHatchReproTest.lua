-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Evolution\\PetHatchReproTest.lua

local Const = require("Common.Const.Const")
local NoticeDef = require("Common.NoticeDef")
local TimerManager = require("Core.Timer.TimerManager")
local PetHatchReproTest = {}
local armedCase
local weakValueMeta = {
	__mode = "v"
}
local MODES = {
	boxFull = true,
	missingPet = true
}

local function canRun()
	if not UNITY_EDITOR then
		return false
	end

	if not Const.OpenPetHatchReproDebug then
		return false
	end

	if not pg.me or pg.me.destroyed then
		return false
	end

	return true
end

function PetHatchReproTest.arm(mode)
	if not UNITY_EDITOR then
		return false, "孵化复现仅支持 Unity Editor"
	end

	if not Const.OpenPetHatchReproDebug then
		armedCase = nil

		return false, "孵化复现开关已关闭"
	end

	if mode == 0 or mode == "0" then
		armedCase = nil

		return true, "已关闭下一轮孵化复现"
	end

	if mode == 1 or mode == "1" then
		mode = "boxFull"
	elseif mode == 2 or mode == "2" then
		mode = "missingPet"
	end

	if not MODES[mode] then
		return false, "模式为 0 关闭、1 盒子满、2 宠物数据未同步"
	end

	if not pg.me or pg.me.destroyed then
		return false, "请进入游戏后设置孵化复现"
	end

	armedCase = {
		mode = mode,
		playerRef = setmetatable({
			pg.me
		}, weakValueMeta)
	}

	return true, "已设置下一轮孵化复现（仅生效一次）"
end

function PetHatchReproTest.clear()
	armedCase = nil
end

local function takeArmedCase(player, soulEggEvolution, runToken, chooseEpoch)
	local current = armedCase

	if not current then
		return nil
	end

	local owner = current.playerRef[1]

	if owner ~= player or pg.me ~= player then
		return nil
	end

	if not soulEggEvolution or soulEggEvolution._runToken ~= runToken or soulEggEvolution:getChooseEpoch() ~= chooseEpoch then
		return nil
	end

	armedCase = nil

	return current.mode
end

function PetHatchReproTest.intercept(player, soulEggEvolution, runToken, chooseEpoch, eggItemId, reply)
	if not canRun() then
		return false
	end

	local mode = takeArmedCase(player, soulEggEvolution, runToken, chooseEpoch)

	if not mode then
		return false
	end

	TimerManager.addNextFrameCb(function()
		if pg.me ~= player then
			return
		end

		if not soulEggEvolution or soulEggEvolution._runToken ~= runToken or soulEggEvolution:getChooseEpoch() ~= chooseEpoch then
			return
		end

		if mode == "boxFull" then
			reply(NoticeDef.PET_BOX_FULL)

			return
		end

		if mode == "missingPet" then
			player:RPC_SC_OnEggHatched("__pet_hatch_repro_missing__", eggItemId)
		end
	end)

	return true
end

return PetHatchReproTest
