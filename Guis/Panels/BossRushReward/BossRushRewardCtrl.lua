-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\BossRushReward\\BossRushRewardCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("BossRushRewardCtrl")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local BossRushRewardCtrl = Class.LightClass("BossRushRewardCtrl", UICtrl)
local BossRushUtils = require("Utils.BossRushUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local BossRushBuffReward = require("Data.bossrush_reward_data")
local NoticeDef = require("Common.NoticeDef")
local RedDotConst = require("Const.RedDotConst")

function BossRushRewardCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.minShowCount = 5
end

function BossRushRewardCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:close()
	end
end

function BossRushRewardCtrl:initUI()
	self.curStar = self.isOpen and select(2, BossRushUtils.getCurCycleTotalScore()) or 0

	function self.view.rewardUList.luaRenderItem(button, index, data)
		self:renderRewardRow(button, index, data)
	end

	local data = {}

	for index, rewardInfo in pairs(BossRushBuffReward) do
		local dropId = BossRushUtils.getGradeRewardDropId(self.cycleId, index)

		if dropId and dropId > 0 then
			table.insert(data, {
				needStar = index,
				rewardDropId = dropId
			})
		end
	end

	table.sort(data, function(a, b)
		return a.needStar < b.needStar
	end)

	self.rewardList = data

	self.view.rewardUList:SetList(data)
	self:focusLatestReward()
end

function BossRushRewardCtrl:getRewardState(data)
	local isUnlocked = self.isOpen and self.curStar >= data.needStar
	local isReceived = self.isOpen and (BossRushUtils.isGradeRewardReceived(data.needStar) or self.localReceivedRewards[data.needStar]) or false
	local canGet = self.isOpen and self.cycleId == pg.me.curBossRushCycleId and not isReceived and BossRushUtils.canReceiveGradeReward(data.needStar)

	return isUnlocked, isReceived, canGet
end

function BossRushRewardCtrl:renderRewardRow(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local textUBaseText = objectReference:GetRefValue("textUBaseText")
	local listUList = objectReference:GetRefValue("listUList")

	textUBaseText.text = self.curStar .. "/" .. data.needStar

	local _, isReceived, canGet = self:getRewardState(data)

	button:ClearRedDot()

	local rewards = LuaUIUtils.getRewardItemByDropId(data.rewardDropId, isReceived, canGet)

	for i = #rewards + 1, self.minShowCount do
		rewards[i] = {
			tIndex = 1
		}
	end

	function listUList.luaRenderItem(itemButton, itemIndex, itemData)
		self:renderRewardItem(itemButton, itemIndex, itemData, data.needStar, canGet)
	end

	listUList:SetList(rewards)
end

function BossRushRewardCtrl:renderRewardItem(button, index, data, needStar, canGet)
	button:ClearRedDot()

	button.luaClick = nil

	if data.tIndex == 1 then
		return
	end

	data.extraFunc = self:hasReceivableReward() and function()
		self:receiveGradeReward()
	end or nil

	LuaUIUtils.renderRewards(button, index, data, nil, function()
		self:close()
	end)
	pg.global.setRedDot(string.format(RedDotConst.RedDotPath.BOSS_RUSH_GRADE_REWARD_ITEM, self.cycleId, needStar, data.id), button, canGet, RedDotConst.RedDotStyle.REWARD)
end

function BossRushRewardCtrl:getLastRewardIndex()
	local firstUnfinishedIndex

	for index, data in ipairs(self.rewardList or {}) do
		local _, isReceived, canGet = self:getRewardState(data)

		if canGet then
			return index
		end

		if not firstUnfinishedIndex and not isReceived then
			firstUnfinishedIndex = index
		end
	end

	return firstUnfinishedIndex or self.rewardList and #self.rewardList or 0
end

function BossRushRewardCtrl:focusLatestReward()
	local targetIndex = self:getLastRewardIndex()

	if targetIndex > 0 then
		self.view.rewardUList:GoToIndex(targetIndex - 1, true)
	end
end

function BossRushRewardCtrl:hasReceivableReward()
	if not self.isOpen or self.cycleId ~= pg.me.curBossRushCycleId then
		return false
	end

	for grade in pairs(BossRushBuffReward) do
		if not self.localReceivedRewards[grade] and BossRushUtils.canReceiveGradeReward(grade) then
			return true
		end
	end

	return false
end

function BossRushRewardCtrl:receiveGradeReward()
	if self.receivingReward or not self:hasReceivableReward() then
		return
	end

	local receivingGrades = {}

	for grade in pairs(BossRushBuffReward) do
		if BossRushUtils.canReceiveGradeReward(grade) then
			receivingGrades[#receivingGrades + 1] = grade
		end
	end

	self.receivingReward = true

	pg.me:serverMsg("RPC_CS_BossRushReceiveAllGradeReward", function(errno, awardIdList)
		self.receivingReward = false

		if errno == NoticeDef.SUCCESS then
			for _, grade in ipairs(receivingGrades) do
				self.localReceivedRewards[grade] = true
			end

			self:initUI()
			BossRushUtils.showRewardObtainTips(awardIdList)
		end
	end)
end

function BossRushRewardCtrl:onDestroy()
	UICtrl.onDestroy(self)
end

function BossRushRewardCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.isOpen = BossRushUtils.checkIsOpen()
	self.cycleId = self.isOpen and pg.me.curBossRushCycleId or pg.me.nextBossRushCycleId or 0
	self.localReceivedRewards = {}

	self:initUI()
end

function BossRushRewardCtrl:onShow()
	return
end

function BossRushRewardCtrl:onHide()
	return
end

return BossRushRewardCtrl
