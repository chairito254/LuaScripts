-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\QuestNpcEventChain\\QuestNpcEventChainCtrl.lua

local UICtrl = require("Guis.UICtrl")
local Class = require("Core.Framework.Class")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local DialogueUtils = require("Utils.DialogueUtils")
local NpcDialogueData = require("Data.npc_dialogue_data")
local NpcObserveData = require("Data.quest_npc_observe_data")
local NpcChainData = require("Data.quest_npc_chain_data")
local QuestNpcEventChainCtrl = Class.LightClass("QuestNpcEventChainCtrl", UICtrl)
local _persistRevealMap = {}
local timerDic = {}
local MAX_CHAIN_NUM = 4
local NEXT_CHAIN_TIME = 2
local clueDefaultPositionDic = {
	{
		-1180,
		517,
		0
	},
	{
		1386,
		529,
		0
	},
	{
		-809,
		-188,
		0
	},
	{
		1107,
		-216,
		0
	}
}

function QuestNpcEventChainCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	if info ~= nil then
		self.npcObserveId = info.npcObserveId or 1
		self.clueCall = info.clueCall
		self.dialogueGraph = info.dialogueGraph or false
		self.errorCall = info.errorCall
		self.cluePositions = info.cluePositions
	else
		self.npcObserveId = 1
		self.dialogueGraph = false
		self.errorCall = nil
		self.cluePositions = nil
	end

	if self.dialogueGraph then
		local cached = _persistRevealMap[self.npcObserveId]

		if cached then
			self.revealChainIds = cached
		else
			self.revealChainIds = {}
		end
	else
		_persistRevealMap = {}
		self.revealChainIds = {}
	end

	self:init()
end

function QuestNpcEventChainCtrl:init()
	self.clueBubbles = {}

	table.insert(self.clueBubbles, self.view.clueBubble1UButton)
	table.insert(self.clueBubbles, self.view.clueBubble2UButton)
	table.insert(self.clueBubbles, self.view.clueBubble3UButton)
	table.insert(self.clueBubbles, self.view.clueBubble4UButton)

	self.isHide = false
	self.canClick = false
	self.currentChainIds = {}
end

function QuestNpcEventChainCtrl:getTweenId()
	if self.__tween_id == nil then
		self.__tween_id = LuaUIUtils.TweenId("QuestNpcEventChainClueBorn")
	end

	return self.__tween_id
end

function QuestNpcEventChainCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:clickBack()

		return false
	end

	function self.view.dialogueBtn.luaClick()
		if not self.canClick then
			return
		end

		if self.dialogueId and self.dialogueId > 0 and self.index and self.index > 0 then
			self:showDialogueInfo(self.dialogueId, self.index + 1)
		end
	end
end

function QuestNpcEventChainCtrl:onShow()
	return
end

function QuestNpcEventChainCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:showPanel()
end

function QuestNpcEventChainCtrl:showPanel()
	ClientTextUtils.setText(self.view.mainTitleText, pg.getGameString("CLUE_OBSERVE"))
	self:setChainInfo()
end

function QuestNpcEventChainCtrl:PlayVoice()
	local audioName = DialogueUtils.getAudioName(self.dialogueId, self.index or 1)

	if audioName then
		pg.game.audio:playEvent(audioName)
	end

	local duration = DialogueUtils.getAudioDuration(self.dialogueId, self.index or 1) or 0
	local isMultiDialogue = DialogueUtils.isMultiDialogue(self.dialogueId)

	if duration and duration == -1 then
		self.playingVoice = false

		if isMultiDialogue then
			self:SwitchNextAndWaiting(1)
		else
			self:SwitchNextAndWaiting(2)
		end
	elseif duration < 0.01 then
		self.playingVoice = false

		self:SwitchNextAndWaiting(0)
	else
		self.playingVoice = true
		self.curDialogVoice = audioName

		self:SwitchNextAndWaiting(2)

		timerDic.next = self:startScaleTimer(function()
			self.playingVoice = false
			self.curDialogVoice = nil
			timerDic.next = nil

			local state = isMultiDialogue and 1 or 2

			self:SwitchNextAndWaiting(state)
		end, duration, false)
	end
