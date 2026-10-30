-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeStationManage\\Component\\HomeCurrentStationComponent.lua

local logger = require("Core.Log.LoggerManager").getLogger("HomeCurrentStationComponent")
local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local Utils = require("Common.Utils.Utils")
local HomeCampData = require("Data.home_camp_data")
local FriendshipLevelData = require("Data.friendship_level_data")
local AvatarPresetData = require("Data.avatar_preset_data")
local ClientConst = require("Const.ClientConst")
local MessageName = require("Const.MessageName")
local AddressDataConst = require("Const.AddressDataConst")
local HomeCampConst = require("Common.Const.HomeCampConst")
local ClientUtils = require("Utils.ClientUtils")
local lume = require("Core.Common.lume")
local HomeCurrentStationComponent = Class.LightClass("HomeCurrentStationComponent", UIComponent)

HomeCurrentStationComponent.PLAYER_NUM = 6
HomeCurrentStationComponent.messages = {
	[MessageName.HOME_CAR_CAMP_INFO_REFRESHED] = {
		"onCampInfoRefreshed",
		true
	}
}

function HomeCurrentStationComponent:onCtor(info)
	self.playerItemNum = HomeCurrentStationComponent.PLAYER_NUM
	self.focusedSlotIndex = nil
	self.slotInfos = {}
end

function HomeCurrentStationComponent:findObjects()
	return
end

function HomeCurrentStationComponent:initView()
	self.uWidget:LoadDefaultUrlManually(function()
		self:onContentLoaded()
		self:addListener()
		self:refreshPageInfo()
	end)
end

function HomeCurrentStationComponent:onContentLoaded()
	local content = self.uWidget.content
	local objectReference = content:GetComponent("ObjectReference")

	self.btnLeaveUButton = objectReference:GetRefValue("btnLeaveUButton")
	self.playerCardUContainer = objectReference:GetRefValue("playerCardUContainer")
	self.manageItem1 = objectReference:GetRefValue("manageItem1UButton")
	self.manageItem2 = objectReference:GetRefValue("manageItem2UButton")
	self.manageItem3 = objectReference:GetRefValue("manageItem3UButton")
	self.manageItem4 = objectReference:GetRefValue("manageItem4UButton")
	self.manageItem5 = objectReference:GetRefValue("manageItem5UButton")
	self.manageItem6 = objectReference:GetRefValue("manageItem6UButton")
	self.backgroundUImage = objectReference:GetRefValue("backgroundUImage")
	self.txtPositionUSDFText = objectReference:GetRefValue("txtPositionUSDFText")
	self.btnCopyUButton = objectReference:GetRefValue("btnCopyUButton")
	self.txtIDUSDFText = objectReference:GetRefValue("txtIDUSDFText")
	self.imgPeppleUImage = objectReference:GetRefValue("imgPeppleUImage")
	self.txtStationNumUSDFText = objectReference:GetRefValue("txtStationNumUSDFText")
	self.btnInviteUButton = objectReference:GetRefValue("btnInviteUButton")
	self.btnSettingUButton = objectReference:GetRefValue("btnSettingUButton")
	self.txtInviteUSDFText = objectReference:GetRefValue("txtInviteUSDFText")
	self.txtSettingUSDFText = objectReference:GetRefValue("txtSettingUSDFText")
	self.btnJoinUButton = objectReference:GetRefValue("btnJoinUButton")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.txtJoinUSDFText = objectReference:GetRefValue("txtJoinUSDFText")
	self.txtBackUSDFText = objectReference:GetRefValue("txtBackUSDFText")
end

function HomeCurrentStationComponent:addListener()
	ClientTextUtils.setText(self.txtInviteUSDFText, pg.getGameString("HOMECAR_FRIEND_INVITATION"))
	ClientTextUtils.setText(self.txtSettingUSDFText, pg.getGameString("HOMECAR_POST_STATION_SETUP"))
	ClientTextUtils.setText(self.txtJoinUSDFText, pg.getGameString("HOMECAR_JOIN_CURRENT_STATION"))
	ClientTextUtils.setText(self.txtBackUSDFText, pg.getGameString("HOMECAR_BACK_TO_MY_STATION"))

	function self.btnCopyUButton.luaClick()
		local campInfo = self:getCurrentCampInfo()
		local campLineInfo = campInfo and campInfo.lineInfo

		if not campLineInfo then
			return
		end

		local text = campLineInfo.displayCode

		UIUtils.ClipboardWriter(text)
		pg.global.ui.tips:showTextTip(pg.getGameString("HOMECAR_STATION_NUM_COPY"))
	end

	function self.btnInviteUButton.luaClick()
		pg.global.ui.homeCampInviteFriend:open()
	end

	function self.btnSettingUButton.luaClick()
		pg.global.ui.homeCampStationSetting:open()
	end

	function self.btnJoinUButton.luaClick()
		self:showJoinCampConfirm()
	end

	function self.btnBackUButton.luaClick()
		pg.me:enterSelfHomeCamp()
		self.ctrl:close()
	end
