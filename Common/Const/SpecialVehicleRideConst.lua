-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\SpecialVehicleRideConst.lua

local SpecialVehicleRideConst = {}

SpecialVehicleRideConst.RideState = {
	TRANSFERRING = 2,
	ACTIVE = 1,
	IDLE = 0,
	EXITING = 5,
	MOUNTING = 4,
	DESTROYING = 3
}
SpecialVehicleRideConst.MotionState = {
	JUMP_START = 4,
	MOVE_END = 3,
	IDLE = 0,
	MOVE_START = 1,
	MOVE = 2,
	JUMP_LAND = 6,
	JUMP = 5
}
SpecialVehicleRideConst.MotionTransition = {
	[SpecialVehicleRideConst.MotionState.IDLE] = {
		[SpecialVehicleRideConst.MotionState.MOVE_START] = true,
		[SpecialVehicleRideConst.MotionState.JUMP_START] = true
	},
	[SpecialVehicleRideConst.MotionState.MOVE_START] = {
		[SpecialVehicleRideConst.MotionState.MOVE] = true,
		[SpecialVehicleRideConst.MotionState.MOVE_END] = true,
		[SpecialVehicleRideConst.MotionState.JUMP_START] = true
	},
	[SpecialVehicleRideConst.MotionState.MOVE] = {
		[SpecialVehicleRideConst.MotionState.MOVE_END] = true,
		[SpecialVehicleRideConst.MotionState.JUMP_START] = true
	},
	[SpecialVehicleRideConst.MotionState.MOVE_END] = {
		[SpecialVehicleRideConst.MotionState.IDLE] = true,
		[SpecialVehicleRideConst.MotionState.MOVE_START] = true,
		[SpecialVehicleRideConst.MotionState.JUMP_START] = true
	},
	[SpecialVehicleRideConst.MotionState.JUMP_START] = {
		[SpecialVehicleRideConst.MotionState.JUMP] = true,
		[SpecialVehicleRideConst.MotionState.JUMP_LAND] = true
	},
	[SpecialVehicleRideConst.MotionState.JUMP] = {
		[SpecialVehicleRideConst.MotionState.JUMP_LAND] = true
	},
	[SpecialVehicleRideConst.MotionState.JUMP_LAND] = {
		[SpecialVehicleRideConst.MotionState.IDLE] = true,
		[SpecialVehicleRideConst.MotionState.MOVE_START] = true,
		[SpecialVehicleRideConst.MotionState.MOVE] = true
	}
}

return SpecialVehicleRideConst