end

function QuestNpcEventChainCtrl:setChainInfo(isHide)
	local chainData = NpcObserveData[self.npcObserveId]

	if not chainData then
		return
	end

	local includeClues = chainData.includeClues
	local showNum = 0

	self.rightClueDic = {}

	local rightClueElua = chainData.rightClueElua

	if type(rightClueElua) == "table" then
		for _, rightId in pairs(rightClueElua) do
			self.rightClueDic[rightId] = 1
		end
	elseif type(chainData.rightClue) == "number" then
		self.rightClueDic[chainData.rightClue] = 1
	end

	if self.savedCurrentChainIds and self.clickedBtnIndex then
		for i, chainId in ipairs(self.savedCurrentChainIds) do
			if i ~= self.clickedBtnIndex and chainId and not table.contains(self.revealChainIds, chainId) then
				self.clueBubbles[i]:SetActive(true)
				self:setChainItemInfo(self.clueBubbles[i], chainId)

				self.currentChainIds[i] = chainId
				showNum = showNum + 1
			end
		end

		local hasReplenished = false

		for i, v in pairs(includeClues) do
			local canShow = self:checkChainPrecondition(v)

			if canShow and not table.contains(self.revealChainIds, v) then
				local isAlreadyDisplaying = false

				for _, existingChainId in pairs(self.currentChainIds) do
					if existingChainId == v then
						isAlreadyDisplaying = true

						break
					end
				end

				if not isAlreadyDisplaying then
					self:setChainItemInfo(self.clueBubbles[self.clickedBtnIndex], v)
					self.clueBubbles[self.clickedBtnIndex]:SetActive(true)

					self.currentChainIds[self.clickedBtnIndex] = v
					hasReplenished = true
					showNum = showNum + 1

					break
				end
			end
		end

		if showNum < 1 then
			self:clickBack()

			return
		end

		self.savedCurrentChainIds = nil
		self.clickedBtnIndex = nil

		ClientTextUtils.setText(self.view.textTipsUSDFText, pg.getGameString("CHECK_CLUE"))

		local curNum, totalNum = self:getTopProgress()

		self.view.textInfoUSDFText:SetActive(totalNum > 0)

		local chainNum = string.format("<sprite name=UI_SceneState_Clue_Icon> %s/%s", curNum, totalNum)

		ClientTextUtils.setText(self.view.textInfoUSDFText, string.format(pg.getGameString("FIND_MORE_CLUES_IN_SIGHT"), chainNum))

		return
	end

	local index = 1

	for i, v in pairs(includeClues) do
		if self:isChainCanShow(v) and not table.contains(self.revealChainIds, v) and index <= #self.clueBubbles and self.clueBubbles[index] and not isHide then
			self.clueBubbles[index]:SetActive(true)
			self:setChainItemInfo(self.clueBubbles[index], v)

			self.currentChainIds[index] = v
			index = index + 1
		end
	end

	ClientTextUtils.setText(self.view.textTipsUSDFText, pg.getGameString("CHECK_CLUE"))

	local curNum, totalNum = self:getTopProgress()

	self.view.textInfoUSDFText:SetActive(totalNum > 0)

	local chainNum = string.format("<sprite name=UI_SceneState_Clue_Icon> %s/%s", curNum, totalNum)

	ClientTextUtils.setText(self.view.textInfoUSDFText, string.format(pg.getGameString("FIND_MORE_CLUES_IN_SIGHT"), chainNum))

	if index == 1 then
		pg.global.ui.tips:showTextTip(pg.getGameString("FIND_MORE_CLUES"))
		self:clickBack()

		return
	elseif index <= MAX_CHAIN_NUM then
		local minIndex = index

		if isHide then
			minIndex = 1
		end

		for j = MAX_CHAIN_NUM, minIndex, -1 do
			if self.clueBubbles[j] then
				self.clueBubbles[j]:SetActive(false)

				self.currentChainIds[j] = nil
			end
		end
	end

	if not isHide then
		self.canClick = false
		self.dialogueId = chainData.dialogue

		self:showDialogueInfo(self.dialogueId, 1)
	end
