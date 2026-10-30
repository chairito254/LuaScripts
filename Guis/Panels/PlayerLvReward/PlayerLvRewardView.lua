-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PlayerLvReward\\PlayerLvRewardView.lua

local logger = require("Core.Log.LoggerManager").getLogger("PlayerLvRewardView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PlayerLvRewardView = Class.LightClass("PlayerLvRewardView", UIView)

function PlayerLvRewardView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBack = objectReference:GetRefValue("btnBack")
	self.lvList = objectReference:GetRefValue("lvList")
	self.bgBlurUIBlurEffect = objectReference:GetRefValue("bgBlurUIBlurEffect")
end

function PlayerLvRewardView:registerObjects()
	return
end

function PlayerLvRewardView:initView()
	return
end

return PlayerLvRewardView
