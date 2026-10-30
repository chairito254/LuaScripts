-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Recharge\\RechargeConst.lua

local Const = require("Common.Const.Const")
local SysConfigData = require("Data.sys_config_data")
local RechargeConst = {
	PENALTY_CURRENCY_ID = 3,
	PAYMENT_TIMEOUT_SEC = 30,
	ORDER_TIMEOUT_SEC = 30,
	ORDER_ERROR = {
		INVALID_PRODUCT = 3,
		SERVER_ERROR = 2,
		TIMEOUT = 1,
		SUCCESS = 0
	},
	STATE = {
		PAYING = 3,
		REQUESTING = 1,
		IDLE = 0
	},
	RECHARGE_TYPE = Const.RECHARGE_TYPE,
	RUSSIAN_THIRD_PARTY_PAY_CHANNELS = {
		["google.official.Aof9mf"] = true,
		["apple.official.Iwdfss"] = true,
		["rustore-pay.official.A5yuvm"] = true
	},
	RECHARGE_BP_TYPE = {
		ADVANCED = 2,
		NORMAL = 1,
		ADD = 3
	},
	PENALTY_FORCE_RECHARGE_THRESHOLD = SysConfigData.monetary_penalty_threshold
}

return RechargeConst
