-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\PatrolConst.lua

local PatrolConst = {}

PatrolConst.ACTION_TYPE = {
	Wait = 0,
	PlayAnimGroup = 8,
	MoveMode = 7,
	TemplateRef = 6,
	State = 5,
	ShowBubble = 4,
	PlayAnim = 3,
	Random = 2,
	Sequence = 1
}
PatrolConst.DEFAULT_PRIORITY = 100
PatrolConst.DEFAULT_PATROL_BEHAVIOR_TREE_PATH_PRE = "PatrolTree/PatrolSubTree/"
PatrolConst.DEFAULT_PATROL_MOVE_TREE_PATH_PRE = "PatrolTree/PatrolMoveSubTree/"
PatrolConst.PATH_STATE = {
	ACTION_RUNNING = 2,
	PATROL = 1,
	EXITED = 4,
	ACTION_EXITING = 3
}
PatrolConst.PATROL_SUB_STATE = {
	ST_Sleep = 4,
	ST_Rest = 3,
	ST_PatrolRun = 2,
	ST_PatrolWalk = 1,
	ST_None = 0
}
PatrolConst.PATROL_SUB_STATE_REV = {}

for k, v in pairs(PatrolConst.PATROL_SUB_STATE) do
	PatrolConst.PATROL_SUB_STATE_REV[v] = k
end

PatrolConst.FirstWayPointSelectType = {
	FirstWayPoint = 0,
	ResumeLastWayPoint = 2,
	NearestWayPoint = 1
}

return PatrolConst
