-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Event\\Component\\CommonGuide\\CreatorGuideHandler.lua

local Class = require("Core.Framework.Class")
local GuideHandlerBase = require("Guis.Panels.Event.Component.CommonGuide.GuideHandlerBase")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("EventCommonGuideComponent")
local CreatorGuideHandler = Class.LightClass("CreatorGuideHandler", GuideHandlerBase)

function CreatorGuideHandler:getOwnedRefKeys()
	return {
		"creatorUContainer"
	}
end

function CreatorGuideHandler:getOwnedContainers()
	return {
		"creatorUContainer"
	}
end

function CreatorGuideHandler:onFindObjects(objectReference)
	self.creatorUContainer = objectReference:GetRefValue("creatorUContainer")
end

function CreatorGuideHandler:onRefresh()
	self.comp.rewardContentUWidget:SetActive(false)
	self.comp.btnGotoUButton:SetActive(false)
	self.comp.btnNameUButton:SetActive(false)

	if self.creatorUContainer then
		self.creatorUContainer:SetActive(true)

		if self.creatorUContainer:CheckURLLoaded() then
			self:_refreshCreatorGuide()
		else
			self.creatorUContainer:LoadDefaultUrlManually(function()
				self:_refreshCreatorGuide()
			end)
		end
	end
end

function CreatorGuideHandler:_refreshCreatorGuide()
	local linkAddresses = self.comp.model:getCreatorGuideLinkAddresses(self.comp.commonGuideId)

	if not linkAddresses then
		if pg.logError() then
			logger:error("@EventCommonGuideComponent _refreshCreatorGuide commonGuideData is nil, eventId: %d, commonGuideId: %d", self.comp.eventId, self.comp.commonGuideId)
		end

		return
	end

	if not self.creatorUContainer or not self.creatorUContainer.content then
		return
	end

	local objectReference = self.creatorUContainer.content:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	self.link1UButton = objectReference:GetRefValue("link1UButton")
	self.link2UButton = objectReference:GetRefValue("link2UButton")
	self.link3UButton = objectReference:GetRefValue("link3UButton")

	self:_bindLinkButton(self.link1UButton, linkAddresses[1])
	self:_bindLinkButton(self.link2UButton, linkAddresses[2])
	self:_bindLinkButton(self.link3UButton, linkAddresses[3])
end

function CreatorGuideHandler:_bindLinkButton(button, url)
	if not button then
		return
	end

	function button.luaClick()
		if self.comp.isLock or not url or url == "" then
			return
		end

		pg.global.sdkManager:openUrl("CreatorGuideHandler", self.comp.eventId, url)
	end
end

function CreatorGuideHandler:onExit()
	if self.creatorUContainer then
		self.creatorUContainer:SetActive(false)
	end
end

return CreatorGuideHandler
