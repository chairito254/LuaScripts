-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\FuncMenuUnlock\\FuncMenuUnlockCtrl.lua

local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local FuncMenuData = require("Data.func_menu_data")
local FuncMenuListData = require("Data.func_menu_list_data")
local FuncMenuBottomListData = require("Data.func_menu_common_use_data")
local FuncToMenuIdData = require("Data.func_to_menu_id_data")
local NormalFuncToMenuIdData = require("Data.normal_func_to_menu_id_data")
local GuidenceItemData = require("Data.guidence_item_data")
local GuidenceSubItemData = require("Data.guidence_sub_item_data")
local FuncMenuUnlockCtrl = Class.LightClass("FuncMenuUnlockCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")

FuncMenuUnlockCtrl.messages = {}
FuncMenuUnlockCtrl.FuncMode = {
	Normal = 0,
	Other = 2,
	RightList = 1
}
FuncMenuUnlockCtrl.SpecialFunc = {
	"PETRESEARCH",
	"PETBALL",
	"SPECIALTRAIN",
	"PLAYERENHANCEMENT",
	"MAP"
}

function FuncMenuUnlockCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.info = info

	self:initUI()
end

function FuncMenuUnlockCtrl:addListener()
	function self.view.btnBgUButton.luaClick()
		if self.info.helpId then
			self.view.uIPbFunctionUnlockUComponent:TryChangePage("State", 1)
		else
			self:finishFuncUnlock()
		end
	end

	function self.view.previousUButton.luaClick()
		self.detailIndex = math.max(self.detailIndex - 1, 1)

		self:refreshFuncDetail(self.detailIndex)
	end

	function self.view.nextUButton.luaClick()
		self.detailIndex = math.min(self.detailIndex + 1, self.detailIndexMax)

		self:refreshFuncDetail(self.detailIndex)
	end

	function self.view.btnSaveUButton.luaClick()
		self:finishFuncUnlock()
	end
end

function FuncMenuUnlockCtrl:checkCanOpen(showNotice, info)
	if info and info.funcName then
		local _, _, funcData = self:getFuncMenuData(info.funcName, info.entrance)

		return funcData ~= nil
	end

	if info and info.entrance then
		if info.entrance[1] == FuncMenuUnlockCtrl.FuncMode.Normal then
			return FuncMenuListData[info.entrance[2]] ~= nil
		elseif info.entrance[1] == FuncMenuUnlockCtrl.FuncMode.RightList then
			return FuncMenuBottomListData[info.entrance[2]] ~= nil
		end
	end

	return UICtrl.checkCanOpen(self, showNotice, info)
end

function FuncMenuUnlockCtrl:finishFuncUnlock()
	local isFuncUnlock = self.info.funcName ~= nil

	self:close()

	if isFuncUnlock then
		pg.global.ui.hudV2:removeCurUnlockFunc()
	end

	self:tryOpenFuncMenu()
end

function FuncMenuUnlockCtrl:tryOpenFuncMenu()
	if self.info.eventID then
		pg.me:doEvent(self.info.eventID)

		return
	end

	if self.info.entrance and (self.info.entrance[1] == FuncMenuUnlockCtrl.FuncMode.Normal or self.info.entrance[1] == FuncMenuUnlockCtrl.FuncMode.RightList) then
		pg.global.ui.funcMenu:open({
			unlockFuncId = self.info.entrance[2],
			guideGroupId = self.info.guideGroupId,
			dialogueGraphId = self.info.dialogueGraphId
		})
	end
end

function FuncMenuUnlockCtrl:initUI()
	self.view.guideUImage.url = nil

	if self.info.helpId then
		self:initFuncDetail()
	end

	if self.info.funcName then
		if pg.global.ui:checkUIOpen(UIConst.UI_ID_FUNC_MENU) then
			pg.global.ui.funcMenu:closePanel()
		end

		self.view.uIPbFunctionUnlockUComponent:TryChangePage("State", 0)

		local _, _, funcData = self:getFuncMenuData(self.info.funcName, self.info.entrance)

		self:renderFuncButton(self.view.funMenuItemUComponent, funcData)

		local length = self.view.newAnimation.clip.length

		self:startTimer(function()
			if self.info.helpId then
				self:showFuncDetail()
			else
				self.view.btnSaveUButton.luaClick()
			end
		end, length)
	else
		self.view.funcMenuDetailUButton:SetActive(false)
		self.view.uIPbFunctionUnlockUComponent:TryChangePage("State", 1)

		if self.info.helpId then
			self:refreshFuncDetail(self.detailIndex)
		end
	end

	ClientTextUtils.setText(self.view.btnSaveNameUText, pg.getGameString("COMPLETE"))
