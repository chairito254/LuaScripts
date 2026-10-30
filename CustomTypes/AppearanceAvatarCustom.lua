-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\AppearanceAvatarCustom.lua

local class = require("Core.Framework.Class")
local CustomDict = require("Core.PropertySync.CustomDict")
local AppearanceAvatarCustomOne = require("CustomTypes.AppearanceAvatarCustomOne")
local AppearanceData = require("Data.appearance_data")
local AppearanceAvatarCustom = class.LiteClass("AppearanceAvatarCustom", CustomDict)

function AppearanceAvatarCustom:getCount()
	local count = 0

	for index, _ in pairs(self) do
		if type(index) == "number" then
			count = count + 1
		end
	end

	return count
end

function AppearanceAvatarCustom:unlock()
	local newIndex = self:getCount() + 1

	self[newIndex] = AppearanceAvatarCustomOne({})
end

return AppearanceAvatarCustom
