-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Core\\Common\\ActorManager.lua

local ActorManager = {}

ActorManager.entities = {}
ActorManager.uid2Ent = {}

local _entities = ActorManager.entities
local _uid2Ent = ActorManager.uid2Ent

function ActorManager.getEntity(actorId)
	return _entities[actorId]
end

function ActorManager.addEntity(actorId, entity, uid)
	_entities[actorId] = entity

	if ToBool(uid) then
		_uid2Ent[uid] = entity
	end
end

function ActorManager.removeEntity(actorId, entity)
	if actorId == nil or actorId == 0 then
		return
	end

	local ent = _entities[actorId]

	if ent ~= entity then
		return
	end

	if ent and ent.uid then
		_uid2Ent[ent.uid] = nil
	end

	_entities[actorId] = nil
end

return ActorManager
