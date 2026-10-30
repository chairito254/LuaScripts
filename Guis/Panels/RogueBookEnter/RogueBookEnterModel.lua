-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBookEnter\\RogueBookEnterModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local RogueConst = require("Const.RogueConst")
local RogueBookData = require("Data.rogue_book_data")
local RogueBookEnterModel = Class.LightClass("RogueBookEnterModel", UIModel)

function RogueBookEnterModel.getBookTypeList()
	local index2Type = {
		RogueConst.BookTypeId.Buff,
		RogueConst.BookTypeId.Event,
		RogueConst.BookTypeId.Boss
	}
	local list = {}

	for _, bookId in ipairs(index2Type) do
		list[#list + 1] = {
			bookId = bookId,
			cfg = RogueBookData[bookId]
		}
	end

	return list
end

return RogueBookEnterModel