end

function QuestNpcEventChainCtrl:setChainItemInfo(btn, chainId)
	local coms = self.view:getTabItemComs(btn)

	if not coms then
		return
	end

	local chainData = NpcObserveData[self.npcObserveId]

	if not chainData then
		return
	end

	local chainItemData = NpcChainData[chainId]

	if not chainItemData then
		return
	end

	coms.button:TryChangePage("Title", chainItemData.clueType and chainItemData.clueType > 0 and 1 or 0)
	coms.button:TryChangePage("Correct", self.rightClueDic[chainId] ~= nil and 1 or 0)

	if self.rightClueDic[chainId] ~= nil then
		pg.game.audio:triggerEvent("SFX_UI_Bubble_Correct_Popup")
	else
		pg.game.audio:triggerEvent("SFX_UI_Bubble_Popup")
	end

	ClientTextUtils.setText(coms.title, pg.getGameString("CLUES"))
	ClientTextUtils.setText(coms.chainText, pg.getLocalizationText(chainItemData.clueName))
	self:setCluePosition(btn, chainId)

	function btn.luaClick()
		self:clickClue(chainId)
	end
end

function QuestNpcEventChainCtrl:setCluePosition(btn, chainId)
	local chainData = NpcObserveData[self.npcObserveId]

	if not chainData then
		return
	end

	local index = 0

	for i, clueId in ipairs(chainData.includeClues) do
		if clueId == chainId then
			index = i

			break
		end
	end

	if index < 1 then
		return
	end

	local pos

	if not self.cluePositions then
		pos = clueDefaultPositionDic[index]
	else
		pos = self.cluePositions[index]
	end

	if not pos then
		return
	end

	local posX = pos[1] or pos.x or 0
	local posY = pos[2] or pos.y or 0
	local posZ = pos[3] or pos.z or 0

	self:playClueBornTween(btn, Vector3.New(posX, posY, posZ))
end

function QuestNpcEventChainCtrl:playClueBornTween(btn, endPos)
	if not btn then
		return
	end

	local tweenTarget = btn.gameObject
	local startPos = endPos * 0.12
	local midPos = endPos * 0.3

	DoTweenAnimMgr.Kill(tweenTarget, self:getTweenId(), false)

	local function applyPos(x, y, z)
		btn.transform.localPosition = Vector3.New(x, y, z)
	end

	btn.transform.localPosition = startPos

	DoTweenAnimMgr.DoVector3(tweenTarget, self:getTweenId(), startPos, midPos, 0.15, 0, CS.DG.Tweening.Ease.__CastFrom(1), function()
		applyPos(startPos[1], startPos[2], startPos[3])
	end, function(x, y, z)
		applyPos(x, y, z)
	end, function()
		DoTweenAnimMgr.DoVector3(tweenTarget, self:getTweenId(), midPos, endPos, 0.37, 0, CS.DG.Tweening.Ease.__CastFrom(1), function()
			applyPos(midPos[1], midPos[2], midPos[3])
		end, function(x, y, z)
			applyPos(x, y, z)
		end)
	end)
end

