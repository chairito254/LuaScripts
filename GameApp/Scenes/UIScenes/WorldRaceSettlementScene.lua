-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Scenes\\UIScenes\\WorldRaceSettlementScene.lua

local Class = require("Core.Framework.Class")
local ModelScene = require("GameApp.Scenes.UIScenes.ModelScene")
local ClientConst = require("Const.ClientConst")
local PlayableConst = require("Common.Const.PlayableConst")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local Utils = require("Common.Utils.Utils")
local SysConfigData = require("Data.sys_config_data")
local WorldRaceSettlementScene = Class.LightClass("WorldRaceSettlementScene", ModelScene)

function WorldRaceSettlementScene:onStart()
	ModelScene.onStart(self, {
		type = ClientConst.ModelSceneType.ContinuousFrame
	})

	self.scene.transform.position = Vector3(0, 5000, 0)
	self.winnerPlayerId = nil
	self.winnerAnimation = nil
end

function WorldRaceSettlementScene:_clearWinner()
	if self.winnerPlayerId then
		self:removeEntity(self.winnerPlayerId)
	end

	self.winnerPlayerId = nil
	self.winnerAnimation = nil
	self.waitLoadEntity = false
end

function WorldRaceSettlementScene:setWinner(winnerInfo)
	self:_clearWinner()

	if not winnerInfo or not winnerInfo.playerId or not winnerInfo.avatarPresetKey or not pg.game.avatar:getAvatarPresetData(winnerInfo.avatarPresetKey) then
		return false
	end

	local curShow = winnerInfo.curShow

	if type(curShow) == "string" then
		local decoded = curShow ~= "" and decompressFromStr(curShow) or ""

		curShow = decoded and decoded ~= "" and string.toTable(decoded) or nil
	end

	self.winnerPlayerId = winnerInfo.playerId

	local animationKey = SysConfigData.WORLD_RACE_SETTLEMENT_ANIMATION_KEY

	self.winnerAnimation = PlayableConst[animationKey] or PlayableConst.Show_Idle

	self:showPlayerEntity({
		[self.winnerPlayerId] = {
			avatarConfig = winnerInfo.avatarConfig,
			curShow = curShow or {},
			avatarPresetKey = winnerInfo.avatarPresetKey,
			ani = self.winnerAnimation
		}
	}, true)

	return true
end

function WorldRaceSettlementScene._getCameraParam()
	local cameraConst = WorldRaceDungeonConst.SETTLEMENT_CAMERA
	local defaultParam = cameraConst.DEFAULT_PARAM
	local configParam = SysConfigData[cameraConst.GLOBAL_CONFIG_KEY]

	if not Utils.isTable(configParam) then
		configParam = defaultParam
	end

	return {
		blendTime = 0,
		bvScreenPos = Vector2(tonumber(configParam[1]) or defaultParam[1], tonumber(configParam[2]) or defaultParam[2]),
		fov = tonumber(configParam[3]) or defaultParam[3],
		distance = tonumber(configParam[4]) or defaultParam[4],
		pitch = tonumber(configParam[5]) or defaultParam[5],
		yaw = tonumber(configParam[6]) or defaultParam[6]
	}
end

function WorldRaceSettlementScene:onAllEntityLoaded()
	local winnerEntity = self.winnerPlayerId and self:getEntity(self.winnerPlayerId)

	if not winnerEntity then
		return
	end

	ModelScene.onAllEntityLoaded(self)
	self.cameraMode:enableCamera(false)

	local entities = self:getAllEntities()
	local cameraParam = WorldRaceSettlementScene._getCameraParam()

	self.cameraMode:enableCustomCamera(true, entities, cameraParam)
	self:runWhenAnimatorReady(winnerEntity, function()
		if self.winnerPlayerId and self:getEntity(self.winnerPlayerId) == winnerEntity then
			winnerEntity:playAnimation(self.winnerAnimation, true, nil, true)
		end
	end)
end

return WorldRaceSettlementScene
