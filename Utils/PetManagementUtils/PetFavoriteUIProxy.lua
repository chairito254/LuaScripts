-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetFavoriteUIProxy.lua

local ClientTextUtils = require("Utils.ClientTextUtils")
local AddressDataConst = require("Const.AddressDataConst")
local PetHandbookConfigData = require("Data.pet_handbook_config_data")

return function(PetManagementUtils)
	PetManagementUtils.FavoriteTypes = {
		SHINNY_STAR = 10,
		HIGH_VALUE = 9,
		RARE_STAR = 8,
		LOVE_STAR = 7,
		FIVE_STAR = 6,
		ENERGY = 5,
		BREAK = 4,
		HEAL = 3,
		SUP = 2,
		DPS = 1,
		NULL = 0
	}

	function PetManagementUtils.onClickFavoriteBtn(petId)
		if not petId then
			return
		end

		PetManagementUtils._onClickFavoriteBtn(petId)
	end

	function PetManagementUtils._onClickFavoriteBtn(petId)
		petId = petId or PetManagementUtils.petId

		PetManagementUtils.setRenderFavoriteToolTips(PetManagementUtils.btnFavoriteUButton, petId)
	end

	function PetManagementUtils._resetBtnState()
		local petInfo = pg.me:getPetInfo(PetManagementUtils.petId)

		if not petInfo then
			return
		end

		PetManagementUtils.refreshFavoriteBtn(PetManagementUtils.btnFavoriteUButton, petInfo.favoriteType)
	end

	function PetManagementUtils.getPetFavoriteIconUrl(favoriteType)
		favoriteType = favoriteType or 0

		local PetHandbookConfigData = require("Data.pet_handbook_config_data")

		favoriteType = math.clamp(favoriteType, 0, PetHandbookConfigData.favoriteTypeMax - 1)

		return AddressDataConst["FAVORITE_STAR_ICON_" .. favoriteType]
	end

	function PetManagementUtils.setRenderFavoriteToolTips(button, petId)
		function button.luaRenderTooltip(_, component)
			PetManagementUtils._onRenderFavoritePopup(component, petId)

			PetManagementUtils._favoritePopup = component
		end
	end

	function PetManagementUtils._onRenderFavoritePopup(component, petId)
		local objectRef = component:GetComponent("ObjectReference")
		local txtTitleUSDFText = objectRef:GetRefValue("txtTitleUSDFText")

		ClientTextUtils.setText(txtTitleUSDFText, pg.getGameString("PET_FAVORITE_MARK"))

		local listUList = objectRef:GetRefValue("listUList")

		function listUList.luaRenderItem(subBtn, index, data)
			function subBtn.luaClick()
				local setType = data.isTaged and 0 or data.type

				pg.me:serverMsg("RPC_CS_PetModifyFavoriteType", petId, setType)
			end

			local objectRefrence = subBtn:GetComponent("ObjectReference")
			local iconUImage = objectRefrence:GetRefValue("iconUImage")

			iconUImage.url = PetManagementUtils.getPetFavoriteIconUrl(data.type)

			local rootUButton = objectRefrence:GetRefValue("uINodePetManagemengtMarkCellUButton")

			rootUButton.isSelected = data.isTaged
		end

		local favoriteList = PetManagementUtils.getFavoriteList(petId)

		listUList:SetList(favoriteList)
	end

	function PetManagementUtils.getFavoriteList(petId)
		if not petId then
			return {}
		end

		local petInfo = pg.me:getPetInfo(petId)
		local favoriteType = petInfo.favoriteType

		favoriteType = math.clamp(favoriteType, 0, PetHandbookConfigData.favoriteTypeMax - 1)

		local favoriteList = {}

		for favType = 0, PetHandbookConfigData.favoriteTypeMax - 1 do
			local index = favType

			favoriteList[index] = {
				type = favType,
				isTaged = favoriteType == favType
			}
		end

		return favoriteList
	end

	function PetManagementUtils.refreshFavoriteBtn(button, favoriteTtype, iconUImageRefKey)
		favoriteTtype = favoriteTtype or 0

		button:TryChangePage("enable", favoriteTtype > 0 and 1 or 0)
		button:TryChangePage("Favorite", favoriteTtype > 0 and 1 or 0)

		local refObj = button:GetComponent("ObjectReference")
		local iconUImage = refObj and refObj:GetRefValue(iconUImageRefKey or "iconUImage")

		if iconUImage then
			iconUImage.url = PetManagementUtils.getPetFavoriteIconUrl(favoriteTtype)
		end
	end

	function PetManagementUtils.onPetFavoriteChanged(petInfo)
		local petId = petInfo and petInfo.id or PetManagementUtils.petId

		if PetManagementUtils._favoritePopup then
			PetManagementUtils._onRenderFavoritePopup(PetManagementUtils._favoritePopup, petId)
		end
	end
end
