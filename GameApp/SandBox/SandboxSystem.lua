-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\SandboxSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local SandboxConst = require("Common.Const.SandboxConst")
local SandboxLevelItemPoolConfig = require("GameApp.Sandbox.SandboxLevelItemPoolConfig")
local SandboxSystem = Class.LightClass("SandboxSystem", SystemBase)

function SandboxSystem:onInit()
	SystemBase.onInit(self)
	self:registerLevelItemPoolConfig()
	self:registerBinaryData()
	appFacade.sandboxManager:ConfigureItemStreaming(SandboxConst.STREAM_LOAD_BUDGET_US, SandboxConst.STREAM_LOAD_MIN_ITEMS_PER_FRAME)
end

function SandboxSystem:registerLevelItemPoolConfig()
	local config = SandboxLevelItemPoolConfig
	local manager = appFacade and appFacade.sandboxManager

	assert(manager, "SandboxSystem: C# SandboxManager is not initialized")
	assert(type(config.maxTotalIdleCount) == "number", "SandboxSystem: maxTotalIdleCount must be a number")
	assert(type(config.capacityByRes) == "table", "SandboxSystem: capacityByRes must be a table")
	manager:RegisterLevelItemPoolConfig(config.maxTotalIdleCount, config.capacityByRes)
end

function SandboxSystem:registerBinaryData()
	local moduleName = "Common.Data.sandbox_binary_data"
	local ok, data = pcall(require, moduleName)

	if not ok then
		if type(data) ~= "string" or not string.find(data, "module '" .. moduleName .. "' not found:", 1, true) then
			error(data, 0)
		end

		self.binaryDataSource = nil
		self.binaryDataView = nil

		appFacade.sandboxManager:RegisterBinaryData(nil)

		return
	end

	self.binaryDataSource = data
	self.binaryDataView = setmetatable({
		owner = self
	}, {
		__index = function(view, id)
			return view.owner:getBinaryPayload(id)
		end
	})

	appFacade.sandboxManager:RegisterBinaryData(self.binaryDataView)
end

function SandboxSystem:getBinaryPayload(id)
	return self.binaryDataSource and self.binaryDataSource[id]
end

function SandboxSystem:onDestroy()
	appFacade.sandboxManager:RegisterBinaryData(nil)

	self.binaryDataView = nil
	self.binaryDataSource = nil

	SystemBase.onDestroy(self)
end

return SandboxSystem
