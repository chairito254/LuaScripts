-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\CITipArea\\LuckyPropObtainItem.lua

local Class = require("Core.Framework.Class")
local BaseQueueItem = require("Guis.Panels.Tips.Items.BaseQueueItem")
local SysConfigData = require("Data.sys_config_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientConst = require("Const.ClientConst")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local PropObtain = require("Guis.Panels.Tips.Items.CTipArea.PropObtainItem")
local LuckyPropObtainItem = Class.LightClass("LuckyPropObtainItem", PropObtain)

return LuckyPropObtainItem
