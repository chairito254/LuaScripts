-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\RbPetPendingInfoList.lua

local class = require("Core.Framework.Class")
local CustomList = require("Core.PropertySync.CustomList")
local RbPetPendingInfo = require("CustomTypes.RbPetPendingInfo")
local RbPetPendingInfoList = class.LiteClass("RbPetPendingInfoList", CustomList, {
	RbPetPendingInfo
})

return RbPetPendingInfoList