end

function HomeCurrentStationComponent:onCampInfoRefreshed()
	self:refreshPageInfo()
end

function HomeCurrentStationComponent:onDestroy()
	UIComponent.onDestroy(self)
end

function HomeCurrentStationComponent:getCurrentCampInfo()
	local player = pg.me
	local space = player and player.space

	if not space or not space.isHomeCamp or not space:isHomeCamp() then
		return nil
	end

	if space.isSelfHomeCamp and space:isSelfHomeCamp(player) then
		return player:getPlayerHomeCampInfo()
	end

	local sourceLineInfo = space.campLineInfo
	local carCreatedMap = space.campCarCreatedMap

	if not sourceLineInfo or sourceLineInfo.lineUid == 0 or not carCreatedMap then
		return nil
	end

	local lineInfo = {
		permissions = 0,
		lineUid = sourceLineInfo.lineUid,
		staticId = sourceLineInfo.staticId,
		displayCode = sourceLineInfo.displayCode,
		loginCount = sourceLineInfo.loginCount,
		isPrivate = sourceLineInfo.isPrivate,
		ownerUid = sourceLineInfo.ownerUid,
		loginUids = {}
	}
	local campInfo = {
		lineInfo = lineInfo,
		carList = {}
	}

	for rawUid, entId in pairs(carCreatedMap) do
		local carEnt = entId and pg.getEntity(entId)

		if carEnt and not carEnt.destroyed and carEnt.space == space then
			local carIndex = tonumber(carEnt.carIndex)
			local carId = carIndex and HomeLandUtils.getCampCarTmplId(lineInfo.staticId, carIndex)
			local uid = tostring(carEnt.ownerUid or rawUid or "")

			if carId and not string.isNilOrEmpty(uid) then
				lineInfo.loginUids[carIndex] = uid
				campInfo.carList[carId] = {
					playerUid = uid,
					homeBasicInfo = carEnt.basicInfo
				}
			end
		end
	end

	return campInfo
end

function HomeCurrentStationComponent:showJoinCampConfirm()
	local campInfo = self:getCurrentCampInfo()
	local campLineInfo = campInfo and campInfo.lineInfo

	if not campLineInfo then
		return
	end

	pg.global.showConfirmMsgRaw(pg.getGameString("RELEASE_WARN"), pg.getGameString("HOMECAR_JOIN_CURRENT_STATION_TIP"), function()
		pg.me:changeCamp(campLineInfo.staticId, campLineInfo.lineUid, function()
			self.ctrl:close()
		end)
	end)
end

local GENDER_MALE = 0
local GENDER_FEMALE = 1
local GENDER_UNKNOWN = 2

function HomeCurrentStationComponent:resolveGenderPage(avatarPresetKey)
	local preset = avatarPresetKey and pg.game.avatar:getAvatarPresetData(avatarPresetKey)
	local templateId = preset and preset.templateId or 0

	if templateId == 4 then
		return GENDER_MALE
	elseif templateId == 3 then
		return GENDER_FEMALE
	end

	return GENDER_UNKNOWN
end

function HomeCurrentStationComponent:renderCarList(staticId, campInfo)
	for i = 1, self.playerItemNum do
		local carId = HomeLandUtils.getCampCarTmplId(staticId, i)
		local playerData = carId and campInfo.carList and campInfo.carList[carId] or nil

		self:renderManageItem(i, playerData, campInfo)
	end
end

