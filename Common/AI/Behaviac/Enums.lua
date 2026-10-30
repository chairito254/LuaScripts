-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\Behaviac\\Enums.lua

local _M = {}

_M.EBTStatus = {
	BT_FAILURE = 2,
	BT_SUCCESS = 1,
	BT_INVALID = 0,
	BT_RUNNING = 3
}
_M.EBTStatusName = {
	[0] = "BT_INVALID",
	"BT_SUCCESS",
	"BT_FAILURE",
	"BT_RUNNING"
}
_M.ETransitionPhase = {
	ETP_Always = 0,
	ETP_Exit = 3,
	ETP_Failure = 2,
	ETP_Success = 1
}
_M.ENodePhase = {
	E_BOTH = 2,
	E_FAILURE = 1,
	E_SUCCESS = 0
}
_M.EPreconditionPhase = {
	E_BOTH = 2,
	E_UPDATE = 1,
	E_ENTER = 0
}
_M.TriggerMode = {
	TM_Transfer = 1,
	TM_Reload = 3,
	TM_Return = 2
}
_M.EOperatorType = {
	E_MUL = 4,
	E_SUB = 3,
	E_ADD = 2,
	E_ASSIGN = 1,
	E_INVALID = 0,
	E_LESSEQUAL = 11,
	E_GREATEREQUAL = 10,
	E_LESS = 9,
	E_GREATER = 8,
	E_NOTEQUAL = 7,
	E_EQUAL = 6,
	E_DIV = 5
}
_M.EOperatorName = {
	[0] = "E_INVALID",
	"E_ASSIGN",
	"E_ADD",
	"E_SUB",
	"E_MUL",
	"E_DIV",
	"E_EQUAL",
	"E_NOTEQUAL",
	"E_GREATER",
	"E_LESS",
	"E_GREATEREQUAL",
	"E_LESSEQUAL"
}
_M.constSupportedVersion = 5
_M.constInvalidChildIndex = 0
_M.constBaseKeyStrDef = {
	kStrId = "id",
	kStrClass = "class",
	kStrAgentType = "agenttype",
	kStrAttachments = "attachments",
	kStrBehavior = "behavior",
	kStrType = "type",
	kEventParam = "eventParam",
	kStrProperties = "properties",
	kStrDescriptorRefs = "DescriptorRefs",
	kStrDomains = "Domains",
	kStrTransition = "transition",
	kStrEffector = "effector",
	kStrPars = "pars",
	kStrPrecondition = "precondition",
	kStrVersion = "version",
	kStrCustom = "custom",
	kStrValue = "value",
	kStrNode = "node",
	kStrName = "name"
}
_M.constPropertyValueType = {
	static = 2,
	const = 1,
	default = 0
}
_M.constBsonElementType = {
	BT_NULL = 10,
	BT_DateTime = 9,
	BT_Boolean = 8,
	BT_ObjectId = 7,
	BT_Undefined = 6,
	BT_Binary = 5,
	BT_Array = 4,
	BT_Object = 3,
	BT_String = 2,
	BT_Double = 1,
	BT_None = 0,
	BT_ParameterElement = 35,
	BT_Custom = 34,
	BT_MethodElement = 33,
	BT_MethodsElement = 32,
	BT_PropertyElement = 31,
	BT_AgentElement = 30,
	BT_AgentsElement = 29,
	BT_AttachmentElement = 28,
	BT_AttachmentsElement = 27,
	BT_NodeElement = 26,
	BT_ParElement = 25,
	BT_ParsElement = 24,
	BT_PropertiesElement = 23,
	BT_BehaviorElement = 22,
	BT_Set = 21,
	BT_Element = 20,
	BT_Float = 19,
	BT_Int64 = 18,
	BT_Timestamp = 17,
	BT_Int32 = 16,
	BT_ScopedCode = 15,
	BT_Symbol = 14,
	BT_Code = 13,
	BT_Reference = 12,
	BT_Regex = 11
}
_M.constCharByte = {
	WhiteSpace = string.byte(" "),
	DoubleQuote = string.byte("\""),
	LeftParentheses = string.byte("("),
	RightParentheses = string.byte(")"),
	LeftBracket = string.byte("["),
	RightBracket = string.byte("]"),
	LeftBraces = string.byte("{"),
	RightBraces = string.byte("}"),
	Comma = string.byte(","),
	Colon = string.byte(":"),
	Semicolon = string.byte(";"),
	Slash = string.byte("/"),
	Backslash = string.byte("\\"),
	Split = string.byte("|")
}
_M.ActionResumeType = {
	BT_ResumeSelf = 2,
	BT_NextNode = 1,
	BT_None = 0,
	BT_ResumeTree = 3
}
_M.AIBtLife = {
	BT_Running = 2,
	BT_Init = 1,
	BT_None = 0,
	BT_Pause = 3
}
_M.AIControllerType = {
	LOCAL = 1,
	INVALID = 0,
	REMOTE = 2
}
_M.ParamAdapterNewType = {
	Compute = 7,
	Compare = 6,
	Field = 4,
	SelfMethod__OnResumeAndPause = 3,
	SelfMethod__resetState = 2,
	SelfMethod = 1
}
_M.Entity2Agent = {
	ClientDungeonBotPlayer = "BotPlayerAgent",
	ClientPvpBotPlayer = "BotPlayerAgent",
	ClientPet = "PetAgent",
	ClientPuppet = "PuppetAgent",
	BotPet = "PetAgent",
	DungeonBotPlayer = "BotPlayerAgent",
	PvpBotPlayer = "BotPlayerAgent",
	ClientCarryPet = "PuppetAgent",
	ClientHomePet = "PuppetAgent",
	ServerPuppet = "PuppetAgent"
}
_M.BEHAVIAC_LOCAL_TASK_PARAM_PRE = "_$local_task_param_$_"

return _M
