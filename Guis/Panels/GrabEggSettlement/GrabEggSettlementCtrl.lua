-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\GrabEggSettlement\\GrabEggSettlementCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("GrabEggSettlementCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local GrabEggSettlementCtrl = Class.LightClass("GrabEggSettlementCtrl", UICtrl)
local Const = require("Common.Const.Const")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local NoticeDef = require("Common.NoticeDef")
local AddressDataConst = require("Const.AddressDataConst")
local UIConst = require("Const.UIConst")
local SceneData = require("Data.scene_data")
local SysNoticeData = require("Data.sys_notice_data")
local DungeonDifficultLevelData = require("Data.dungeon_difficult_level_data")
local Time = require("Core.Common.Time")
local TimeUtils = require("Common.Utils.TimeUtils")
local lume = require("Core.Common.lume")
local PuppetData = require("Data.puppet_data")

GrabEggSettlementCtrl.messages = {
	[MessageName.GRAB_EGG_REWARD_BOX_CHANGED] = {
		"onRewardBoxChanged",
		true
	},
	[MessageName.GRAB_EGG_NOVICE_PROTECTION_CHANGED] = {
		"refreshNoviceProtectionView",
		true
	}
}

local DEATH_INFO_TEMPLATE_INDEX = 1
local DEATH_INFO_TEXT_KEY = "GRAB_EGG_SETTLEMENT_DEATH_INFO"
local ACCIDENTAL_DEATH_TEXT_KEY = "GRAB_EGG_SETTLEMENT_ACCIDENTAL_DEATH"
local LUCKY_CHEST_TIPS_DESC_TEXT_KEY = "GRABEGG_LUCKYCHEST_TIPS_DESC"
local NOVICE_PROTECTION_RESULT_TEXT_KEY = "GRAB_EGG_NOVICEPROTECTION_RESULT"
local PVP_SUCCESS_TEXT_KEY = "GRAB_EGG_PVP_CAPTURE_SUCCESS"
local PVP_FAILURE_TEXT_KEY = "GRAB_EGG_PVP_CAPTURE_FAIL"
local MODE_PVE = 0
local MODE_PVP_BIG_EGG = 1
local MODE_PVP_NO_BIG_EGG = 2
local PVP_DIFFICULTY_PAGE = 4
local REWARD_STATE_GET = 0
local REWARD_STATE_FULL = 1
local REWARD_STATE_MAX = 2
local GET_EGG_STATE_EMPTY = 0
local GET_EGG_STATE_SINGLE = 1
local GET_EGG_STATE_SHARED = 2
local GET_EGG_STATE_BOTH = 3
local BGM_HitAndRun_Fail = "BGM_HitAndRun_Fail"
local BGM_HitAndRun_Victory = "BGM_HitAndRun_Victory"
local ROB_EGG_RECYCLE_TIP_KEY = "GRAB_EGG_PVP_TXT_1"

function GrabEggSettlementCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.result = info.result
	self.resInfo = info.resInfo
	self.isPvp = tonumber(self.resInfo.sceneId) == Const.ROB_EGG_SCENE_ID
	self.pvpChestList = self.isPvp and self.model:getPvpSettlementChestList() or nil
	self.fallTimer = nil
	self.chestTimer = nil

	self.view.protectInfoUWidget:SetActive(false)
	self:registerComponent()
end

function GrabEggSettlementCtrl:addListener()
	return
end

function GrabEggSettlementCtrl:onRewardBoxChanged()
	if self.resInfo then
		self:refreshChest()
	end
end

function GrabEggSettlementCtrl:refreshNoviceProtectionView()
	if not self.resInfo then
		return
	end

	local hardLv = self.resInfo.levelInfo and tonumber(self.resInfo.levelInfo.hardLv) or pg.space and pg.space.hardLv
	local player = pg.me
	local info = hardLv and player and player.grabEgg_getNoviceProtectionInfo and player:grabEgg_getNoviceProtectionInfo(self.resInfo.sceneId, hardLv)
	local visible = self.resInfo.result == Const.ROB_EGG_RESULT.Failure and info ~= nil and info.isCurrentRoundProtected

	self.view.protectInfoUWidget:SetActive(visible)

	if not visible then
		return
	end

	ClientTextUtils.setText(self.view.protectInfoUSDFText, pg.getFormatText(pg.getGameString(NOVICE_PROTECTION_RESULT_TEXT_KEY), info.remainingTimes, info.totalTimes))
end

function GrabEggSettlementCtrl:onDestroy()
	self:killChestTimer()
	UICtrl.onDestroy(self)

	self.resInfo = nil
end

function GrabEggSettlementCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self.view.openAnim:Play()
	self:refreshUI()
end

function GrabEggSettlementCtrl:onShow()
	return
end

function GrabEggSettlementCtrl:onHide()
	self:killChestTimer()
end

function GrabEggSettlementCtrl:registerComponent()
	local function renderEggItem(button, index, data)
		button.draggable = false

		LuaUIUtils.renderRewardItem(button, {
			skipConditionConvert = true,
			num = 1,
			id = data.templateId
		})

		local objectReference = button:GetComponent("ObjectReference")
		local getEggShareUWidget = objectReference:GetRefValue("getEggShareUWidget")

		getEggShareUWidget:SetActive(data.isShare == true)
	end

	self.view.FullEggUList.luaRenderItem = renderEggItem
	self.view.listSingleUList.luaRenderItem = renderEggItem
	self.view.listSharedUList.luaRenderItem = renderEggItem

	local function renderChestItem(button, index, data)
		button.draggable = false

		if data.tIndex == 1 then
			return
		end

		LuaUIUtils.renderRewardItem(button, data)

		local objectReference = button:GetComponent("ObjectReference")
		local getEggShareUWidget = objectReference:GetRefValue("getEggShareUWidget")

		getEggShareUWidget:SetActive(false)
	end

	self.view.bigEggUList.luaRenderItem = renderChestItem
	self.view.noBigEggUList.luaRenderItem = renderChestItem

	function self.view.listTaskUList.luaRenderItem(button, index, data)
		self:onRenderTaskItem(button, index, data)
	end

	function self.view.btnOrganizeUButton.luaClick()
		self:onClickOrganize()
	end

	function self.view.btnShareUButton.luaClick()
		self:onClickShare()
	end

	local btnLuckyInfoUButton = self.view.btnLuckyInfoUButton

	btnLuckyInfoUButton.enabledTooltip = true

	function btnLuckyInfoUButton.luaRenderTooltip(_, tooltip)
		local objectReference = tooltip:GetComponent("ObjectReference")
		local txtTitle = objectReference:GetRefValue("txtTitle")
		local txtDesc = objectReference:GetRefValue("txtDesc")

		tooltip:TryChangePage("headTitle", 1)
		tooltip:TryChangePage("Btn", 0)
		ClientTextUtils.setText(txtTitle, pg.getGameString("GRABEGG_LUCKYCHEST_TITLE"))
		ClientTextUtils.setText(txtDesc, pg.getGameString(LUCKY_CHEST_TIPS_DESC_TEXT_KEY))
	end

	function btnLuckyInfoUButton.luaClick()
		btnLuckyInfoUButton:OpenTooltipWithUrl(AddressDataConst.UI_TOOLTIP_SKILL_INFO_WITH_TITLE)
	end
end

function GrabEggSettlementCtrl:refreshUI()
	local hardLv = self.resInfo.levelInfo and tonumber(self.resInfo.levelInfo.hardLv) or pg.space.hardLv
	local difficultData = DungeonDifficultLevelData[self.resInfo.sceneId]

	difficultData = difficultData and difficultData[hardLv]

	local resultUIAsset = difficultData and difficultData.resultUIAsset
	local isSuccess = self.resInfo.result == Const.ROB_EGG_RESULT.Success
	local bgUrl = resultUIAsset and resultUIAsset[isSuccess and 1 or 2]

	if string.isNilOrEmpty(bgUrl) then
		bgUrl = resultUIAsset and resultUIAsset[1]
	end

	if self.view.bg and not string.isNilOrEmpty(bgUrl) then
		self.view.bg.url = bgUrl
	end

	if isSuccess then
		self.view.rootUComponent:TryChangePage("State", 0)
		pg.game.audio:playEvent(BGM_HitAndRun_Victory)
		ClientTextUtils.setText(self.view.txtSuccessRoleUBaseText, pg.getGameString(self.isPvp and PVP_SUCCESS_TEXT_KEY or "GRAB_EGG_SETTLE_STATE1"))
	else
		self.view.rootUComponent:TryChangePage("State", 2)
		pg.game.audio:playEvent(BGM_HitAndRun_Fail)
		ClientTextUtils.setText(self.view.txtFailUSDFText, pg.getGameString(self.isPvp and PVP_FAILURE_TEXT_KEY or "GRAB_EGG_SETTLE_STATE3"))
	end

	ClientTextUtils.setText(self.view.txtTitleProfitUBaseText, pg.getGameString("GRAB_EGG_PROFIT"))
	ClientTextUtils.setText(self.view.textTitleUSDFText, pg.getGameString("GRAB_EGG_PROFIT"))
	self:refreshHarvest()
	self.view.rootUComponent:TryChangePage("Difficulty", self.isPvp and PVP_DIFFICULTY_PAGE or hardLv - 1)

	if self.isPvp then
		ClientTextUtils.setText(self.view.txtDifficultyUBaseText, pg.getGameString("DUNGEON_DIFFICUITY_99"))
	elseif hardLv == Const.DungeonDifficultLevel.CHAOS then
		ClientTextUtils.setText(self.view.txtDifficultyUBaseText, pg.getGameString("GRAB_EGG_ChaosDifficulty_3"))
	else
		ClientTextUtils.setText(self.view.txtDifficultyUBaseText, pg.getGameString("DUNGEON_DIFFICUITY_" .. hardLv))
	end

	LuaUIUtils.setUIVisible(self.view.btnHarvestDetailsUButton, false)
	LuaUIUtils.setUIVisible(self.view.btnDefeatDetailsUButton, false)
	LuaUIUtils.setUIVisible(self.view.btnShareUButton, false)

	local sceneData = SceneData[self.resInfo.sceneId]

	ClientTextUtils.setText(self.view.txtMapNameUBaseText, pg.getLocalizationText(sceneData.sceneName))

	local startTime = pg.me.space.start_ts or 0
	local totalTime = self.resInfo.finish_time - startTime
	local killUserCount = 0

	for _, killInfo in pairs(self.resInfo.killUser or {}) do
		killUserCount = killUserCount + killInfo.deadTimes
	end

	local killNpcCount = self.resInfo.killNpc and lume.count(self.resInfo.killNpc) or 0

	ClientTextUtils.setText(self.view.txtTimeUBaseText, TimeUtils.timeToFormatStringMMSS(totalTime))
	self.view.txtHarvestUBaseText:SetNumber(self.resInfo.profit)

	local needShowDouble = not self.isPvp and self.resInfo.coinFactor and self.resInfo.coinFactor > 0

	self.view.doublePointUWidget:SetActive(needShowDouble)

	if needShowDouble then
		local startNum = self.resInfo.profit
		local endNum = self.resInfo.profit + math.floor(self.resInfo.profit * self.resInfo.coinFactor)

		ClientTextUtils.setText(self.view.txtDoubleUBaseText, string.format(pg.getGameString("GRAB_EGG_SETTLE_DOUBLE"), "x" .. self.resInfo.coinFactor))
		ClientTextUtils.setText(self.view.txtPointAddUBaseText, string.format("+%s", endNum - startNum))

		local function getDigitCount(num)
			if num == 0 then
				return 1
			end

			return math.floor(math.log10(math.abs(num))) + 1
		end

		local diffCount = getDigitCount(endNum) - getDigitCount(startNum)
		local startString = diffCount > 0 and string.rep("0", diffCount) .. startNum or startNum

		self.view.txtHarvestUBaseText:SetText(startString)
		self.view.valueUWidget:InvokeCallbackWithCallback(CS.XGUI.EInvokeTime.Custom1, function()
			startString = diffCount > 0 and string.rep("1", diffCount) .. startNum or startNum
			self.view.txtHarvestUBaseText.StartNumber = tonumber(startString)
			self.view.txtHarvestUBaseText.EndNumber = endNum

			if endNum ~= 0 then
				self.view.txtHarvestUBaseText:StartDancing()
			end

			pg.game.audio:playEvent("SFX_UI_QiangDan_DoubleSettlementCoinLoop")
			self:startTimer(function()
				self.view.valueUWidget:InvokeCallback(CS.XGUI.EInvokeTime.Custom2)
			end, 2)
			self:startTimer(function()
				pg.game.audio:stopEvent("SFX_UI_QiangDan_DoubleSettlementCoinLoop")
			end, 1.7)
		end)
		self:startTimer(function()
			pg.game.audio:playEvent("SFX_UI_QiangDan_DoubleSettlementTag")
		end, 0.5)
	else
		ClientTextUtils.setText(self.view.txtPointAddUBaseText, "")
	end

	ClientTextUtils.setText(self.view.txtDefeatUBaseText, killUserCount + killNpcCount)

	local taskList = {}
	local killedReason = self.resInfo.killed_reason
	local killedName = self.resInfo.killed_name

	if killedReason == Const.ROBEGG_DEATH_REASON.KILLED_BY_PUPPET then
		local puppetInfo = PuppetData[tonumber(killedName)]

		killedName = puppetInfo and pg.getLocalizationText(puppetInfo.name) or ""
	end

	local killedByEntity = killedReason == Const.ROBEGG_DEATH_REASON.KILLED_BY_PLAYER or killedReason == Const.ROBEGG_DEATH_REASON.KILLED_BY_PUPPET

	if not self.isPvp and self.resInfo.result == Const.ROB_EGG_RESULT.Failure then
		if killedByEntity and not string.isNilOrEmpty(killedName) then
			taskList[#taskList + 1] = {
				tIndex = DEATH_INFO_TEMPLATE_INDEX,
				textKey = DEATH_INFO_TEXT_KEY,
				killedName = killedName
			}
		elseif killedReason == Const.ROBEGG_DEATH_REASON.ACCIDENGTAL_DEATH then
			taskList[#taskList + 1] = {
				tIndex = DEATH_INFO_TEMPLATE_INDEX,
				textKey = ACCIDENTAL_DEATH_TEXT_KEY
			}
		end
	end

	self.view.listTaskUList:SetList(taskList)

	if not self.isPvp then
		self:refreshEggRewards()
	end

	self:refreshChest()
	self:refreshRecycleTip()
	self:refreshNoviceProtectionView()
end

function GrabEggSettlementCtrl:refreshHarvest()
	self.view.harvestUWidget:SetActive(self.isPvp)
	self.view.panelGetUWidget:SetActive(not self.isPvp)

	if not self.isPvp then
		self.view.rootUComponent:TryChangePage("Mode", MODE_PVE)
		self.view.bigEggUList:SetList({})
		self.view.noBigEggUList:SetList({})

		return
	end

	local hasBigEgg = self.model:hasSettlementBigEgg(self.resInfo)

	self.view.rootUComponent:TryChangePage("Mode", hasBigEgg and MODE_PVP_BIG_EGG or MODE_PVP_NO_BIG_EGG)
	self.view.bigEggUList:SetList(hasBigEgg and self.pvpChestList or {})
	self.view.noBigEggUList:SetList(not hasBigEgg and self.pvpChestList or {})
end

function GrabEggSettlementCtrl:refreshEggRewards()
	local singleEggs, sharedEggs = self.model:getSettlementEggLists(self.resInfo)
	local state = GET_EGG_STATE_EMPTY
	local fullEggs = {}

	if #singleEggs > 0 and #sharedEggs > 0 then
		state = GET_EGG_STATE_BOTH
	elseif #singleEggs > 0 then
		state = GET_EGG_STATE_SINGLE
		fullEggs = singleEggs
	elseif #sharedEggs > 0 then
		state = GET_EGG_STATE_SHARED
		fullEggs = sharedEggs
	end

	self.view.rootUComponent:TryChangePage("GetEgg", state)
	self.view.layoutBoxUWidget:SetActive(state == GET_EGG_STATE_BOTH)
	self.view.FullEggUList:SetList(fullEggs)
	self.view.listSingleUList:SetList(state == GET_EGG_STATE_BOTH and singleEggs or {})
	self.view.listSharedUList:SetList(state == GET_EGG_STATE_BOTH and sharedEggs or {})
end

function GrabEggSettlementCtrl:refreshRecycleTip()
	local isRobEggPvp = tonumber(self.resInfo.sceneId) == Const.ROB_EGG_SCENE_ID
	local tipInfoGameObject = self.view.tipInfo.gameObject or self.view.tipInfo

	tipInfoGameObject:SetActiveEx(isRobEggPvp)

	local difficultyPanelGameObject = self.view.difficultyPanel.gameObject or self.view.difficultyPanel

	difficultyPanelGameObject:SetActiveEx(true)

	if isRobEggPvp then
		ClientTextUtils.setText(self.view.tipInfoTxt, pg.getGameString(ROB_EGG_RECYCLE_TIP_KEY))
	end
end

function GrabEggSettlementCtrl:refreshChest()
	self:killChestTimer()

	local isSuccess = self.resInfo.result == Const.ROB_EGG_RESULT.Success

	self.view.treasureChestUWidget:SetActive(isSuccess)

	if not isSuccess then
		return
	end

	local chestInfo = self.model:getSettlementChestInfo(self.resInfo.levelRewardBoxId, self.resInfo.levelInfo)
	local rewardState

	if chestInfo.isGranted then
		rewardState = REWARD_STATE_GET
	elseif chestInfo.isDailyFull then
		rewardState = REWARD_STATE_MAX
	else
		rewardState = REWARD_STATE_FULL
	end

	self.view.rootUComponent:TryChangePage("Reward", rewardState)

	local countText = pg.getFormatText("<b><style=Hint_BgL>{0}</style>/{1}</b>", chestInfo.acquired, chestInfo.limit)

	ClientTextUtils.setText(self.view.textGetBoxNumUSDFText, string.format(pg.getGameString("GRABEGG_LUCKYCHEST_OBTAI"), countText))

	if not chestInfo.isGranted then
		local fullText

		if chestInfo.isDailyFull then
			fullText = pg.getLocalizationText(SysNoticeData[NoticeDef.ROB_EGG_CHEST_MAX_DAILY_TIP].text)
		else
			fullText = pg.getGameString("BOX_STORAGE_FULL_TEXT")
		end

		ClientTextUtils.setText(self.view.textFullGetUSDFText, fullText)

		return
	end

	self.view.rewardBoxIconUImage.url = chestInfo.icon

	self.view.rootUComponent:TryChangePage("Color", chestInfo.quality - 1)
	self:startChestCountdown(chestInfo.openTimestamp)
end

function GrabEggSettlementCtrl:startChestCountdown(openTimestamp)
	local function refreshCountdown()
		local remainSec = math.max(0, (openTimestamp or 0) - Time.secondCache)

		ClientTextUtils.setText(self.view.textTimeSubUSDFText, LuaUIUtils.getCountDownString(remainSec, UIConst.TimeType.Short, true))

		if remainSec <= 0 then
			self:killChestTimer()
		end

		return remainSec
	end

	if refreshCountdown() > 0 then
		self.chestTimer = self:startTimer(refreshCountdown, 1, true)
	end
end

function GrabEggSettlementCtrl:killChestTimer()
	if self.chestTimer then
		self:killTimer(self.chestTimer)

		self.chestTimer = nil
	end
end

function GrabEggSettlementCtrl:onRenderTaskItem(button, index, data)
	if data.tIndex == DEATH_INFO_TEMPLATE_INDEX then
		local objectReference = button:GetComponent("ObjectReference")
		local textUSDFText = objectReference:GetRefValue("textUSDFText")
		local formatText = pg.getGameString(data.textKey)
		local desc = data.killedName and pg.getFormatText(formatText, data.killedName) or formatText

		ClientTextUtils.setText(textUSDFText, desc)

		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local txtDescUBaseText = objectReference:GetRefValue("txtDescUBaseText")
	local formatText = pg.getGameString(data.name)
	local desc = data.num and string.format(formatText, data.num) or formatText

	ClientTextUtils.setText(txtDescUBaseText, desc)
end

function GrabEggSettlementCtrl:onClickShare()
	return
end

function GrabEggSettlementCtrl:onClickOrganize()
	pg.me:finishedSettlement()
end

return GrabEggSettlementCtrl