function HomeCurrentStationComponent:refreshPageInfo()
	if not self.uWidget:CheckURLLoaded() then
		return
	end

	self.btnLeaveUButton:SetActive(false)
	self.btnInviteUButton:SetActive(false)
	self.btnSettingUButton:SetActive(false)
	self.btnJoinUButton:SetActive(false)
	self.btnBackUButton:SetActive(false)

	self.slotInfos = {}

	for i = 1, self.playerItemNum do
		local item = self["manageItem" .. i]

		if item then
			item.isSelected = false
		end
	end

	local campInfo = self:getCurrentCampInfo()
	local campLineInfo = campInfo and campInfo.lineInfo
	local staticId = campLineInfo and campLineInfo.staticId or 0
	local maxCampNum = HomeLandUtils.getHomeCampMaxLoginCount(staticId)

	if not campInfo or not campInfo.lineInfo or staticId == 0 then
		ClientTextUtils.setText(self.txtPositionUSDFText, "")
		ClientTextUtils.setText(self.txtIDUSDFText, "")
		ClientTextUtils.setText(self.txtStationNumUSDFText, string.format("0/%d", maxCampNum))

		for i = 1, self.playerItemNum do
			self:renderManageItem(i, nil, campInfo)
		end

		return
	end

	local isPrivate = campLineInfo.isPrivate
	local isManager = campLineInfo.ownerUid == pg.me.uid
	local isSelfHomeCamp = self.ctrl:isInSelfHomeCamp()

	self.btnJoinUButton:SetActive(not isSelfHomeCamp)
	self.btnBackUButton:SetActive(not isSelfHomeCamp)

	local permissions = campLineInfo.permissions or 0
	local needInvite = bit.band(permissions, HomeCampConst.PERM_ALLOW_MEMBER_INVITE) ~= 0

	if isManager then
		needInvite = true
	end

	local campData = HomeCampData[staticId]

	if campData then
		ClientTextUtils.setText(self.txtPositionUSDFText, pg.getLocalizationText(campData.name))
	else
		ClientTextUtils.setText(self.txtPositionUSDFText, "")
	end

	ClientTextUtils.setText(self.txtIDUSDFText, campLineInfo.displayCode)

	if campData.background then
		self.backgroundUImage.url = campData.background
	end

	local stationTypeName = pg.getGameString("HOMECAR_PUBLIC_STATION")

	if isPrivate then
		stationTypeName = pg.getGameString("HOMECAR_PRIVATE_STATION")
		self.imgPeppleUImage.url = AddressDataConst.HOME_CAMP_PRIVATE_ICON
	else
		self.imgPeppleUImage.url = AddressDataConst.HOME_CAMP_PUBLIC_ICON
	end

	local playerCount = lume.count(campLineInfo.loginUids or {})

	ClientTextUtils.setText(self.txtStationNumUSDFText, stationTypeName .. string.format("(%d/%d)", playerCount, maxCampNum))

	if isSelfHomeCamp and (not isPrivate or needInvite) then
		self.btnInviteUButton:SetActive(true)
	end

	self.btnInviteUButton.interactable = playerCount < maxCampNum

	if isSelfHomeCamp and isPrivate and isManager then
		self.btnSettingUButton:SetActive(true)
	end

	self:renderCarList(staticId, campInfo)

	local rawUids = campLineInfo.loginUids or {}
	local uids = {}

	for k, v in pairs(rawUids) do
		table.insert(uids, tostring(v))
	end

	if #uids == 0 then
		return
	end

	pg.me:queryPlayerInfoList(uids, pg.game.chat.queryPlayerInfoType.ShowPlayerInfo, true, nil, function()
		if not self.view then
			return
		end

		self:renderCarList(staticId, campInfo)
	end)
end

