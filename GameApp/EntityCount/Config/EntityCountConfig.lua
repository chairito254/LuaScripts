-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\EntityCount\\Config\\EntityCountConfig.lua

return {
	replaceScoreMargin = 25,
	epsilon = 1e-06,
	infoPoolCapacity = 256,
	recoverTrackedNpc = true,
	rememberCulledPosition = true,
	noModelInteractionReenterMarginMeters = 2,
	noModelInteractionDistanceMeters = 15,
	noModelInteractionDistanceLimitEnabled = true,
	ordinaryNpcReserve = 4,
	billboardDistanceMeters = 30,
	timing = {
		mobileBalance = 0.5,
		desktopBalance = 0.2,
		nearestSearchRadius = 4000,
		pendingRetry = 5,
		envBalance = 0.15,
		stable = 1
	},
	score = {
		far = 50,
		front = 120,
		near = 30,
		frontDiscount = 0.25,
		base = 10000,
		retainAngleMargin = 2,
		halfAngle = 55
	},
	schedule = {
		mobileVisits = 32,
		desktopVisits = 128,
		enabled = 1,
		turnDegrees = 15,
		cameraDistance = 2,
		movementDistance = 2,
		sliceDelay = 0.1,
		shortlistSize = 8,
		mobileDecisions = 1,
		desktopDecisions = 2,
		minVisits = 4
	},
	InfoIndex = {
		CULLED_X = 7,
		EXEMPT_ACTIVE = 6,
		TEMPLATE_ID = 5,
		DISPLAY_LEVEL = 4,
		STATE = 3,
		POSITION = 2,
		STATIC_ID = 1,
		NO_MODEL = 11,
		LIFECYCLE_SERIAL = 10,
		RECOVERY_REVISION = 9,
		CULLED_Z = 8
	}
}
