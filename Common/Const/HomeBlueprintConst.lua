-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\HomeBlueprintConst.lua

local HomeBlueprintConst = {}

HomeBlueprintConst.SOURCE_TYPE = {
	SYSTEM = 2,
	UPLOADED = 1,
	SAVED_OTHER = 3
}
HomeBlueprintConst.BLUEPRINT_KIND = {
	PLAN = 2,
	COMBINATION = 1
}
HomeBlueprintConst.MONGO_COLLECTION_PUBLIC = "home_blueprint_public"
HomeBlueprintConst.MONGO_COLLECTION_SAVED = "home_blueprint_saved"
HomeBlueprintConst.MONGO_COLLECTION_ALLOC = "home_blueprint_alloc"
HomeBlueprintConst.DEFAULT_CONFIG = {
	maxPlanBlueprintNameLength = 10,
	maxBlueprintNameLength = 20,
	maxPlanBlueprintCoverImageCount = 3,
	maxBlueprintCoverImageCount = 4,
	maxFurniturePerBlueprint = 100,
	maxSavedOtherPlanBlueprintCount = 20,
	maxSavedOtherBlueprintCount = 10,
	maxUploadPlanBlueprintCount = 10,
	maxUploadBlueprintCount = 10,
	blueprintCodeLength = 8,
	maxPlanBlueprintDescLength = 100,
	maxBlueprintDescLength = 100
}
HomeBlueprintConst.MAX_PAGE_LIMIT = 50

return HomeBlueprintConst
