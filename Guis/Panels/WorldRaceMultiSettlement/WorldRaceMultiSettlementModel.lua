-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRaceMultiSettlement\\WorldRaceMultiSettlementModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local Utils = require("Common.Utils.Utils")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local DungeonConst = require("Common.Const.DungeonConst")
local WorldRaceMultiSettlementModel = Class.LightClass("WorldRaceMultiSettlementModel", UIModel)

function WorldRaceMultiSettlementModel:ctor()
	self.rankingList = {}
end

function WorldRaceMultiSettlementModel:setInfo(info)
	self.info = info
	self.rankingList = {}
	self.winnerInfo = nil
	self.currentPlayerInfo = nil

	local results = info and info.results

	if not Utils.isTable(results) then
		return
	end

	local space = pg.space

	for _, result in ipairs(results) do
		local passerByInfo = space and space.passerByMap and space.passerByMap[result.playerId]
		local displayInfo = passerByInfo and passerByInfo:getDisplayInfo()
		local row = {
			playerId = result.playerId,
			uid = displayInfo and displayInfo.uid or "",
			rank = result.rank,
			isFinished = result.isFinished == true,
			raceTime = result.raceTime,
			name = displayInfo and displayInfo.name or "",
			animationKey = result.animationKey or info.winnerAnimationKey
		}

		self.rankingList[#self.rankingList + 1] = row

		if row.rank == 1 then
			self.winnerInfo = row
		end

		if pg.me and row.playerId == pg.me.id then
			self.currentPlayerInfo = row
		end
	end
end

function WorldRaceMultiSettlementModel:updateRanking(rankingList)
	if not Utils.isTable(rankingList) then
		return
	end

	local oldRows = {}

	for _, row in ipairs(self.rankingList) do
		oldRows[row.playerId] = row
	end

	self.rankingList = {}
	self.winnerInfo = nil
	self.currentPlayerInfo = nil

	for _, rankingInfo in ipairs(rankingList) do
		local row = oldRows[rankingInfo.playerId] or {
			uid = "",
			playerId = rankingInfo.playerId
		}

		row.rank = rankingInfo.rank
		row.isFinished = rankingInfo.isFinished == true

		if rankingInfo.uid and rankingInfo.uid ~= "" then
			row.uid = rankingInfo.uid
		end

		if rankingInfo.name and rankingInfo.name ~= "" then
			row.name = rankingInfo.name
		else
			row.name = row.name or ""
		end

		self.rankingList[#self.rankingList + 1] = row

		if row.rank == 1 then
			self.winnerInfo = row
		end

		if pg.me and row.playerId == pg.me.id then
			self.currentPlayerInfo = row
		end
	end
end

function WorldRaceMultiSettlementModel:getFinishedCount()
	local finishedCount = 0

	for _, row in ipairs(self.rankingList) do
		if row.isFinished then
			finishedCount = finishedCount + 1
		end
	end

	return finishedCount
end

function WorldRaceMultiSettlementModel:getTimeText(row)
	if not row then
		return "--"
	end

	if not row.isFinished then
		local status = pg.space and pg.space.status

		if status == DungeonConst.STATUS.REWARD or status == DungeonConst.STATUS.CLOSE then
			return pg.getGameString("OPEN_WORLD_RACING_UNFINISH")
		end

		return "--"
	end

	if type(row.raceTime) ~= "number" or row.raceTime < 0 then
		return "--"
	end

	return ClientActivityUtils.formatWorldRaceTime(row.raceTime)
end

return WorldRaceMultiSettlementModel