function QuestNpcEventChainCtrl:clickClue(chainId)
	local chainIndex = 0
	local chainData = NpcObserveData[self.npcObserveId]

	for i, clueId in ipairs(chainData.includeClues) do
		if clueId == chainId then
			chainIndex = i

			break
		end
	end

	if chainIndex < 0.01 then
		return
	end

	local chainBtnIndex = 0

	for i, clueId in ipairs(self.currentChainIds) do
		if clueId == chainId then
			chainBtnIndex = i

			break
		end
	end

	local clueCall = self.clueCall
	local chainItemData = NpcChainData[chainId]
	local btn = self.clueBubbles[chainBtnIndex]

	self.canClick = true
	self.curSelectedChainId = chainId
	self.dialogueId = chainItemData.clueFeedback

	if not table.contains(self.revealChainIds, chainId) then
		self.revealChainIds[#self.revealChainIds + 1] = chainId
		_persistRevealMap[self.npcObserveId] = self.revealChainIds
	end

	pg.game.audio:triggerEvent("SFX_UI_Bubble_Popup_Click")
	btn:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)

	if self.rightClueDic[chainId] ~= nil then
		pg.me:setClientCustomVariable(chainData.refVar, 1)

		_persistRevealMap[self.npcObserveId] = nil

		self:removeNextTimer()
		self:dismiss()

		if clueCall ~= nil then
			clueCall(chainIndex)
		end

		return
	end

	local clickedIndex = self:getClickedBtnIndex(btn)

	self.clickedBtnIndex = clickedIndex
	self.savedCurrentChainIds = {}

	for i, id in ipairs(self.currentChainIds) do
		self.savedCurrentChainIds[i] = id
	end

	if self.dialogueGraph then
		self:dismiss()

		if clueCall ~= nil then
			clueCall(chainIndex)
		end
	else
		self.isHide = true

		self:hideAllChainBubbles()

		self.switchDialogueBtn = btn

		if self.dialogueId and self.dialogueId > 0 then
			self:showDialogueInfo(self.dialogueId, 1)
		else
			self.isHide = false

			self:setChainInfo()
		end
	end
end

function QuestNpcEventChainCtrl:getClickedBtnIndex(btn)
	for i, bubble in ipairs(self.clueBubbles) do
		if bubble == btn then
			return i
		end
	end

	return -1
end

function QuestNpcEventChainCtrl:isChainCanShow(chainId)
	local isPreLock = true
	local npcChainData = NpcChainData[chainId]

	if not npcChainData then
		return false
	end

	if table.contains(self.revealChainIds, chainId) then
		return false
	end

	local cluePreconditions = npcChainData.cluePrecondition
	local cluePreIDs = npcChainData.cluePreID

	if not cluePreconditions and not cluePreIDs then
		return true
	end

	if cluePreconditions then
		for i, v in pairs(cluePreconditions) do
			if not pg.me.triggerMap:isCompleteOrMeetCondition(v) then
				isPreLock = false

				return isPreLock
			end
		end
	end

	if isPreLock and cluePreIDs then
		for i, v in pairs(cluePreIDs) do
			if not table.contains(self.revealChainIds, v) then
				isPreLock = false

				return isPreLock
			end
		end
	end

	return isPreLock
end

function QuestNpcEventChainCtrl:checkChainPrecondition(chainId)
	local npcChainData = NpcChainData[chainId]

	if not npcChainData then
		return false
	end

	local cluePreconditions = npcChainData.cluePrecondition
	local cluePreIDs = npcChainData.cluePreID

	if not cluePreconditions and not cluePreIDs then
		return true
	end

	if cluePreconditions then
		for i, v in pairs(cluePreconditions) do
			if not pg.me.triggerMap:isCompleteOrMeetCondition(v) then
				return false
			end
		end
	end

	if cluePreIDs then
		for i, v in pairs(cluePreIDs) do
			if not table.contains(self.revealChainIds, v) then
				return false
			end
		end
	end

	return true
end

function QuestNpcEventChainCtrl:getTopProgress()
	local curNum, totalNum = 0, 0
	local chainData = NpcObserveData[self.npcObserveId]

	if not chainData then
		return curNum, totalNum
	end

	local includeClues = chainData.includeClues

	for i, clueId in pairs(includeClues) do
		local npcChainData = NpcChainData[clueId]

		if npcChainData and npcChainData.clueType and npcChainData.clueType > 0 then
			totalNum = totalNum + 1

			local isComplete = true
			local cluePreconditions = npcChainData.cluePrecondition

			if cluePreconditions and #cluePreconditions > 0 then
				for j, preconditionId in pairs(cluePreconditions) do
					if not pg.me.triggerMap:isCompleteOrMeetCondition(preconditionId) then
						isComplete = false

						break
					end
				end
			end

			if isComplete then
				curNum = curNum + 1
			end
		end
	end

	return curNum, totalNum