end

function FuncMenuUnlockCtrl:getFuncMenuData(funcName, entrance)
	if entrance then
		local funcMode = entrance[1]
		local funcId = entrance[2]

		if funcMode == FuncMenuUnlockCtrl.FuncMode.Normal and FuncMenuListData[funcId] then
			return funcMode, funcId, FuncMenuListData[funcId]
		elseif funcMode == FuncMenuUnlockCtrl.FuncMode.RightList and FuncMenuBottomListData[funcId] then
			return funcMode, funcId, FuncMenuBottomListData[funcId]
		end
	end

	local funcId = FuncToMenuIdData[funcName]

	if funcId and FuncMenuListData[funcId] then
		return FuncMenuUnlockCtrl.FuncMode.Normal, funcId, FuncMenuListData[funcId]
	end

	funcId = NormalFuncToMenuIdData[funcName]

	if funcId and FuncMenuBottomListData[funcId] then
		return FuncMenuUnlockCtrl.FuncMode.RightList, funcId, FuncMenuBottomListData[funcId]
	end
end

function FuncMenuUnlockCtrl:renderFuncButton(button, data)
	if not data then
		return
	end

	local useSpecialIcon = table.contains(self.SpecialFunc, data.functionName)
	local icon = data.img or data.icon or data.hudIcon

	button:TryChangePage("IconType", useSpecialIcon and 1 or 0)

	if useSpecialIcon then
		self.view.bigIconUImage.url = icon
	else
		self.view.iconUImage.url = icon
	end

	local funcName = pg.getLocalizationText(data.name)

	ClientTextUtils.setText(self.view.nameUBaseText, funcName)
	ClientTextUtils.setText(self.view.funcDetailNameUBaseText, funcName)
end

function FuncMenuUnlockCtrl:initFuncDetail()
	self.detailIndex = 1
	self.detailIndexMax = 1

	local helpCfg = GuidenceItemData[self.info.helpId]

	if not helpCfg then
		return
	end

	local helpIds = helpCfg.helpId

	self.detailIndexMax = #helpIds

	local data = {}

	for _, helpId in ipairs(helpIds) do
		table.insert(data, {
			tIndex = 0,
			helpId = helpId
		})
	end

	self.view.detailUList:SetList(data)

	local showDetail = #data > 1

	self.view.detailUList:SetActiveFastest(showDetail)
	self.view.previousUButton:SetActiveFastest(showDetail)
	self.view.nextUButton:SetActiveFastest(showDetail)
end

function FuncMenuUnlockCtrl:refreshFuncDetail(index)
	local helpCfg = GuidenceItemData[self.info.helpId]

	if not helpCfg then
		return
	end

	self.view.detailUList:SelectItem(index - 1)

	local helpId = helpCfg.helpId[index]
	local helpData = GuidenceSubItemData[helpId]

	if not helpData then
		return
	end

	self.view.previousUButton.interactable = index ~= 1
	self.view.nextUButton.interactable = index ~= self.detailIndexMax

	local picCdn = helpData.picCDN
	local videoCdn = helpData.videoCDN
	local hasPic = not string.isNilOrEmpty(picCdn)
	local hasVideo = not string.isNilOrEmpty(videoCdn)

	self.view.uIPbFunctionUnlockUComponent:TryChangePage("Type", hasPic and 0 or 1)
	self.view.uIPbFunctionUnlockUComponent:TryChangePage("Save", index == #helpCfg.helpId and 1 or 0)

	if hasPic then
		self.view.guideUImage:SetTextureByUrl(picCdn)
	end

	self.view.guideUVideoPlayer:SetActive(false)

	if hasVideo and not hasPic then
		self.view.guideUVideoPlayer:SetActive(true)

		self.view.guideUVideoPlayer.videoLoop = true

		self.view.guideUVideoPlayer:SetVideoUrlWithCallback(videoCdn, nil, nil)
	end

	ClientTextUtils.setText(self.view.funcDetailNameUBaseText, pg.getLocalizationText(helpCfg.name))
	ClientTextUtils.setText(self.view.funcDetailContentUBaseText, pg.getLocalizationText(helpData.text))
end

function FuncMenuUnlockCtrl:showFuncDetail()
	self.view.uIPbFunctionUnlockUComponent:TryChangePage("State", 1)
	self:refreshFuncDetail(self.detailIndex)
end

function FuncMenuUnlockCtrl:onDestroy()
	UICtrl.onDestroy(self)
end

function FuncMenuUnlockCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function FuncMenuUnlockCtrl:onShow()
	return
end

function FuncMenuUnlockCtrl:onHide()
	return
end

return FuncMenuUnlockCtrl
