-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\DialogueGraph\\DialogueGraphRuntime\\Node\\DialogueGraphCameraBlendNode.lua

local DialogueGraphFlowNode = require("GameApp.DialogueGraph.DialogueGraphRuntime.Node.DialogueGraphFlowNode")
local DialogueGraphCameraBlendNode = DialogueGraphFlowNode.extend("DialogueGraphCameraBlendNode")
local DialogueGraphUtils = require("GameApp.DialogueGraph.DialogueGraphUtils")
local DialogueGraphConst = require("Const.DialogueGraphConst")
local NodeFunc = DialogueGraphConst.NODE_FUNC_TYPE
local Quaternion = Quaternion

local function enumValue(value, values, defaultValue)
	return tonumber(value) or values[value] or defaultValue
end

local function buildMovementData(ctx)
	local movementType = enumValue(ctx:getInput("cameraMovementTypeVInput", 0), DialogueGraphConst.MovementType, 0)
	local movementTime = ctx:getInput("cameraMovementTimeVInput", 0)

	if movementType == 0 or movementTime <= 0 then
		return nil
	end

	local data = {
		type = movementType,
		blendTime = movementTime,
		blendFunc = enumValue(ctx:getInput("cameraMovementFuncVInput", 2), DialogueGraphConst.BlendFunction, 2),
		blendExp = ctx:getInput("cameraMovementExpVInput", 2),
		mode = enumValue(ctx:getInput("cameraMovementModeVInput", 0), DialogueGraphConst.MovementMode, 0)
	}

	if movementType == DialogueGraphConst.MovementType.LocalMovement then
		data.vector = DialogueGraphUtils.toVector3(ctx:getInput("cameraMovementVectorVInput", nil))
	elseif movementType == DialogueGraphConst.MovementType.OrbitalMovement then
		data.center = DialogueGraphUtils.toVector3(ctx:getInput("cameraMovementCenterVInput", nil))
		data.angle = ctx:getInput("cameraMovementAngleVInput", 0)
	elseif movementType == DialogueGraphConst.MovementType.SelfRotation then
		data.axis = DialogueGraphUtils.toVector3(ctx:getInput("cameraMovementAxisVInput", {
			0,
			1,
			0
		}))
		data.angle = ctx:getInput("cameraMovementAngleVInput", 0)
	end

	return data
end

local function stopDof(ctx)
	ctx:callCmd(NodeFunc.CAMERA_SET_DOF_ACTIVE, false)
end

function DialogueGraphCameraBlendNode.run(ctx)
	if ctx:inputPort() == "StopDof" then
		stopDof(ctx)

		return
	end

	local blendTime = ctx:getInput("blendTimeVInput", 0)
	local position = DialogueGraphUtils.toVector3(ctx:getInput("positionVInput"))
	local eulerAngle = DialogueGraphUtils.toVector3(ctx:getInput("rotationVInput"))
	local rotation = Quaternion.Euler(eulerAngle.x, eulerAngle.y, eulerAngle.z)
	local fov = ctx:getInput("fovVInput", 45)
	local extraParam = {
		blendExponent = ctx:getInput("blendExponentVInput", 2),
		blendFunction = DialogueGraphUtils.getCameraBlendFunction(ctx:getInput("blendFuncVInput", "EaseInOut")),
		cameraId = ctx:getField("cameraId", 0),
		movementData = buildMovementData(ctx)
	}

	local function triggerFinish()
		ctx:cancelTimeout()
		ctx:triggerFlow("Finish")
	end

	local function finishCallback()
		if not ctx:tryConsumeRunToken() then
			return
		end

		if blendTime > 0 then
			triggerFinish()
		else
			ctx:cancelTimeout()
			ctx:delayFrame(1, function()
				triggerFinish()
			end)
		end
	end

	ctx:startTimeout(blendTime + 2, function()
		if not ctx:tryConsumeRunToken() then
			return
		end

		triggerFinish()
	end)
	ctx:callCmd(NodeFunc.CAMERA_START_GRAPH_BLEND, position, rotation, fov, blendTime, finishCallback, extraParam)

	if ctx:getField("openDof", false) and DialogueGraphUtils.canApplyDof(ctx.runtime.luaCmd) then
		local dofTarget = ctx:getInput("dofTargetVInput", nil)
		local data = {
			openDof = true,
			dofTarget = dofTarget,
			focalDistance = ctx:getField("focalDistance", 200),
			fStop = ctx:getField("fStop", 4),
			sensorWidth = ctx:getField("sensorWidth", 360),
			squeezeFactor = ctx:getField("squeezeFactor", 1),
			recombineQuality = ctx:getField("recombineQuality", 0),
			visualizeDOF = ctx:getField("visualizeDOF", false),
			focalDistanceOffset = ctx:getInput("focalDistanceOffsetVInput", 0)
		}

		ctx:callCmd(NodeFunc.CAMERA_APPLY_DOF, ctx:nodeId(), data)
	end

	ctx:triggerFlow("Out")
end

return DialogueGraphCameraBlendNode
