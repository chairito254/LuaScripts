-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\Sludge.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local Utils = require("Common.Utils.Utils")
local SandboxConst = require("Common.Const.SandboxConst")
local LuaCSharpList = require("Utils.LuaCSharpList")
local CallbackHandler = require("Core.Common.CallbackHandler")
local bit_band = bit.band
local bit_bnot = bit.bnot
local bit_bor = bit.bor
local bit_lshift = bit.lshift
local math_floor = math.floor
local math_huge = math.huge
local WORD_BITS = 32
local ALL_ONES = bit_bnot(0)
local Sludge = Class.LightClass("Sludge", LevelItem)

function Sludge:ctor(sandbox, spawnInfo, syncInfo)
	Sludge.super.ctor(self, sandbox, spawnInfo, syncInfo)

	self._weatherChangeCallback = nil
	self._currentAreaWeatherCallback = nil
	self._isRainActive = nil
end

function Sludge:onInit()
	local majorConfig = self:getMajorConfig()

	self.isAutoRefresh = majorConfig.isAutoRefresh or false
	self.refreshInterval = majorConfig.refreshInterval or 30
	self.debuffId = majorConfig.debuffId or 90001
	self.gridWidth = majorConfig.gridWidth or 4
	self.gridHeight = majorConfig.gridHeight or 4
	self.majorCompId = self.spawnInfo.majorCompId

	self:_buildExcludedCellIndices(majorConfig.excludedCells)

	local total = self.gridWidth * self.gridHeight

	self._cellTotal = total
	self._wordCount = math_floor((total + WORD_BITS - 1) / WORD_BITS)
	self._gridList = LuaCSharpList.newInt(self._wordCount, 0)

	self._gridList:setCount(self._wordCount)

	self._gridAccess = self._gridList:getCSharpAccess()
end

function Sludge:createShell(sandboxShell)
	local componentsInfo = self:_buildCSharpComponentsInfo()

	sandboxShell:CreateLevelItem(self.id, self, self.shareMem.shell, componentsInfo, self.editorName, self:getResId())
end

