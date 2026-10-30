-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TeamRoomDungeonSelect\\TeamRoomDungeonSelectCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local TimerManager = require("Core.Timer.TimerManager")
local MessageName = require("Const.MessageName")
local Utils = require("Common.Utils.Utils")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local logger = require("Core.Log.LoggerManager").getLogger("TeamRoomDungeonSelectCtrl")
local TeamRoomDungeonSelectCtrl = Class.LightClass("TeamRoomDungeonSelectCtrl", UICtrl)

TeamRoomDungeonSelectCtrl.messages = {
	[MessageName.SYNC_TEAM_INFO] = {
		"onTeamInfoChanged",
		true
	},
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"refreshDungeonList",
		true
	}
}

function TeamRoomDungeonSelectCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	local teamInfo = pg.me:getCurTeamInfo()

	self.teamDungeonSceneId = teamInfo.dungeonSceneId or 0
	self.teamHardLv = teamInfo.hardLv or 0
	self.selectedDungeonId = info and info.dungeonId or teamInfo.dungeonSceneId
	self.selectedDungeonLevel = 0
	self.selectedCategoryId = self.model:getCategoryIdByDungeon(self.selectedDungeonId, self.selectedDungeonLevel)

	self:refreshDungeonList()
	ClientTextUtils.setText(self.view.textTitleUSDFText, pg.getGameString("TEAM_SELECT_DUNGEON_TARGET"))
end

function TeamRoomDungeonSelectCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:close()
	end

	function self.view.bgCloseUButton.luaClick()
		self:close()
	end

	function self.view.listUList.luaRenderItem(button, index, data)
		self:renderDungeonItem(button, index, data)
	end

	function self.view.btnConfirmUButton.luaClick()
		self:onClickConfirm()
	end
end

function TeamRoomDungeonSelectCtrl:refreshDungeonList()
	self.dungeonList = self.model:getDungeonList()

	local hasSelectedCategory = false

	for _, data in ipairs(self.dungeonList) do
		data.selected = data.categoryId == self.selectedCategoryId
		hasSelectedCategory = hasSelectedCategory or data.selected
	end

	if self.selectedCategoryId ~= 0 and not hasSelectedCategory then
		self.selectedCategoryId = 0
		self.selectedDungeonId = 0
		self.selectedDungeonLevel = 0
	end

	self.view.listUList:SetList(self.dungeonList)
	self:refreshSelectState()
end

function TeamRoomDungeonSelectCtrl:refreshSelectState()
	local selectState, tips = self.model:getSelectState(self.selectedDungeonId, self.selectedDungeonLevel, self.selectedCategoryId)
	local canConfirm = self.model:isCanConfirmState(selectState)

	self.view.rootUComponent:TryChangePage("SelectState", selectState)
	ClientTextUtils.setText(self.view.txtTipsUSDFText, tips)

	local isCurrentTarget = self.selectedDungeonId == self.teamDungeonSceneId and self.selectedDungeonLevel == self.teamHardLv and (self.teamDungeonSceneId > 0 or self.selectedCategoryId == self.model.NO_TARGET_CATEGORY_ID)
	local confirmTextKey = isCurrentTarget and "TEAM_CURRENT_DUNGEON_TARGET" or "TEAM_CONFIRM_DUNGEON_TARGET"

	ClientTextUtils.setText(self.view.txtConfirmUSDFText, pg.getGameString(confirmTextKey))

	self.view.btnConfirmUButton.interactable = canConfirm and not isCurrentTarget
	self.view.btnConfirmUButton.visualInteractable = canConfirm and not isCurrentTarget
end

function TeamRoomDungeonSelectCtrl:renderDungeonItem(button, index, data)
	button:TryChangePage("Type", data.isNoTarget and 1 or 0)

	if data.isNoTarget then
		self:renderNoTargetItem(button, data)

		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local tabUButton = objectReference:GetRefValue("tabUButton")
	local textUSDFText = objectReference:GetRefValue("textUSDFText")
	local levelList = objectReference:GetRefValue("levelList")
	local picUImage = objectReference:GetRefValue("picUImage")
	local targetIconUImage = objectReference:GetRefValue("targetIconUImage")
	local teamPlayName

	for _, levelData in ipairs(data.levelList) do
		teamPlayName = levelData.teamPlayConfig.name

		if teamPlayName then
			break
		end
	end

	ClientTextUtils.setText(textUSDFText, pg.getLocalizationText(teamPlayName))

	local isTeamTarget = false

	for _, levelData in ipairs(data.levelList) do
		if self:isTeamTarget(levelData) then
			isTeamTarget = true

			break
		end
	end

	targetIconUImage:SetActive(isTeamTarget)

	local picUrl = data.pic_small

	picUImage:SetActive(not string.isNilOrEmpty(picUrl))

	if picUrl then
		picUImage.url = picUrl
	end

	local selected = data.categoryId == self.selectedCategoryId

	button:SetSelected(selected)
	tabUButton:SetSelected(selected)

	function tabUButton.luaClick()
		local cancelSelected = data.categoryId == self.selectedCategoryId

		self:onDungeonSelected(data)

		if cancelSelected then
			tabUButton:SetSelected(false)
			TimerManager.addNextFrameCb(function()
				if tabUButton and not IsNil(tabUButton) then
					tabUButton:SetSelected(false)
				end
			end)
		end
	end

	function levelList.luaRenderItem(button1, index1, data1)
		self:renderLevelItem(button1, index1, data1)
	end

	for _, levelData in ipairs(data.levelList) do
		levelData.selected = levelData.dungeonId == self.selectedDungeonId and levelData.difficultyID == self.selectedDungeonLevel
	end

	levelList:SetList(data.levelList)

	if not selected then
		levelList:DeselectAll(false)
	end

	function levelList.luaSelectedChanged(uList)
		if uList.selectedItem then
			self:setLevelSelected(uList.selectedItem)
			self:refreshSelectState()
		end
	end