function HomeCurrentStationComponent:renderManageItem(index, playerData, campInfo)
	local manageItem = self["manageItem" .. index]

	if not manageItem then
		return
	end

	local objectReference = manageItem:GetComponent("ObjectReference")
	local playerHeadUWidget = objectReference:GetRefValue("playerHeadUWidget")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local iconIntimacyUImage = objectReference:GetRefValue("iconIntimacyUImage")
	local txtDetailsUSDFText = objectReference:GetRefValue("txtDetailsUSDFText")
	local nmlUComponent = objectReference:GetRefValue("nmlUComponent")
	local textLvUSDFText = objectReference:GetRefValue("textLvUSDFText")
	local btnCardUButton = objectReference:GetRefValue("btnCardUButton")
	local btnLeaveUButton = objectReference:GetRefValue("btnLeaveUButton")
	local imgNumNormalUImage = objectReference:GetRefValue("imgNumNormalUImage")

	if not playerData or not playerData.playerUid then
		manageItem:TryChangePage("State", 0)

		self.slotInfos[index] = {
			isEmpty = true,
			index = index
		}

		if btnCardUButton then
			btnCardUButton.luaClick = nil
		end

		if btnLeaveUButton then
			btnLeaveUButton.luaClick = nil
		end

		manageItem.luaClick = nil

		if self.ctrl:isInSelfHomeCamp() then
			function manageItem.luaClick()
				local navManager = CS.XGUI.Navigation.NavManager.Instance
				local cur = navManager and navManager.CurrentFocusedUContent

				if not IsNil(cur) and cur.gameObject ~= manageItem.gameObject then
					return
				end

				self:syncNavFocusToSlot(manageItem)
				pg.global.showConfirmMsgRaw(pg.getGameString("RELEASE_WARN"), pg.getGameString("HOMECAR_CHANGE_CAR_INDEX"), function()
					pg.me:changeCarIndexMessage(index, function()
						self:selectItemByIndex()
					end)
				end)
			end
		elseif campInfo and campInfo.lineInfo then
			function manageItem.luaClick()
				local navManager = CS.XGUI.Navigation.NavManager.Instance
				local cur = navManager and navManager.CurrentFocusedUContent

				if not IsNil(cur) and cur.gameObject ~= manageItem.gameObject then
					return
				end

				self:syncNavFocusToSlot(manageItem)
				self:showJoinCampConfirm()
			end
		end

		self:bindSlotFocusListener(manageItem, index)

		return
	end

	local uid = playerData.playerUid
	local playerInfo = uid and pg.game.chat:getPlayerInfo(uid) or {}
	local campLineInfo = campInfo.lineInfo or {}
	local isManager = campLineInfo.ownerUid == uid
	local isSelf = uid == pg.me.uid

	manageItem:TryChangePage("State", 1)

	if nmlUComponent then
		nmlUComponent:TryChangePage("IsSelf", isSelf and 1 or 0)
		nmlUComponent:TryChangePage("IsOwner", isManager and 1 or 0)
		nmlUComponent:TryChangePage("Gender", self:resolveGenderPage(playerInfo.avatarPresetKey))
	end

	local numIconUrl = isSelf and "$UI_Img_PetManual_FeatureNum_Self_0%d.png" or "$UI_Img_PetManual_FeatureNum_0%d.png"

	imgNumNormalUImage.url = string.format(numIconUrl, index)

	if playerHeadUWidget then
		LuaUIUtils.renderPlayerAvatarImages(playerHeadUWidget, {
			avatarIconId = playerInfo.headIcon,
			avatarFrameIconId = playerInfo.headFrame
		})
	end

	local playerName = playerInfo.playerName or ""
	local _h = HomeCurrentStationComponent._platformHooks

	playerName = _h and _h.renderCurrentStationPlayerName and _h.renderCurrentStationPlayerName(self, index, playerData, playerInfo, playerName) or playerName

	ClientTextUtils.setText(textLvUSDFText, tostring(playerInfo.level or 0))
	ClientTextUtils.setText(txtNameUSDFText, playerName)

	local homeCarLevel = playerData.homeBasicInfo and playerData.homeBasicInfo.level or 0

	ClientTextUtils.setText(txtDetailsUSDFText, pg.getGameString("HOMECAR_RV_LEVEL") .. ":" .. ClientTextUtils.formatShortLevel(homeCarLevel))

	if iconIntimacyUImage then
		if isSelf then
			iconIntimacyUImage:SetActive(false)
		else
			local intimacy = pg.game.chat:getFriendIntimacy(uid)

			if intimacy and intimacy > 0 then
				local level = Utils.calFriendshipLevel(intimacy)
				local cfg = level and FriendshipLevelData[level]

				if cfg and cfg.levelIcon then
					iconIntimacyUImage.url = cfg.levelIcon

					iconIntimacyUImage:SetActive(true)
				else
					iconIntimacyUImage:SetActive(false)
				end
			else
				iconIntimacyUImage:SetActive(false)
			end
		end
	end

	btnLeaveUButton:SetActive(campLineInfo.ownerUid == pg.me.uid and not isSelf)

	self.slotInfos[index] = {
		isEmpty = false,
		index = index,
		uid = uid,
		isSelf = isSelf,
		isManager = isManager,
		leaveBtn = btnLeaveUButton,
		cardBtn = btnCardUButton,
		playerName = playerName
	}

	function manageItem.luaClick()
		if not playerData then
			return
		end

		local navManager = CS.XGUI.Navigation.NavManager.Instance
		local cur = navManager and navManager.CurrentFocusedUContent

		if not IsNil(cur) and cur.gameObject ~= manageItem.gameObject then
			return
		end

		self:syncNavFocusToSlot(manageItem)
		self:selectItemByIndex(index)

		if pg.game.input and pg.game.input.isUsingGamepad and pg.game.input:isUsingGamepad() then
			LuaUIUtils.openInfoPlayerCard({
				playerId = uid,
				openType = ClientConst.PlayerInfoOpenType.Chat,
				openSource = pg.game.chat.AddFriendSource.PlayerCard
			})
		end
	end

	self:bindSlotFocusListener(manageItem, index)

	function btnCardUButton.luaClick()
		if pg.game.input and pg.game.input.isUsingGamepad and pg.game.input:isUsingGamepad() then
			return
		end

		self:selectItemByIndex(index)
		LuaUIUtils.openInfoPlayerCard({
			playerId = uid,
			openType = ClientConst.PlayerInfoOpenType.Chat,
			openSource = pg.game.chat.AddFriendSource.PlayerCard
		})
	end

	function btnLeaveUButton.luaClick()
		pg.global.showConfirmMsgRaw(pg.getGameString("RELEASE_WARN"), pg.getFormatText(pg.getGameString("HOMECAR_KICK_LINE_MEMBER"), playerName), function()
			pg.me:kickLineMemberMessage(uid, function()
				self:selectItemByIndex()
			end)
		end)
	end