function Sludge:_buildCSharpComponentsInfo()
	local excludedCells = self:getMajorConfig().excludedCells

	if not Utils.isTable(excludedCells) then
		return self.componentsInfo
	end

	local keys = {}

	for key in pairs(excludedCells) do
		keys[#keys + 1] = key
	end

	table.sort(keys, function(a, b)
		if type(a) == "number" and type(b) == "number" then
			return a < b
		end

		if type(a) ~= type(b) then
			return type(a) < type(b)
		end

		return tostring(a) < tostring(b)
	end)

	local ok, coordinates = pcall(function()
		local result = {}

		for _, key in ipairs(keys) do
			local cell = excludedCells[key]

			if Utils.isTable(cell) then
				local x = cell[1]
				local y = cell[2]

				if type(x) == "number" and type(y) == "number" and x >= 0 and x < self.gridWidth and x == math_floor(x) and y >= 0 and y < self.gridHeight and y == math_floor(y) then
					local coordinate = CS.UnityEngine.Vector2Int(x, y)

					if type(coordinate) ~= "userdata" or coordinate.x ~= x or coordinate.y ~= y then
						error("Vector2Int construction did not preserve coordinates")
					end

					result[#result + 1] = coordinate
				end
			end
		end

		return result
	end)

	if not ok then
		error("Sludge " .. tostring(self.id) .. " cannot prepare Vector2Int configuration: " .. tostring(coordinates), 0)
	end

	local componentsInfo = {}

	for key, value in pairs(self.componentsInfo or {}) do
		componentsInfo[key] = value
	end

	local majorCompInfo = {}

	for key, value in pairs(componentsInfo[self.majorCompId] or {}) do
		majorCompInfo[key] = value
	end

	majorCompInfo.excludedCells = coordinates
	componentsInfo[self.majorCompId] = majorCompInfo

	return componentsInfo
end

function Sludge:onSandboxReady()
	local comp = self:_getMajorComp()

	if comp then
		comp:BindGridBuffer(self._gridAccess, self.gridWidth, self.gridHeight)
	end

	if self.syncInfo then
		if self.syncInfo.gridPack then
			local excludedCellsChanged = self:_applyFullToBitset(self.syncInfo.gridPack)

			if excludedCellsChanged and self.sandbox.isMain then
				self:onCellsChanged()
			end
		else
			self:fillAll()
			self:onCellsChanged()
		end
	end

	self:_registerWeatherChangeCallback()
	self:_registerCurrentAreaWeatherCallback()

	local map = pg and pg.game and pg.game.map

	if map then
		self:_refreshRainState()
	end
end

function Sludge:_getMajorComp()
	if not self.shell or not self.majorCompId then
		return nil
	end

	return self.shell:GetComponentById(self.majorCompId)
end

function Sludge:onWeatherChanged(oldValue, newValue, blockAreaId)
	local map = pg and pg.game and pg.game.map

	if not map or map:getCurBlockAreaId() ~= blockAreaId then
		return
	end

	self:_refreshRainState()
end

function Sludge:onCurrentAreaWeatherRefresh(eventData)
	local map = pg and pg.game and pg.game.map

	if not map then
		return
	end

	self:_refreshRainState()
end

function Sludge:_refreshRainState()
	local space = self.sandbox and self.sandbox.space

	if not space or not space.getWeather then
		return
	end

	local weatherId = space:getWeather()

	self:_setRainActive(weatherId == 2 or weatherId == 4 or weatherId == 12)
end

function Sludge:_setRainActive(isActive)
	if self._isRainActive == isActive then
		return
	end

	local comp = self:_getMajorComp()

	if not comp then
		return
	end

	comp:SetRainActive(isActive)

	self._isRainActive = isActive
end

function Sludge:_registerWeatherChangeCallback()
	if self._weatherChangeCallback then
		return
	end

	local space = self.sandbox and self.sandbox.space

	if not space or not space.addWeatherChangeCallback then
		return
	end

	self._weatherChangeCallback = CallbackHandler(self, "onWeatherChanged")

	space:addWeatherChangeCallback(self._weatherChangeCallback)
end

function Sludge:_unregisterWeatherChangeCallback()
	if not self._weatherChangeCallback then
		return
	end

	local space = self.sandbox and self.sandbox.space

	if space and space.removeWeatherChangeCallback then
		space:removeWeatherChangeCallback(self._weatherChangeCallback)
	end

	self._weatherChangeCallback = nil
end

function Sludge:_registerCurrentAreaWeatherCallback()
	if self._currentAreaWeatherCallback or not pg.me then
		return
	end

	self._currentAreaWeatherCallback = CallbackHandler(self, "onCurrentAreaWeatherRefresh")

	local eventName = pg.me.id .. SandboxConst.COMMON_EVENT.CURRENT_AREA_WEATHER_REFRESH

	facade:registerLuaEvent(eventName, self._currentAreaWeatherCallback)
end

function Sludge:_unregisterCurrentAreaWeatherCallback()
	if not self._currentAreaWeatherCallback then
		return
	end

	facade:unregisterLuaEvent(self._currentAreaWeatherCallback)

	self._currentAreaWeatherCallback = nil
end

function Sludge:reportEnterSludge(entityId)
	if self.sandbox.isMain then
		self:serverMsg("RPC_CS_EnterSludge", entityId)
	end
end

function Sludge:reportLeaveSludge(entityId)
	if self.sandbox.isMain then
		self:serverMsg("RPC_CS_LeaveSludge", entityId)
	end
end

function Sludge:RPC_SC_FillAll()
	self:fillAll()
	self:onCellsChanged()
end

function Sludge:RPC_SC_FillCells(cellIndices)
	if not self.sandbox.isMain or type(cellIndices) ~= "table" then
		return
	end

	local hasValidCell = false

	for _, cellIndex in ipairs(cellIndices) do
		if self:_isValidCellIndex(cellIndex) and not self:_isExcludedCellIndex(cellIndex) then
			hasValidCell = true

			self:_setCellActive(cellIndex, true)
		end
	end

	if not hasValidCell then
		return
	end

	local comp = self:_getMajorComp()

	if comp then
		comp:FillAll()
	end

	self:onCellsChanged()
end

function Sludge:onCellsChanged()
	local comp = self:_getMajorComp()

	if comp then
		comp:RefreshBuffContacts()
	end

	if self.sandbox.isMain then
		self:serverMsg("RPC_CS_SyncGridInfo", self:_buildFullPacked())
	end
end

function Sludge:_buildFullPacked()
	self:_applyExcludedCellMask()

	local gridPack = {
		self.gridWidth,
		self.gridHeight,
		self._wordCount
	}

	for i = 1, self._wordCount do
		gridPack[3 + i] = self._gridList:rawGet(i) or 0
	end

	return gridPack
end

function Sludge:onLevelItemValueChange(key, oldValue, value)
	if key == "gridPack" and not self.sandbox.isMain then
		self:_applyFullToBitset(value)
	end
end

function Sludge:_applyFullToBitset(arr)
	if type(arr) ~= "table" then
		return false
	end

	local w = arr[1]
	local h = arr[2]
	local wordCount = arr[3]

	if w ~= self.gridWidth or h ~= self.gridHeight then
		return false
	end

	if wordCount ~= self._wordCount then
		return false
	end

	for i = 1, wordCount do
		local word = arr[3 + i] or 0

		self._gridList:rawSet(i, word)
	end

	return self:_applyExcludedCellMask()
end

function Sludge:_buildExcludedCellIndices(excludedCells)
	self._excludedCellIndices = {}
	self._excludedCellCount = 0

	if not Utils.isTable(excludedCells) then
		return
	end

	for _, cell in pairs(excludedCells) do
		if Utils.isTable(cell) then
			local x = cell[1]
			local y = cell[2]

			if type(x) == "number" and x == x and x ~= math_huge and x ~= -math_huge and x == math_floor(x) and type(y) == "number" and y == y and y ~= math_huge and y ~= -math_huge and y == math_floor(y) and x >= 0 and x < self.gridWidth and y >= 0 and y < self.gridHeight then
				local cellIndex = y * self.gridWidth + x

				if not self._excludedCellIndices[cellIndex] then
					self._excludedCellIndices[cellIndex] = true
					self._excludedCellCount = self._excludedCellCount + 1
				end
			end
		end
	end
end

function Sludge:_isExcludedCellIndex(cellIndex)
	return self._excludedCellIndices[cellIndex] == true
end

function Sludge:_applyExcludedCellMask()
	if not self._gridList then
		return false
	end

	local changed = false

	for cellIndex in pairs(self._excludedCellIndices) do
		if self:_setCellActive(cellIndex, false) then
			changed = true
		end
	end

	return changed
end

function Sludge:_isValidCellIndex(cellIndex)
	return type(cellIndex) == "number" and cellIndex == cellIndex and cellIndex == math_floor(cellIndex) and cellIndex >= 0 and cellIndex < self._cellTotal
end

function Sludge:_setCellActive(cellIndex, active)
	if not self:_isValidCellIndex(cellIndex) then
		return false
	end

	if active and self:_isExcludedCellIndex(cellIndex) then
		return false
	end

	local wordIndex = math_floor(cellIndex / WORD_BITS) + 1
	local bitOffset = cellIndex % WORD_BITS
	local oldWord = self._gridList:rawGet(wordIndex) or 0
	local mask = bit_lshift(1, bitOffset)
	local newWord

	if active then
		newWord = bit_bor(oldWord, mask)
	else
		newWord = bit_band(oldWord, bit_bnot(mask))
	end

	if newWord == oldWord then
		return false
	end

	self._gridList:rawSet(wordIndex, newWord)

	return true
end

function Sludge:fillAll()
	local total = self._cellTotal
	local wordCount = self._wordCount

	if wordCount <= 0 then
		return
	end

	for i = 1, wordCount - 1 do
		self._gridList:rawSet(i, ALL_ONES)
	end

	local lastBits = total - (wordCount - 1) * WORD_BITS

	if lastBits >= WORD_BITS then
		self._gridList:rawSet(wordCount, ALL_ONES)
	else
		local mask = bit_lshift(1, lastBits) - 1

		self._gridList:rawSet(wordCount, mask)
	end

	self:_applyExcludedCellMask()

	local comp = self:_getMajorComp()

	if comp then
		comp:FillAll()
	end
end

function Sludge:destroy()
	local comp = self:_getMajorComp()

	if comp then
		comp:ReleaseBuffContacts()
	end

	self:_unregisterCurrentAreaWeatherCallback()
	self:_unregisterWeatherChangeCallback()

	if self._gridList then
		self._gridList:destroyCSharpAccess()

		self._gridAccess = nil
		self._gridList = nil
	end

	Sludge.super.destroy(self)
end

return Sludge