end

function TeamRoomDungeonSelectCtrl:renderNoTargetItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local textUSDFText = objectReference:GetRefValue("textUSDFText")
	local targetIconUImage = objectReference:GetRefValue("targetIconUImage")
	local picUImage = objectReference:GetRefValue("picUImage")

	ClientTextUtils.setText(textUSDFText, pg.getGameString("TEAM_CLEAR_TARGET"))
	targetIconUImage:SetActive(self:isTeamTarget(data))

	picUImage.url = ""

	picUImage:SetActive(false)
	button:SetSelected(data.categoryId == self.selectedCategoryId)

	function button.luaClick()
		self:setLevelSelected(data)
		self:refreshDungeonList()
	end
end

function TeamRoomDungeonSelectCtrl:renderLevelItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local textNumUSDFText = objectReference:GetRefValue("textNumUSDFText")
	local textUSDFText = objectReference:GetRefValue("textUSDFText")
	local textLockUSDFText = objectReference:GetRefValue("textLockUSDFText")
	local textNumLockUSDFText = objectReference:GetRefValue("textNumLockUSDFText")
	local targetIconUImage = objectReference:GetRefValue("targetIconUImage")

	button:TryChangePage("State", self:getLevelItemState(data))
	button:SetSelected(data.dungeonId == self.selectedDungeonId and data.difficultyID == self.selectedDungeonLevel)
	targetIconUImage:SetActive(self:isTeamTarget(data))
	ClientTextUtils.setText(textNumUSDFText, self:getPeopleNumText(data.dungeonConfig))
	ClientTextUtils.setText(textNumLockUSDFText, self:getPeopleNumText(data.dungeonConfig))
	ClientTextUtils.setText(textUSDFText, self:getLevelNameText(data))
	ClientTextUtils.setText(textLockUSDFText, self:getLevelNameText(data))
end

function TeamRoomDungeonSelectCtrl:isTeamTarget(data)
	return data.dungeonId == self.teamDungeonSceneId and data.difficultyID == self.teamHardLv
end

function TeamRoomDungeonSelectCtrl:onTeamInfoChanged()
	local teamInfo = pg.me:getCurTeamInfo()
	local dungeonSceneId = teamInfo.dungeonSceneId or 0
	local hardLv = teamInfo.hardLv or 0

	if self.teamDungeonSceneId == dungeonSceneId and self.teamHardLv == hardLv then
		return
	end

	self.teamDungeonSceneId = dungeonSceneId
	self.teamHardLv = hardLv

	self:refreshDungeonList()
end

function TeamRoomDungeonSelectCtrl:getLevelItemState(data)
	local selectState = self.model:getSelectState(data.dungeonId, data.difficultyID, data.categoryId)

	return self.model:isCanConfirmState(selectState) and 0 or 1
end

function TeamRoomDungeonSelectCtrl:getLevelNameText(data)
	local subName = data.teamPlayConfig and data.teamPlayConfig.subName

	if subName then
		return pg.getLocalizationText(subName)
	end

	local dungeonName = pg.getLocalizationText(data.dungeonConfig.name)

	if Utils.isWorldRacingDungeonScene(data.dungeonId) then
		local trackConfig = data.difficultyID and data.difficultyID > 0 and WorldRacingTrackData[data.difficultyID]

		if trackConfig and trackConfig.name then
			return pg.getLocalizationText(trackConfig.name)
		end

		logger:error("getLevelNameText: racing track config not found, dungeonId=%s, trackId=%s", tostring(data.dungeonId), tostring(data.difficultyID))

		return dungeonName
	end

	if data.difficultyID and data.difficultyID > 0 then
		return ClientTextUtils.concatByLanguage(dungeonName, pg.getGameString("DUNGEON_DIFFICUITY_" .. data.difficultyID))
	end

	return dungeonName
end

function TeamRoomDungeonSelectCtrl:getPeopleNumText(dungeonConfig)
	local playerNumMin = dungeonConfig and dungeonConfig.playerNumMin or 1
	local playerNumMax = dungeonConfig and dungeonConfig.playerNumMax or playerNumMin

	return playerNumMax == 1 and 1 or playerNumMin .. "~" .. playerNumMax
end

function TeamRoomDungeonSelectCtrl:onDungeonSelected(data)
	if data.categoryId == self.selectedCategoryId then
		self.selectedCategoryId = 0
		self.selectedDungeonId = 0
		self.selectedDungeonLevel = 0
	else
		self:setDungeonSelected(data)
	end

	self:refreshDungeonList()
end

function TeamRoomDungeonSelectCtrl:onLevelSelected(data)
	self:setLevelSelected(data)
	self:refreshSelectState()
end

function TeamRoomDungeonSelectCtrl:setDungeonSelected(data)
	self.selectedCategoryId = data.categoryId
	self.selectedDungeonId = 0
	self.selectedDungeonLevel = 0
end

function TeamRoomDungeonSelectCtrl:setLevelSelected(data)
	self.selectedCategoryId = data.categoryId
	self.selectedDungeonId = data.dungeonId
	self.selectedDungeonLevel = data.difficultyID
end

function TeamRoomDungeonSelectCtrl:onClickConfirm()
	pg.me:applyTeamDungeon(self.selectedDungeonId, self.selectedDungeonLevel, true)
	self:close()
end

return TeamRoomDungeonSelectCtrl