end

function HomeCurrentStationComponent:selectItemByIndex(index)
	for i = 1, self.playerItemNum do
		local item = self["manageItem" .. i]

		if item then
			item.isSelected = i == index
		end
	end
end

function HomeCurrentStationComponent:bindSlotFocusListener(manageItem, index)
	manageItem.luaHover = nil
	manageItem.luaUnhover = nil

	function manageItem.luaHover()
		self:onSlotFocused(index)
		self:syncNavFocusToSlot(manageItem)
	end

	function manageItem.luaUnhover()
		if self.focusedSlotIndex == index then
			self:onSlotFocused(nil)
		end
	end
end

function HomeCurrentStationComponent:syncNavFocusToSlot(manageItem)
	if not manageItem or IsNil(manageItem) then
		return
	end

	local navManager = CS.XGUI.Navigation.NavManager.Instance

	if not navManager or not navManager.FocusItem then
		return
	end

	local cur = navManager.CurrentFocusedUContent

	if not IsNil(cur) and cur.gameObject == manageItem.gameObject then
		return
	end

	navManager:FocusItem(manageItem)
end

function HomeCurrentStationComponent:onSlotFocused(index)
	if self.focusedSlotIndex == index then
		return
	end

	self.focusedSlotIndex = index

	local parentCtrl = self.ctrl

	if parentCtrl and parentCtrl.refreshConsoleBarState then
		parentCtrl:refreshConsoleBarState()
	end
end

function HomeCurrentStationComponent:focusFirstSlot()
	local firstItem = self.manageItem1

	if not firstItem or IsNil(firstItem) then
		return
	end

	local navManager = CS.XGUI.Navigation.NavManager.Instance

	if navManager and navManager.FocusItem then
		navManager:FocusItem(firstItem)
	end

	self:onSlotFocused(1)
end

function HomeCurrentStationComponent:getFocusedSlotInfo()
	local index = self:getNavFocusedSlotIndex() or self.focusedSlotIndex

	if not index then
		return nil
	end

	return self.slotInfos[index]
end

function HomeCurrentStationComponent:getNavFocusedSlotIndex()
	local navManager = CS.XGUI.Navigation.NavManager.Instance

	if not navManager then
		return nil
	end

	local navItem = navManager.CurrentFocusedUContent

	if IsNil(navItem) then
		return nil
	end

	local navGo = navItem.gameObject

	if IsNil(navGo) then
		return nil
	end

	for i = 1, self.playerItemNum do
		local item = self["manageItem" .. i]

		if item and not IsNil(item) and item.gameObject == navGo then
			return i
		end
	end

	return nil
end

function HomeCurrentStationComponent:triggerFocusedSlotKick()
	local info = self:getFocusedSlotInfo()

	if not info or info.isEmpty or info.isSelf then
		return
	end

	self:selectItemByIndex(info.index)

	if not info.leaveBtn or IsNil(info.leaveBtn) then
		return
	end

	if not info.leaveBtn.activeInHierarchy then
		return
	end

	info.leaveBtn:OnClickSimulate()
end

return HomeCurrentStationComponent
