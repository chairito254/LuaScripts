-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetBalanceResetText.lua

local PetBalanceResetText = {}
local DEFAULT_TEXT = {
	PET_BALANCE_RESET_RESULT_PENDING = "(测试用)正在等待养成重置结果，请勿重复操作",
	PET_BALANCE_RESET_DETAIL = "(测试用)可返还道具经验、等级突破、天赋果实、六维学习和共鸣对应的养成材料，返还材料均为绑定。保留非道具来源经验，等级不会低于获得时的初始等级，不返还进化材料。请在倒计时结束前完成重置。",
	PET_BALANCE_RESET_SUCCESS = "(测试用)养成重置成功",
	PET_BALANCE_RESET_DESC = "(测试用)重置后将返还可返还的养成材料，并回退对应的养成进度。是否确认重置？",
	PET_BALANCE_RESET_TIME_LEFT = "(测试用)剩余时间：{0}",
	PET_BALANCE_RESET_TITLE = "(测试用)养成重置",
	PET_BALANCE_RESET_UNAVAILABLE = "(测试用)该伊莫当前无法进行养成重置",
	PET_BALANCE_RESET_EMPTY = "(测试用)该伊莫暂无可返还的养成材料"
}

function PetBalanceResetText.get(key)
	local text = pg.getGameString(key)

	if not text or text == "" or text == key or tonumber(text) then
		return DEFAULT_TEXT[key] or key
	end

	return text
end

return PetBalanceResetText
