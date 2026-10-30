-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagement\\Component\\PetWarehouseTipsComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local NpcDuelStartPetDetail = require("Guis.Panels.NpcDuelStart.NpcDuelStartPetDetail")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PetWarehouseTipsComponent = Class.LightClass("PetWarehouseTipsComponent", UIComponent)

function PetWarehouseTipsComponent:render(popup, petInfo, presenter, button, isCurrent, actions)
	if isCurrent and not isCurrent() then
		return
	end

	local refs = popup.transform:GetComponent("ObjectReference")

	if IsNil(refs) then
		return
	end

	local container = refs:GetRefValue("detailUContainer")

	if IsNil(container) then
		container = popup.transform:GetComponent("UContainer")
	end

	if IsNil(container) then
		return
	end

	local releaseButton = refs:GetRefValue("btnReleasingUButton")
	local moveButton = refs:GetRefValue("btnMoveUButton")
	local releaseText = refs:GetRefValue("btnReleasingUSDFText")
	local moveText = refs:GetRefValue("btnMoveUSDFText")

	if NotNil(releaseText) then
		ClientTextUtils.setText(releaseText, pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_BUTTON))
	end

	if NotNil(moveText) then
		local textKey = actions and actions.onMoveIn and PetWarehouseConst.PetWarehouseText.MOVE_IN_BUTTON or PetWarehouseConst.PetWarehouseText.MOVE_OUT_BUTTON

		ClientTextUtils.setText(moveText, pg.getGameString(textKey))
	end

	if NotNil(releaseButton) then
		releaseButton.interactable = actions and actions.onRelease ~= nil

		function releaseButton.luaClick()
			if isCurrent() and actions and actions.onRelease then
				actions.onRelease()
			end
		end
	end

	if NotNil(moveButton) then
		local onMove = actions and (actions.onMoveIn or actions.onMoveOut)

		moveButton.interactable = onMove ~= nil

		function moveButton.luaClick()
			if isCurrent() and onMove then
				onMove()
			end
		end
	end

	local function renderContent(content)
		if self._destroyed or not isCurrent() or IsNil(content) then
			return
		end

		self._detailContent = content
		self.detail = NpcDuelStartPetDetail.new(content, petInfo, presenter, button)

		if self.detail.infoBtn then
			self.detail.infoBtn.interactable = true
		end

		PetWarehouseTipsComponent.settleDetailCard(self, popup)

		if actions and actions.onContentReady then
			actions.onContentReady()
		end
	end

	if container:CheckURLLoaded() then
		renderContent(container.content)
	else
		container:LoadDefaultUrlManually(renderContent)
	end
end

function PetWarehouseTipsComponent:settleDetailCard(popup)
	local content = self._detailContent

	if IsNil(popup) or IsNil(content) then
		return false
	end

	if content.enabledConstrainToScreen ~= nil then
		content.enabledConstrainToScreen = false
	end

	local popupRefs = popup.transform and popup.transform:GetComponent("ObjectReference")
	local contentRefs = content.transform and content.transform:GetComponent("ObjectReference")

	if IsNil(popupRefs) or IsNil(contentRefs) then
		return false
	end

	local releaseButton = popupRefs:GetRefValue("btnReleasingUButton")
	local panel = contentRefs:GetRefValue("panelTransform")

	if IsNil(releaseButton) or IsNil(panel) then
		return false
	end

	if panel.enabledConstrainToScreen ~= nil then
		panel.enabledConstrainToScreen = false
	end

	local panelRect = panel.rectTransform or panel
	local buttonRect = releaseButton.rectTransform or releaseButton.transform

	if IsNil(panelRect) or IsNil(buttonRect) or IsNil(panelRect.rect) or IsNil(buttonRect.rect) or IsNil(panelRect.parent) then
		return false
	end

	local panelLeft = panelRect:TransformPoint(CS.UnityEngine.Vector3(panelRect.rect.xMin, 0, 0))
	local buttonLeft = buttonRect:TransformPoint(CS.UnityEngine.Vector3(buttonRect.rect.xMin, 0, 0))
	local localPanel = panelRect.parent:InverseTransformPoint(panelLeft)
	local localButton = panelRect.parent:InverseTransformPoint(buttonLeft)
	local dx = localButton.x - localPanel.x

	if dx > -0.5 and dx < 0.5 then
		return true
	end

	local pos = panelRect.anchoredPosition

	panelRect.anchoredPosition = CS.UnityEngine.Vector2(pos.x + dx, pos.y)

	return true
end

function PetWarehouseTipsComponent:onDestroy()
	self._destroyed = true
	self.detail = nil
end

return PetWarehouseTipsComponent
