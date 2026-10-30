-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Communication\\DialogueUIBridge.lua

local ClientConst = require("Const.ClientConst")
local DialogueConst = require("Const.DialogueConst")
local UIConst = require("Const.UIConst")
local SafeCallback = require("Core.Framework.SafeCallback")
local Lume = require("Core.Common.lume")
local M = {}
local finishCallbackList = {}

function M.getFinishCallback()
	return finishCallbackList
end

function M.addFinishCallback(callback)
	finishCallbackList[#finishCallbackList + 1] = callback
end

function M.invokeFinishCallbacks()
	local callbacks = {}

	for _, callback in ipairs(finishCallbackList) do
		callbacks[#callbacks + 1] = callback
	end

	Lume.clear(finishCallbackList)

	for _, callback in ipairs(callbacks) do
		SafeCallback(callback)
	end
end

function M.closeDialogUI(key)
	local ui = pg.global.ui
	local npcCall = ui:tryGetCtrlByUid(UIConst.UI_ID_NPC_CALL)

	if npcCall ~= nil and npcCall.setIsModel ~= nil then
		npcCall:setIsModel(false)

		if npcCall:checkUIOpen() == true then
			npcCall:close()
		end
	end

	local plotPhoneCall = ui:tryGetCtrlByUid(UIConst.UI_ID_PLOT_PHONE_CALL)

	if plotPhoneCall ~= nil and plotPhoneCall.setIsModel ~= nil then
		plotPhoneCall:setIsModel(true)

		if plotPhoneCall:checkUIOpen() == true then
			plotPhoneCall:close()
		end
	end

	if ui:checkUIOpen(UIConst.UI_ID_BOTTOM_DIALOGUE) then
		local dialogue = ui.dialogue

		SafeCallback(dialogue.finishDialogue, dialogue)
		SafeCallback(dialogue.close, dialogue)
	end

	if ui:checkUIOpen(UIConst.UI_ID_AI_ASSISTANT) then
		ui.aiAssistant:startClose()
	end

	if ui:checkUIOpen(UIConst.UI_ID_SUBTITLES_PANEL) then
		ui.SubtitlesPanel:close()
	end

	if ui:checkUIShow(UIConst.UI_ID_BLACK_SCREEN) and key ~= DialogueConst.DIALOGUE_CLOSE_KEY.DIALOG_CLOSE_NODE and ui.blackScreen:isDialogueGraphScreen() then
		ui.blackScreen:startCloseScreen()
	end

	if ui:checkUIShow(UIConst.UI_ID_WHITE_SCREEN) and key ~= DialogueConst.DIALOGUE_CLOSE_KEY.DIALOG_CLOSE_NODE and ui.whiteScreen:isDialogueGraphScreen() then
		ui.whiteScreen:startCloseScreen()
	end

	if ui:checkUIShow(UIConst.UI_ID_DIALOG_REVIEW) then
		ui:close(UIConst.UI_ID_DIALOG_REVIEW)
	end
end

function M.hideDialogueTextUI()
	if pg.global.ui:checkUIShow(UIConst.UI_ID_SUBTITLES_PANEL) then
		pg.global.ui.SubtitlesPanel:hide()
	end

	if pg.global.ui:checkUIShow(UIConst.UI_ID_NPC_CALL) then
		pg.global.ui.npcCall:hideNpcCallContent()
	end

	if pg.global.ui:checkUIShow(UIConst.UI_ID_BOTTOM_DIALOGUE) then
		SafeCallback(pg.global.ui.dialogue.finishDialogue, pg.global.ui.dialogue)
	end

	if pg.global.ui:checkUIShow(UIConst.UI_ID_AI_ASSISTANT) then
		pg.global.ui.aiAssistant:hide()
	end

	if pg.global.ui:checkUIShow(UIConst.UI_ID_BLACK_SCREEN) and pg.global.ui.blackScreen.isDialogueGraph and pg.global.ui.blackScreen:isDialogueGraphScreen() then
		pg.global.ui.blackScreen:closeScreen()
	end

	if pg.global.ui:checkUIShow(UIConst.UI_ID_WHITE_SCREEN) then
		pg.global.ui.whiteScreen:closeScreen()
	end
end

function M.enableDialogUIMonopoly(enable)
	if enable then
		pg.global.ui:hideAllUIByCustomKey(UIConst.UI_HIDE_KEY.Dialogue, {
			[UIConst.UI_ID_BOTTOM_DIALOGUE] = true,
			[UIConst.UI_ID_TIPS] = true,
			[UIConst.UI_ID_COMMON_OBTAIN] = true,
			[UIConst.UI_ID_CONFIG_TOPPING] = true,
			[UIConst.UI_ID_PLOT_PHONE_CALL] = true,
			[UIConst.UI_ID_DIALOG_REVIEW] = true,
			[UIConst.UI_ID_BLACK_SCREEN] = true,
			[UIConst.UI_ID_LOADING] = true,
			[UIConst.UI_ID_SUBTITLES_PANEL] = true,
			[UIConst.UI_ID_PICTURE] = true,
			[UIConst.UI_ID_AI_ASSISTANT] = true,
			[UIConst.UI_ID_NPC_CALL] = true,
			[UIConst.UI_ID_COMMON_CONFIRM] = true,
			[UIConst.UI_ID_DIALOGUE_SKIP] = true,
			[UIConst.UI_ID_BLACK_SCREEN_SKIP_PANEL] = true,
			[UIConst.UI_ID_WHITE_SCREEN] = true
		})
	else
		pg.global.ui:restoreAllUIByCustomKey(UIConst.UI_HIDE_KEY.Dialogue)
	end
end

function M.enableDeprivePlayerControl(enable)
	pg.global.ui.npcCall:setIsModel(enable)
	pg.global.ui.plotPhoneCall:setIsModel(enable)
	pg.global.ui.dialogue:setIsModel(enable)
	pg.game.input:setLockCursor(ClientConst.LockCursorKey.Dialogue, not enable)
end

return M