end

function QuestNpcEventChainCtrl:switchDialogue(flag)
	self.view.dialogueSimpleUWidget:SetActive(flag)
end

function QuestNpcEventChainCtrl:showDialogueInfo(dialogueId, index)
	self.index = index or 1

	if dialogueId == nil then
		pg.game.communication:finishNpcDialog()

		self.isHide = false
		self.canClick = false

		self:setChainInfo()

		return
	end

	if NpcDialogueData[dialogueId] == nil or NpcDialogueData[dialogueId][index] == nil then
		pg.game.communication:finishNpcDialog()

		self.isHide = false
		self.canClick = false

		self:setChainInfo()

		return
	end

	local dialogueData = NpcDialogueData[dialogueId]

	if dialogueData then
		local dialogue = dialogueData[index]

		if dialogue then
			if dialogue.npcName then
				ClientTextUtils.setText(self.view.dialogueTitleText, pg.getLocalizationText(dialogue.npcName))
			else
				ClientTextUtils.setText(self.view.dialogueTitleText, "")
			end

			if dialogue.chat then
				ClientTextUtils.setText(self.view.dialogueText, LuaUIUtils.getReplacedDialogueText(dialogue.chat))
			else
				ClientTextUtils.setText(self.view.dialogueText, "")
			end
		end
	end

	pg.game.communication:stopDialogVoice()
	self:PlayVoice()
end

function QuestNpcEventChainCtrl:removeNextTimer()
	if self.moveNextTimer then
		self:killTimer(self.moveNextTimer)

		self.moveNextTimer = nil
	end
end

function QuestNpcEventChainCtrl:hideAllChainBubbles()
	for i, bubble in ipairs(self.clueBubbles) do
		if bubble then
			bubble:SetActive(false)
		end
	end
end

function QuestNpcEventChainCtrl:onClose()
	for i, bubble in ipairs(self.clueBubbles) do
		if bubble and bubble.gameObject then
			DoTweenAnimMgr.Kill(bubble.gameObject, self:getTweenId(), false)
		end
	end

	self:ClearTimerDic()

	self.savedCurrentChainIds = nil
	self.clickedBtnIndex = nil
	self.isHide = false
	self.canClick = false
end

function QuestNpcEventChainCtrl:onDestroy()
	self:onClose()
	UICtrl.onDestroy(self)
	self.view.rootUComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)

	if self.curDialogVoice then
		pg.game.audio:stopEvent(self.curDialogVoice, nil, 0.2)

		self.curDialogVoice = nil
	end
end

function QuestNpcEventChainCtrl:closePanel()
	_persistRevealMap = {}
end

function QuestNpcEventChainCtrl:clickBack()
	local errorCall = self.errorCall

	self:dismiss()

	if errorCall then
		errorCall()
	end
end

function QuestNpcEventChainCtrl:SwitchNextAndWaiting(state)
	local boolNext = false
	local boolWaiting = false

	if state == 0 then
		boolNext = false
		boolWaiting = false
	elseif state == 1 then
		boolNext = true
		boolWaiting = false
	elseif state == 2 then
		boolNext = false
		boolWaiting = true
	else
		boolNext = true
		boolWaiting = true
	end

	LuaUIUtils.setUIVisible(self.view.hintUWidget, boolNext)
	LuaUIUtils.setUIVisible(self.view.belogginginUWidget, boolWaiting)

	if boolWaiting then
		self.view.belogginginUWidget:InvokeCallback(CS.XGUI.EInvokeTime.Custom2)
	end
end

function QuestNpcEventChainCtrl:ClearTimerDic()
	for _, timer in pairs(timerDic) do
		self:killScaleTimer(timer)
	end

	timerDic = {}
end

return QuestNpcEventChainCtrl
