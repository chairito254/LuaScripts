-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TeamRoom\\TeamRoomModel.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local TeamRoomModel = Class.LightClass("TeamRoomModel", UIModel)
local PetData = require("Data.pet_data")
local LevelData = require("Data.level_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Const = require("Common.Const.Const")
local ItemConst = require("Common.Const.ItemConst")
local ItemUtils = require("Common.Utils.ItemUtils")
local RobEggItemIn = require("Data.rob_egg_item_in")

local function getBagCount(bag)
	return bag and bag.getCount and bag:getCount() or -1
end

local function getBagCapacity(bag)
	return bag and bag.getCapacity and bag:getCapacity() or -1
end

function TeamRoomModel:getDungeonConfig(dungeonSceneId)
	return dungeonSceneId and LevelData[dungeonSceneId] or nil
end

function TeamRoomModel:setDungeonInfo(dungeonId, difficultLv)
	self.dungeonSceneId = dungeonId
	self.difficultLv = difficultLv
end

function TeamRoomModel:isSinglePreviewRoom()
	return not pg.me:isInTeam()
end

function TeamRoomModel:getSelfMemberInfo()
	local petInfoList = pg.me.getTeamPetInfos and pg.me:getTeamPetInfos() or {}

	return {
		uid = pg.me.uid,
		playerName = pg.me.playerName,
		showTitles = pg.me.showTitles,
		showTitleExtra = pg.me.showTitleExtra,
		isWholeTitle = pg.me.isWholeTitle,
		avatarConfig = pg.me.avatarConfig,
		avatarPresetKey = pg.me.avatarPresetKey,
		curShow = pg.me.curShow,
		exploreAbilityIds = pg.me.exploreAbilityIds or {},
		petInfoList = petInfoList
	}
end

function TeamRoomModel:getTeamInfo()
	if not self:isSinglePreviewRoom() then
		return pg.me:getShowTeamInfo()
	end

	local uid = pg.me.uid
	local memberInfo = self:getSelfMemberInfo()

	return {
		leaderUid = uid,
		dungeonSceneId = self.dungeonSceneId,
		hardLv = self:getDifficultLv(),
		sortList = {
			uid
		},
		membersInfo = {
			[uid] = memberInfo
		},
		prepareInfos = {
			[uid] = {
				isPrepare = false,
				petInfoList = memberInfo.petInfoList
			}
		},
		confirms = {
			[uid] = {
				isPrepare = false
			}
		}
	}
end

function TeamRoomModel:getDifficultLv()
	if self.difficultLv then
		return self.difficultLv
	end

	local teamInfo = pg.me:getShowTeamInfo()

	return teamInfo and teamInfo.hardLv or 0
end

function TeamRoomModel:getMemberContainerCount(dungeonConfig)
	if self:isSinglePreviewRoom() then
		return 3
	end

	local maxCount = dungeonConfig and dungeonConfig.playerNumMax or 4

	return maxCount % 2 == 1 and 3 or 4
end

function TeamRoomModel:needPreEquip(dungeonConfig)
	return dungeonConfig and dungeonConfig.fb_type == Const.CUR_DUNGEON_TYPE.Egg
end

function TeamRoomModel:isGrabEggsEquipDungeon(dungeonId)
	return dungeonId == Const.ROB_EGG_SCENE_ID or dungeonId == Const.ROB_EGG_SCENE_CLIP_ID
end

local function addRobEggWarehouseItem(idNumDict, itemId, count)
	local itemInConfig = RobEggItemIn[itemId]
	local warehouseItemId = itemInConfig and itemInConfig.outid

	if not ToBool(warehouseItemId) then
		return
	end

	idNumDict[warehouseItemId] = (idNumDict[warehouseItemId] or 0) + (count or 1)
end

local function genRobEggCapacityCheckItems(idNumDict)
	local items = {}
	local itemNumInfo = ItemUtils.solveBoundOnAdd(idNumDict)

	local function addItem(itemId, count, isBind)
		if not count or count <= 0 then
			return
		end

		items[#items + 1] = {
			id = itemId,
			count = count,
			isBind = isBind,
			maxCount = function(item)
				return ItemUtils.getItemStackCount(item.id)
			end,
			isStatusLocked = function()
				return false
			end
		}
	end

	for itemId, numberInfo in pairs(itemNumInfo) do
		addItem(itemId, numberInfo[Const.INV_BOUND_TYPE_BOUND], true)
		addItem(itemId, numberInfo[Const.INV_BOUND_TYPE_UNBOUND], false)
	end

	return items
end

function TeamRoomModel:getRobEggCarriedWarehouseItems()
	local idNumDict = {}
	local hasCarriedItem = false

	local function collectBag(bag)
		if not bag then
			return
		end

		for _, item in bag:items() do
			if item and ToBool(item.id) and (item.count or 0) > 0 then
				hasCarriedItem = true

				addRobEggWarehouseItem(idNumDict, item.id, item.count)

				if item.forEachChipSlot then
					item:forEachChipSlot(function(_, _, chipId)
						if ToBool(chipId) then
							addRobEggWarehouseItem(idNumDict, chipId, 1)
						end
					end)
				end
			end
		end
	end

	collectBag(ItemUtils.getTypedBag(pg.me, ItemConst.INV_TYPE_ROB_EGG))
	collectBag(ItemUtils.getTypedBag(pg.me, ItemConst.INV_TYPE_EQUIP_SLOTS))

	return hasCarriedItem, idNumDict
end

function TeamRoomModel:isRobEggPvpWarehouseSpaceInsufficient(dungeonId)
	local checkInfo = {
		insufficient = false,
		reason = "not_pvp",
		dungeonId = dungeonId
	}

	if dungeonId ~= Const.ROB_EGG_SCENE_ID then
		return false, checkInfo
	end

	local carriedBag = ItemUtils.getTypedBag(pg.me, ItemConst.INV_TYPE_ROB_EGG)
	local equipBag = ItemUtils.getTypedBag(pg.me, ItemConst.INV_TYPE_EQUIP_SLOTS)
	local hasCarriedItem, idNumDict = self:getRobEggCarriedWarehouseItems()

	checkInfo.carriedCount = getBagCount(carriedBag)
	checkInfo.carriedCapacity = getBagCapacity(carriedBag)
	checkInfo.equipCount = getBagCount(equipBag)
	checkInfo.equipCapacity = getBagCapacity(equipBag)
	checkInfo.hasCarriedItem = hasCarriedItem

	if not hasCarriedItem or not next(idNumDict) then
		checkInfo.reason = "no_mapped_carried_item"

		return false, checkInfo
	end

	local mappedKinds = 0
	local mappedCount = 0

	for _, count in pairs(idNumDict) do
		mappedKinds = mappedKinds + 1
		mappedCount = mappedCount + count
	end

	checkInfo.mappedKinds = mappedKinds
	checkInfo.mappedCount = mappedCount

	local warehouse = ItemUtils.getTypedBag(pg.me, ItemConst.INV_TYPE_ROB_EGG_WAREHOUSE)

	if not warehouse then
		checkInfo.insufficient = true
		checkInfo.reason = "no_warehouse"

		return true, checkInfo
	end

	local items = genRobEggCapacityCheckItems(idNumDict)
	local combinedSlots = warehouse.__calcSpace and warehouse:__calcSpace(items, warehouse.allowMultiPile) or -1
	local canHold = warehouse:canHoldItems(items)
	local insufficient = not canHold

	checkInfo.incomingGroups = #items
	checkInfo.warehouseCount = getBagCount(warehouse)
	checkInfo.warehouseCapacity = getBagCapacity(warehouse)
	checkInfo.warehouseSpace = warehouse.getSpace and warehouse:getSpace() or -1
	checkInfo.combinedSlots = combinedSlots
	checkInfo.allowMultiPile = warehouse.allowMultiPile
	checkInfo.overflowMode = warehouse.overflowMode
	checkInfo.canHold = canHold
	checkInfo.insufficient = insufficient
	checkInfo.reason = insufficient and "warehouse_insufficient" or "warehouse_can_hold"

	return insufficient, checkInfo
end

function TeamRoomModel:getTeamMemberRenderData(dungeonConfig)
	local maxCount = self:getMemberContainerCount(dungeonConfig)
	local data = {}

	for i = 1, maxCount do
		data[i] = {
			tIndex = 0,
			empty = true
		}
	end

	local teamInfo = self:getTeamInfo()

	for i, uid in ipairs(teamInfo.sortList or EMPTY_TABLE) do
		if data[i] then
			data[i].empty = false
			data[i].uid = uid
		end
	end

	return data
end

function TeamRoomModel:getPreEquipMemberRenderData(dungeonConfig)
	local maxCount = self:getMemberContainerCount(dungeonConfig)
	local data = {}

	for i = 1, maxCount do
		data[i] = {
			tIndex = 0,
			empty = true
		}
	end

	local teamInfo = self:getTeamInfo()

	for i, uid in ipairs(teamInfo.sortList or EMPTY_TABLE) do
		local memberInfo = teamInfo.membersInfo[uid] or {}
		local prepareInfo = teamInfo.prepareInfos[uid] or {}

		if data[i] then
			data[i] = {
				empty = false,
				tIndex = 0,
				order = i,
				uid = uid,
				isLeader = uid == teamInfo.leaderUid,
				isReady = prepareInfo.isPrepare,
				isSelf = uid == pg.me.uid,
				playerName = memberInfo.playerName,
				platformDisplayName = memberInfo.platformDisplayName,
				platformUserId = memberInfo.platformUserId,
				platformFamily = memberInfo.platformFamily,
				platform = memberInfo.platform,
				os = memberInfo.os,
				isAllowedCrossPlatform = memberInfo.isAllowedCrossPlatform,
				showTitles = memberInfo.showTitles,
				showTitleExtra = memberInfo.showTitleExtra,
				isWholeTitle = memberInfo.isWholeTitle,
				petList = {}
			}

			self:parsePetList(memberInfo.petInfoList or {}, data[i].petList)
		end
	end

	return data
end

function TeamRoomModel:parsePetList(src, dest)
	for i = 1, 4 do
		local petInfo = src[i]

		if petInfo then
			dest[i] = {
				empty = false,
				level = petInfo.level,
				cp = petInfo.cp,
				label = petInfo.label,
				templateId = petInfo.templateId
			}

			local petConfig = PetData[petInfo.templateId]

			if petConfig then
				dest[i].icon = LuaUIUtils.getPetIcon(petConfig.iconName, LuaUIUtils.PET_ICON, petInfo.label, 1)
				dest[i].name = pg.getLocalizationText(petConfig.name)
				dest[i].mainElementType = petConfig.mainElementType
				dest[i].coreAbilityId = petInfo.coreAbilityId
			end

			if not string.isNilOrEmpty(petInfo.name) then
				dest[i].name = petInfo.name
			end
		else
			dest[i] = {
				empty = true
			}
		end
	end
end

return TeamRoomModel
