-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils.lua

local PetManagementUtils = {}

require("Utils.PetManagementUtils.PetContextUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetDetailUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetBoxUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetSkillUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetAttributeUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetFavoriteUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetResonanceUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetTipsUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetNavigationUIProxy")(PetManagementUtils)
require("Utils.PetManagementUtils.PetPropertyUtils")(PetManagementUtils)
require("Utils.PetManagementUtils.PetResonanceUtils")(PetManagementUtils)
require("Utils.PetManagementUtils.PetRecommendUtils")(PetManagementUtils)
require("Utils.PetManagementUtils.PetCultivationRequests")(PetManagementUtils)

return PetManagementUtils
