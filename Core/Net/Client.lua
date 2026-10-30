-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Core\\Net\\Client.lua

local class = require("Core.Framework.Class")
local phonestcore = require("phonestcore")
local Client = class.Class("Client")

function Client:ctor(handlerType, handlerId, conType)
	self.handlerType = handlerType
	self.handlerId = handlerId
	self.cObj = phonestcore.newClient(conType)
	self.timeout = nil
end

function Client:destroy()
	if self.cObj ~= nil then
		self.cObj:destroyClient()

		self.cObj = nil
	end
end

function Client:connect(ip, port, sucID, failID, resolveID)
	if self.cObj == nil then
		return
	end

	if resolveID and self.cObj.setResolveHandler then
		self.cObj:setResolveHandler(resolveID)
	end

	self.cObj:startClient(ip, port, self.handlerType, self.handlerId, sucID, failID)
end

return Client
