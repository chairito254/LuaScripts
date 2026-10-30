-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\PlayerComponent\\ClientRankComponent.lua

local CallbackHandler = require("Core.Common.CallbackHandler")
local Class = require("Core.Framework.Class")
local RankUtils = require("Utils.RankUtils")
local ClientRankComponent = Class.Component("ClientRankComponent")

function ClientRankComponent:getRankSetTimeMetaBatch(rankIds, callback)
	if rankIds == nil or #rankIds > 10 then
		self:_rankSetTimeMetaBatchCallback(callback, {
			errmsg = "rankIds must be a list of at most 10 rank ids",
			status = false
		}, nil)

		return
	end

	self:callService("RankService", "getRankSetTimeMetaBatch", {
		rankIds
	}, CallbackHandler(self, "_rankSetTimeMetaBatchCallback", callback), {
		hint = "rank_set_time_meta_batch"
	})
end

function ClientRankComponent:_rankSetTimeMetaBatchCallback(callback, retStatus, response)
	if callback ~= nil then
		callback(retStatus, response)
	end
end

function ClientRankComponent:getRankTabMapping(rankId, tab1, tab2, callback)
	self:callService("RankService", "getRankTabMapping", {
		rankId,
		tab1,
		tab2,
		RankUtils.getRankClusterId()
	}, CallbackHandler(self, "_rankTabMappingCallback", callback), {
		hint = rankId
	})
end

function ClientRankComponent:getRankTabMappingList(callback)
	self:callService("RankService", "getRankTabMappingList", {
		RankUtils.getRankClusterId()
	}, CallbackHandler(self, "_rankTabMappingCallback", callback), {
		hint = "rank_tab_mapping_list"
	})
end

function ClientRankComponent:_rankTabMappingCallback(callback, retStatus, response)
	if callback then
		callback(retStatus, response)
	end
end

function ClientRankComponent:queryRankMembers(rankId, memberIds, callback)
	self:callService("RankService", "queryRankMembers", {
		rankId,
		memberIds
	}, CallbackHandler(self, "_rankMembersCallback", callback), {
		hint = rankId
	})
end

function ClientRankComponent:queryRankMemberExtraInfo(rankId, memberIds, callback)
	if memberIds == nil or #memberIds ~= 1 then
		if callback then
			callback({
				errmsg = "memberIds must contain exactly one member id",
				status = false
			}, nil)
		end

		return
	end

	self:callService("RankService", "queryRankMemberExtraInfo", {
		rankId,
		memberIds
	}, CallbackHandler(self, "_rankMemberExtraInfoCallback", callback), {
		hint = rankId
	})
end

function ClientRankComponent:_rankMemberExtraInfoCallback(callback, retStatus, response)
	if callback then
		callback(retStatus, response)
	end
end

function ClientRankComponent:_rankMembersCallback(callback, retStatus, response)
	if callback then
		callback(retStatus, response)
	end
end

function ClientRankComponent:rangeRankMembers(rankId, low, high, callback)
	self:callService("RankService", "rangeRankMembers", {
		rankId,
		low,
		high
	}, CallbackHandler(self, "_rankMembersCallback", callback), {
		hint = rankId
	})
end

return ClientRankComponent
