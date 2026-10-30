-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Core\\Framework\\Class.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local next = next
local componentTypeToVtbl = {}

local function isCallable(obj)
	if type(obj) == "function" then
		return true
	elseif type(obj) == "table" then
		local mt = debug.getmetatable(obj)

		return type(mt) == "table" and type(mt.__call) == "function"
	else
		return false
	end
end

local function __buildBotMethodWhitelist(playerCls)
	local wl = {}

	local function collectComponent(comp)
		while comp do
			local cvtbl = componentTypeToVtbl[comp]

			if cvtbl then
				for k, v in pairs(cvtbl) do
					if type(v) == "function" then
						wl[k] = true
					end
				end
			end

			comp = comp.super
		end
	end

	local function collectClass(cls)
		if not cls or not cls.components then
			return
		end

		for _, comp in ipairs(cls.components) do
			collectComponent(comp)
		end
	end

	while playerCls do
		collectClass(playerCls)

		playerCls = playerCls.superType
	end

	return wl
end

local __ClassTypeList = {}
local __LiteClassList = {}
local __InheritRelationship = {}
local __superProxyParentKey = {}
local __superProxyStrictKey = {}

local function __superProxyIndex(proxy, key)
	local superType = rawget(proxy, __superProxyParentKey)
	local superVtbl = superType and __ClassTypeList[superType]
	local func = superVtbl and superVtbl[key]

	if isCallable(func) then
		rawset(proxy, key, func)

		return func
	end

	if rawget(proxy, __superProxyStrictKey) then
		error("Accessing super class field are not allowed!")
	end
end

local __superProxyMetatable = {
	__index = __superProxyIndex
}

local function __newSuperProxy(superType, strict)
	local proxy = {
		[__superProxyParentKey] = superType
	}

	if strict then
		proxy[__superProxyStrictKey] = true
	end

	return setmetatable(proxy, __superProxyMetatable)
end

local function __setClassSuperMeta(classType)
	local superType = classType.superType

	if superType then
		classType.super = __newSuperProxy(superType, rawget(classType, "__IsOldLightClass") == true)
	end
end

local Class = {}

Class.enableInstanceProfile = false

local __defaultMethods = {
	destroy = false,
	preDestroy = false,
	postInit = false,
	init = false,
	preInit = false,
	ctor = false,
	start = false
}
local __shareableEmptyLifecycleMethods = {
	destroy = true,
	preDestroy = true,
	postInit = true,
	init = true,
	preInit = true,
	ctor = true
}

local function __emptyClassMethod()
	return
end

local __nilClassMethod = {}

local function __allowClassAttrRepeat(cls, key)
	local keys = cls.__forceAttrRepeat

	if keys == EMPTY_TABLE then
		keys = {}
		cls.__forceAttrRepeat = keys
	end

	keys[key] = true
end

local function __clearClassAttrRepeat(cls)
	cls.__forceAttrRepeat = EMPTY_TABLE
end

local function __defaultComponentMethod(...)
	return true
end

local __componentLifecycleListKeys = {}

for name in pairs(__defaultMethods) do
	__componentLifecycleListKeys[name] = {}
end

local function __appendComponentLifecycleMethods(classType, component)
	local method2Components = classType.method2Components

	for name, listKey in pairs(__componentLifecycleListKeys) do
		local method = component[name]

		if method ~= __defaultComponentMethod and type(method) == "function" then
			local list = method2Components[listKey]

			if list == nil then
				list = {}
				method2Components[listKey] = list
			end

			list[#list + 1] = method
		end
	end
end

local function __rebuildComponentLifecycleMethods(classType)
	local method2Components = classType.method2Components

	for _, listKey in pairs(__componentLifecycleListKeys) do
		method2Components[listKey] = nil
	end

	local components = classType.components

	for i = 1, #components do
		__appendComponentLifecycleMethods(classType, components[i])
	end
end

local __constructMethods = {
	start = true,
	postInit = true,
	init = true,
	preInit = true,
	ctor = true
}
local __worldxAoiMethods = {
	getOwnClient = true,
	clientMsg = true,
	serverMsg = true,
	getAoiClients = true
}
local reload = false
local ignoreDup = false
local __logger

function Class.setLogger(logger)
	__logger = logger
end

local __traceback = debug.traceback

local function __createDefaultMethodFunc(classType, name, overrideFunc)
	local componentListKey = __componentLifecycleListKeys[name]
	local isConstruct = __constructMethods[name]
	local isStart = name == "start"
	local method2Components = classType.method2Components
	local typeName = classType.typeName
	local superType = classType.superType
	local callFirst = overrideFunc

	if isConstruct then
		if callFirst then
			return function(...)
				callFirst(...)

				local funcs = method2Components[componentListKey]

				if funcs then
					for i = 1, #funcs do
						local ok, err = xpcall(funcs[i], __traceback, ...)

						if not ok and __logger then
							__logger:error(err)
						end
					end
				end

				if isStart then
					local obj = ...

					if obj.className == typeName and obj.__startfinish ~= nil then
						obj.__startfinish = true
					end
				end
			end
		else
			return function(...)
				if superType then
					local sm = superType[name]

					if sm then
						sm(...)
					end
				end

				local funcs = method2Components[componentListKey]

				if funcs then
					for i = 1, #funcs do
						local ok, err = xpcall(funcs[i], __traceback, ...)

						if not ok and __logger then
							__logger:error(err)
						end
					end
				end

				if isStart then
					local obj = ...

					if obj.className == typeName and obj.__startfinish ~= nil then
						obj.__startfinish = true
					end
				end
			end
		end
	elseif callFirst then
		return function(...)
			local funcs = method2Components[componentListKey]

			if funcs then
				for i = #funcs, 1, -1 do
					local ok, err = xpcall(funcs[i], __traceback, ...)

					if not ok and __logger then
						__logger:error(err)
					end
				end
			end

			callFirst(...)
		end
	else
		return function(...)
			local funcs = method2Components[componentListKey]

			if funcs then
				for i = #funcs, 1, -1 do
					local ok, err = xpcall(funcs[i], __traceback, ...)

					if not ok and __logger then
						__logger:error(err)
					end
				end
			end

			if superType then
				local sm = superType[name]

				if sm then
					sm(...)
				end
			end
		end
	end
end

function Class.createSingletonClass(cls, ...)
	if cls._instance == nil then
		cls._instance = cls.new(...)
	end

	return cls._instance
end

function Class.setReload(flag, skipOnReload)
	if flag == true then
		reload = flag

		if not skipOnReload then
			Class.BeforeReload()
		end
	else
		if not skipOnReload then
			Class.OnReload()
		end

		reload = flag
	end
end

local TypeNames = {}

local function __isNormalClass(classType)
	return classType ~= nil and rawget(classType, "__IsClass") == true and rawget(classType, "__IsOldLightClass") ~= true
end

local function __findInheritedVtblValue(classType, key)
	local superType = classType.superType

	if superType == nil then
		return nil
	end

	local superVtbl = __ClassTypeList[superType]

	return superVtbl and rawget(superVtbl, key)
end

local function __sameVtblValue(left, right)
	if rawequal(left, right) then
		return true
	end

	return type(left) == "number" and left ~= left and type(right) == "number" and right ~= right
end

local function __isOwnVtblKeyByValue(classType, key)
	local vtbl = __ClassTypeList[classType]
	local value = vtbl and rawget(vtbl, key)

	if value == nil then
		return false
	end

	if classType.superType == nil then
		return true
	end

	return not __sameVtblValue(value, __findInheritedVtblValue(classType, key))
end

local function __isOwnVtblKey(classType, key)
	return __isOwnVtblKeyByValue(classType, key)
end

local function __clearInheritedVtbl(classType)
	local vtbl = __ClassTypeList[classType]

	if vtbl ~= nil then
		for key in next, vtbl do
			if not __isOwnVtblKey(classType, key) then
				rawset(vtbl, key, nil)
			end
		end
	end
end

local function __rebuildInheritedVtbl(classType, inheritedAlreadyCleared)
	if not inheritedAlreadyCleared then
		__clearInheritedVtbl(classType)
	end

	local vtbl = __ClassTypeList[classType]
	local superType = classType.superType

	if vtbl == nil or superType == nil then
		return
	end

	local superVtbl = __ClassTypeList[superType]

	if superVtbl ~= nil then
		for key, value in next, superVtbl do
			if rawget(vtbl, key) == nil then
				rawset(vtbl, key, value)
			end
		end
	end
end

local function __propagateInheritedVtblValue(classType, key, oldValue, newValue)
	local children = __InheritRelationship[classType]

	if children == nil then
		return
	end

	for i = 1, #children do
		local child = children[i]
		local childVtbl = __ClassTypeList[child]

		if childVtbl ~= nil then
			local superProxy = rawget(child, "super")

			if superProxy ~= nil then
				rawset(superProxy, key, nil)
			end

			if __isNormalClass(child) then
				if __sameVtblValue(rawget(childVtbl, key), oldValue) then
					rawset(childVtbl, key, newValue)
					__propagateInheritedVtblValue(child, key, oldValue, newValue)
				end
			else
				local inheritedKeys = child.superCachedKeys
				local rawValue = rawget(childVtbl, key)
				local isOwnValue = rawValue ~= nil and not inheritedKeys[key]

				if not isOwnValue then
					rawset(childVtbl, key, nil)

					inheritedKeys[key] = nil
					child.superNilKeys[key] = nil

					__propagateInheritedVtblValue(child, key, oldValue, newValue)
				end
			end
		end
	end
end

local function __setOwnVtblValue(classType, vtbl, key, value)
	local oldEffectiveValue = rawget(vtbl, key)

	rawset(vtbl, key, value)

	local effectiveValue = value

	if effectiveValue == nil and not reload then
		effectiveValue = __findInheritedVtblValue(classType, key)

		if effectiveValue ~= nil then
			rawset(vtbl, key, effectiveValue)
		end
	end

	if not reload then
		__propagateInheritedVtblValue(classType, key, oldEffectiveValue, effectiveValue)
	end
end

local function __refreshClassLifecycleMethod(classType, name)
	local vtbl = __ClassTypeList[classType]
	local ownMethod = rawget(vtbl, "_" .. name)
	local hasOwnMethod = ownMethod ~= nil and ownMethod ~= false and ownMethod ~= __emptyClassMethod and ownMethod ~= __nilClassMethod
	local hasComponentMethod = classType.method2Components[__componentLifecycleListKeys[name]] ~= nil
	local method

	if hasOwnMethod or hasComponentMethod then
		method = __createDefaultMethodFunc(classType, name, hasOwnMethod and ownMethod or nil)
	elseif classType.superType == nil then
		method = __emptyClassMethod
	end

	__setOwnVtblValue(classType, vtbl, name, method)
end

local function __getNormalClassesByDepth()
	local classes = {}

	for _, classType in pairs(TypeNames) do
		if __isNormalClass(classType) then
			classes[#classes + 1] = classType
		end
	end

	table.sort(classes, function(left, right)
		return (left._inheritsCount or 0) < (right._inheritsCount or 0)
	end)

	return classes
end

local function __clearAllInheritedVtbl(classes)
	classes = classes or __getNormalClassesByDepth()

	for i = #classes, 1, -1 do
		__clearInheritedVtbl(classes[i])
	end
end

local function __rebuildAllInheritedVtbl(inheritedAlreadyCleared)
	local classes = __getNormalClassesByDepth()

	if not inheritedAlreadyCleared then
		__clearAllInheritedVtbl(classes)
	end

	for i = 1, #classes do
		__rebuildInheritedVtbl(classes[i], true)
	end
end

local function __clearFlatPostMethodCacheTree(classType)
	local cache = rawget(classType, "__flatPostMethodCache")

	if cache ~= nil then
		for k in pairs(cache) do
			cache[k] = nil
		end
	end

	local children = __InheritRelationship[classType]

	if children ~= nil then
		for i = 1, #children do
			__clearFlatPostMethodCacheTree(children[i])
		end
	end
end

local function __normalClassNewIndex(classType, key, value)
	local vtbl = __ClassTypeList[classType]

	if __defaultMethods[key] ~= nil then
		if not __isOwnVtblKey(classType, key) or reload or ignoreDup or rawget(vtbl, "_" .. key) == __emptyClassMethod then
			__setOwnVtblValue(classType, vtbl, key, __createDefaultMethodFunc(classType, key, value))
			rawset(vtbl, "_" .. key, value == nil and __nilClassMethod or value)
		else
			error("class " .. classType.typeName .. " has repeat attr " .. key)
		end
	elseif not __isOwnVtblKey(classType, key) or reload or ignoreDup or classType.__forceAttrRepeat[key] or __worldxAoiMethods[key] then
		__setOwnVtblValue(classType, vtbl, key, value)
	else
		error("class " .. classType.typeName .. " has repeat attr " .. key)
	end
end

local function __normalClassCall(classType, ...)
	if classType._IsSingleton == true then
		return Class.createSingletonClass(classType, ...)
	end

	return classType.new(...)
end

local function __getObjectClassFunction(obj, funcName)
	local objMetatable = getmetatable(obj)
	local vtbl = objMetatable.__index

	if type(vtbl) ~= "table" then
		vtbl = objMetatable.__vtbl
	end

	return vtbl[funcName]
end

local isEditor = rawget(_G, "UNITY_EDITOR")

function Class.Class(typeName, superType, isSingleton, isBotPlayer, playerClassName)
	if isEditor and type(superType) == "table" and rawget(superType, "__IsOldLightClass") == true then
		error("Class.Class cannot inherit from OldLightClass: " .. typeName)
	end

	local classType = {
		__IsClass = true
	}

	classType.typeName = typeName

	if TypeNames[typeName] ~= nil then
		error("The class name is used already!!!" .. typeName)
	else
		TypeNames[typeName] = classType
	end

	classType._IsSingleton = isSingleton or false
	classType.__forceAttrRepeat = EMPTY_TABLE
	classType.components = EMPTY_TABLE
	classType.componentNames = EMPTY_TABLE
	classType.method2Components = {}
	classType.__flatPostMethodCache = EMPTY_TABLE
	classType.__Name2PropertyDeclare__ = {}
	classType.__ValueTypeDeclare__ = nil
	classType.__PropertyCallbacks__ = {}
	classType.__TickInterval__ = nil
	classType.superType = superType
	classType._inheritsCount = superType and superType._inheritsCount + 1 or 0

	if superType then
		if __InheritRelationship[superType] == nil then
			__InheritRelationship[superType] = {}
		end

		table.insert(__InheritRelationship[superType], classType)
	else
		__InheritRelationship[classType] = {}
	end

	local function objToString(self)
		if not self then
			return typeName
		end

		if not self.__instanceName then
			local str = tostring(self)
			local _, _, addr = string.find(str, "table%s*:%s*(0?[xX]?%x+)")

			self.__instanceName = string.format("Class %s : %s", typeName, addr)
		end

		return self.__instanceName
	end

	local function objGetClass(self)
		return classType
	end

	local function objGetType(self)
		return typeName
	end

	local vtbl = {}

	__ClassTypeList[classType] = vtbl
	classType.__objMetatable = {
		__index = vtbl
	}

	if isBotPlayer then
		classType.__botWhitelist = false
		classType.__botStubCache = {}
		classType.__botReportedSet = {}
		classType.__objMetatable.__vtbl = vtbl

		function classType.__objMetatable.__index(obj, key)
			local v = vtbl[key]

			if v ~= nil then
				return v
			end

			local whitelist = classType.__botWhitelist

			if not whitelist then
				whitelist = __buildBotMethodWhitelist(require(playerClassName))
				classType.__botWhitelist = whitelist
			end

			if not whitelist[key] then
				return nil
			end

			local stubCache = classType.__botStubCache
			local stub = stubCache[key]

			if not stub then
				function stub(self, ...)
					local reportedSet = classType.__botReportedSet

					if not reportedSet[key] then
						reportedSet[key] = true

						local log = self and self.logger

						if log then
							log:debug("[BotCompat] %s called unimplemented method '%s'", self.className or typeName, key)
						end
					end
				end

				stubCache[key] = stub
			end

			return stub
		end
	end

	vtbl.toString = objToString
	vtbl.getClass = objGetClass
	vtbl.getClassType = objGetType
	vtbl._getClassFunc = __getObjectClassFunction
	vtbl.className = typeName

	local objMetatable = classType.__objMetatable

	function classType.new(...)
		local obj = {
			__IsInstance = true
		}

		setmetatable(obj, objMetatable)

		local ctor = vtbl.ctor

		if ctor then
			ctor(obj, ...)
		end

		return obj
	end

	if classType._IsSingleton then
		function classType.GetInstance(...)
			return Class.createSingletonClass(classType, ...)
		end
	end

	__setClassSuperMeta(classType)

	function vtbl.getVtbl()
		return vtbl
	end

	local flatCache = classType.__flatPostMethodCache
	local method2Components = classType.method2Components

	function vtbl.postComponentMethod(obj, name, ...)
		local flat = flatCache[name]

		if flat == nil then
			if flatCache == EMPTY_TABLE then
				flatCache = {}

				rawset(classType, "__flatPostMethodCache", flatCache)
			end

			flat = {}

			local own = method2Components[name]

			if own then
				for i = 1, #own do
					flat[#flat + 1] = own[i][name]
				end
			end

			local inheritedClass = superType

			while inheritedClass do
				local supList = inheritedClass.method2Components[name]

				if supList then
					for i = 1, #supList do
						flat[#flat + 1] = supList[i][name]
					end
				end

				inheritedClass = inheritedClass.superType
			end

			flatCache[name] = flat
		end

		if name == "tick" then
			for i = 1, #flat do
				flat[i](obj, ...)
			end

			return
		end

		for i = 1, #flat do
			local result, errorMsg = xpcall(flat[i], __traceback, obj, ...)

			if not result and __logger then
				__logger:error(errorMsg)
			end
		end
	end

	for k, v in pairs(__defaultMethods) do
		if __shareableEmptyLifecycleMethods[k] then
			if superType == nil then
				rawset(vtbl, k, __emptyClassMethod)
			end
		else
			__setOwnVtblValue(classType, vtbl, k, __createDefaultMethodFunc(classType, k, nil))
		end

		rawset(vtbl, "_" .. k, __emptyClassMethod)
	end

	vtbl.forceAttrRepeat = __allowClassAttrRepeat
	vtbl.clearAttrRepeat = __clearClassAttrRepeat

	setmetatable(classType, {
		__index = vtbl,
		__newindex = __normalClassNewIndex,
		__call = __normalClassCall
	})
	__rebuildInheritedVtbl(classType, true)

	return classType
end

function Class.OldLightClass(typeName, superType, isSingleton)
	if isEditor and type(superType) == "table" and rawget(superType, "__IsClass") == true and rawget(superType, "__IsOldLightClass") ~= true then
		error("OldLightClass can only inherit from OldLightClass: " .. typeName)
	end

	local classType = {
		__IsOldLightClass = true,
		__IsClass = true
	}

	classType.typeName = typeName
	classType._IsSingleton = isSingleton or false

	if TypeNames[typeName] ~= nil then
		error("The class name is used already!!!" .. typeName)
	else
		TypeNames[typeName] = classType
	end

	classType.__forceAttrRepeat = EMPTY_TABLE
	classType.superType = superType
	classType.superCachedKeys = {}
	classType.superNilKeys = {}
	classType._inheritsCount = superType and superType._inheritsCount + 1 or 0

	if superType then
		if __InheritRelationship[superType] == nil then
			__InheritRelationship[superType] = {}
		end

		table.insert(__InheritRelationship[superType], classType)
	else
		__InheritRelationship[classType] = {}
	end

	local function objToString(self)
		if not self then
			return typeName
		end

		if not self.__instanceName then
			local str = tostring(self)
			local _, _, addr = string.find(str, "table%s*:%s*(0?[xX]?%x+)")

			self.__instanceName = string.format("LightClass %s : %s", typeName, addr)
		end

		return self.__instanceName
	end

	local function objGetClass(self)
		return classType
	end

	local function objGetType(self)
		return typeName
	end

	local vtbl = {}

	__ClassTypeList[classType] = vtbl
	classType.__objMetatable = {
		__index = vtbl
	}
	vtbl.toString = objToString
	vtbl.getClass = objGetClass
	vtbl.getClassType = objGetType
	vtbl.className = typeName

	local objMetatable = classType.__objMetatable

	function classType.new(...)
		local obj = {
			__IsInstance = true
		}

		setmetatable(obj, objMetatable)

		local ctor = vtbl.ctor

		if ctor then
			ctor(obj, ...)
		end

		return obj
	end

	if classType._IsSingleton then
		function classType.GetInstance(...)
			return Class.createSingletonClass(classType, ...)
		end
	end

	__setClassSuperMeta(classType)
	setmetatable(classType, {
		__index = vtbl,
		__newindex = function(tbl, key, value)
			if rawget(vtbl, key) == nil or reload or ignoreDup or classType.__forceAttrRepeat[key] then
				local oldEffectiveValue = classType[key]

				rawset(vtbl, key, value)

				classType.superCachedKeys[key] = nil
				classType.superNilKeys[key] = nil

				if not reload then
					local effectiveValue = value

					if effectiveValue == nil and superType ~= nil then
						effectiveValue = superType[key]
					end

					__propagateInheritedVtblValue(classType, key, oldEffectiveValue, effectiveValue)
				end
			else
				error("class " .. classType.typeName .. " has repeat attr " .. key)
			end
		end,
		__call = function(self, ...)
			if classType._IsSingleton == true then
				return Class.createSingletonClass(classType, ...)
			else
				return classType.new(...)
			end
		end
	})

	function classType.getVtbl()
		return vtbl
	end

	classType.forceAttrRepeat = __allowClassAttrRepeat
	classType.clearAttrRepeat = __clearClassAttrRepeat

	if superType then
		setmetatable(vtbl, {
			__index = function(tbl, key)
				if classType.superNilKeys[key] then
					return nil
				end

				local ret = __ClassTypeList[superType][key]

				if ret == nil and key ~= nil then
					classType.superNilKeys[key] = true
				elseif isCallable(ret) then
					classType.superCachedKeys[key] = true
					vtbl[key] = ret
				end

				return ret
			end
		})
	end

	return classType
end

local function __liteClassCall(classType, ...)
	return classType.new(...)
end

local __liteRootClassMetatable = {
	__call = __liteClassCall
}

function Class.LiteClass(typeName, superType)
	local cls = {
		__IsLiteClass = true,
		__IsClass = true
	}

	cls.typeName = typeName
	cls.className = typeName
	cls.__index = cls
	cls.super = superType
	cls.__superCachedKeys = {}

	function cls:getClass()
		return cls
	end

	function cls.new(...)
		local instance = {}

		setmetatable(instance, cls)

		local ctor = cls.ctor

		if ctor then
			ctor(instance, ...)
		end

		return instance
	end

	if superType then
		setmetatable(cls, {
			__index = function(classType, key)
				local value = superType[key]

				if value ~= nil then
					rawset(classType, key, value)

					cls.__superCachedKeys[key] = true
				end

				return value
			end,
			__call = __liteClassCall
		})
	else
		setmetatable(cls, __liteRootClassMetatable)
	end

	local function objGetType(self)
		return typeName
	end

	cls.getClassType = objGetType
	__LiteClassList[typeName] = cls

	return cls
end

Class.LightClass = Class.LiteClass

function Class.isSubClassOf(cls, otherCls)
	if type(cls) ~= "table" or type(otherCls) ~= "table" then
		return false
	end

	if not cls.__IsClass or not otherCls.__IsClass then
		return false
	end

	local superType = cls.superType

	while superType ~= nil do
		if superType == otherCls then
			return true
		end

		superType = superType.superType
	end
end

local function __isSubClassOfUnchecked(classType, otherClass)
	local superType = classType.superType

	while superType ~= nil do
		if superType == otherClass then
			return true
		end

		superType = superType.superType
	end
end

function Class.isInstanceOf(obj, cls)
	if type(obj) ~= "table" or type(cls) ~= "table" then
		return false
	end

	if not obj.__IsInstance or not cls.__IsClass then
		return false
	end

	local objClass = obj:getClass()

	return objClass ~= nil and (cls == objClass or __isSubClassOfUnchecked(objClass, cls))
end

local __ComponentRelationship = {}
local ComponentNames = {}

local function __propagateComponentLifecycleMethod(component, name, affectedComponents)
	local children = __ComponentRelationship[component]

	if children == nil then
		return
	end

	local componentVtbl = componentTypeToVtbl[component]
	local inheritedValue = componentVtbl and rawget(componentVtbl, name)
	local canInherit = inheritedValue ~= __defaultComponentMethod and type(inheritedValue) == "function"

	for i = 1, #children do
		local child = children[i]
		local childVtbl = componentTypeToVtbl[child]
		local inheritedMarker = rawget(child.superDefaultKeys, name)
		local childValue = childVtbl and rawget(childVtbl, name)

		if inheritedMarker == true or inheritedMarker == nil and childValue == __defaultComponentMethod then
			if canInherit then
				rawset(childVtbl, name, inheritedValue)
				rawset(child.superDefaultKeys, name, true)
			else
				rawset(childVtbl, name, __defaultComponentMethod)
				rawset(child.superDefaultKeys, name, nil)
			end

			affectedComponents[child.typeName] = true

			__propagateComponentLifecycleMethod(child, name, affectedComponents)
		end
	end
end

local function __propagateComponentPostMethod(component, name, value, affectedComponents)
	local children = __ComponentRelationship[component]

	if children == nil then
		return
	end

	for i = 1, #children do
		local child = children[i]
		local childVtbl = componentTypeToVtbl[child]

		if rawget(child.superPostKeys, name) == true or rawget(childVtbl, name) == nil then
			rawset(childVtbl, name, value)
			rawset(child.superPostKeys, name, true)
			rawset(child.__Name2ComponentMethod__, name, true)

			affectedComponents[child.typeName] = true

			__propagateComponentPostMethod(child, name, value, affectedComponents)
		end
	end
end

local function __findInheritedComponentPostMethod(component, name)
	local superType = component.super
	local hasInheritedMethod = false

	while superType ~= nil do
		if superType.__Name2ComponentMethod__[name] ~= nil then
			hasInheritedMethod = true

			local value = superType[name]

			if value ~= nil then
				return value, true
			end
		end

		superType = superType.super
	end

	return nil, hasInheritedMethod
end

local function __refreshClassesUsingComponents(affectedComponents, rebuildLifecycle)
	for _, cls in pairs(TypeNames) do
		if __isNormalClass(cls) then
			for componentName in pairs(affectedComponents) do
				if cls.componentNames[componentName] then
					if rebuildLifecycle then
						__rebuildComponentLifecycleMethods(cls)

						for name in pairs(__shareableEmptyLifecycleMethods) do
							__refreshClassLifecycleMethod(cls, name)
						end
					end

					__clearFlatPostMethodCacheTree(cls)

					break
				end
			end
		end
	end
end

function Class.Component(typeName, superType)
	local componentType = {}

	componentType.__IsComponent = true
	componentType.typeName = typeName
	componentType.__Name2PropertyDeclare__ = {}
	componentType.__Name2ComponentMethod__ = {}
	componentType.__IsParseReady = false
	componentType.__PropertyCallbacks__ = {}
	componentType.__forceAttrRepeat = EMPTY_TABLE
	componentType.forceAttrRepeat = __allowClassAttrRepeat
	componentType.clearAttrRepeat = __clearClassAttrRepeat

	if ComponentNames[typeName] ~= nil then
		error("The component name is used already!!!" .. typeName)
	else
		ComponentNames[typeName] = componentType
	end

	componentType.super = nil

	if superType ~= nil then
		if not superType.__IsComponent then
			error("The superType must be a component ")
		end

		componentType.super = superType
	end

	componentType.superPostKeys = {}
	componentType.superDefaultKeys = {}

	if superType ~= nil then
		local children = __ComponentRelationship[superType]

		if children == nil then
			children = {}
			__ComponentRelationship[superType] = children
		end

		children[#children + 1] = componentType
	end

	local vtbl = {}

	componentTypeToVtbl[componentType] = vtbl

	setmetatable(componentType, {
		__index = vtbl,
		__newindex = function(tbl, key, value)
			local oldValue = rawget(vtbl, key)

			if rawget(vtbl, key) ~= nil and not reload and not ignoreDup and __defaultMethods[key] == nil and componentType.__forceAttrRepeat[key] == nil then
				error("component " .. typeName .. " has repeat attr " .. key)
			else
				rawset(vtbl, key, value)

				if __defaultMethods[key] ~= nil then
					rawset(componentType.superDefaultKeys, key, false)

					if componentType.__IsParseReady and not reload and oldValue ~= value then
						local affectedComponents = {
							[typeName] = true
						}

						__propagateComponentLifecycleMethod(componentType, key, affectedComponents)
						__refreshClassesUsingComponents(affectedComponents, true)
					end
				elseif componentType.__Name2ComponentMethod__[key] ~= nil and not reload then
					rawset(componentType.superPostKeys, key, nil)

					local effectiveValue = value

					if effectiveValue == nil then
						local inheritedValue, hasInheritedMethod = __findInheritedComponentPostMethod(componentType, key)

						if hasInheritedMethod then
							effectiveValue = inheritedValue

							rawset(vtbl, key, inheritedValue)
							rawset(componentType.superPostKeys, key, true)
						end
					end

					if componentType.__IsParseReady and oldValue ~= value then
						local affectedComponents = {
							[typeName] = true
						}

						__propagateComponentPostMethod(componentType, key, effectiveValue, affectedComponents)
						__refreshClassesUsingComponents(affectedComponents, false)
					end
				end
			end
		end
	})

	for k, v in pairs(__defaultMethods) do
		if rawget(vtbl, k) == nil then
			rawset(vtbl, k, __defaultComponentMethod)
		end
	end

	return componentType
end

local function _addComponentAttr(cls, component)
	local applyType = component.super

	while applyType ~= nil do
		for name, _ in pairs(applyType.__Name2ComponentMethod__) do
			local superFunc = applyType[name]

			if component[name] == nil then
				component[name] = superFunc
				component.superPostKeys[name] = true
				component.__Name2ComponentMethod__[name] = true
			end
		end

		applyType = applyType.super
	end

	local applyAttrs = {}

	applyType = component

	while applyType ~= nil do
		local realTable = componentTypeToVtbl[applyType]

		for name, attr in pairs(realTable) do
			if name ~= "__CLASS_NAME__" and applyType.__Name2ComponentMethod__[name] == nil and __defaultMethods[name] == nil then
				if not isCallable(attr) then
					error(string.format("[ERROR] The component attr %s can not be called", name))
				end

				if applyAttrs[name] == nil then
					applyAttrs[name] = attr
				end
			end
		end

		applyType = applyType.super
	end

	for name, attr in pairs(applyAttrs) do
		if cls[name] == nil or reload or ignoreDup or __worldxAoiMethods[name] then
			cls[name] = attr
		else
			error(string.format("[WARNING] The attribute name %s is already in the Class %s! or super", name, cls.toString(cls)))
		end
	end

	local componentVtbl = componentTypeToVtbl[component]

	applyType = component.super

	while applyType ~= nil do
		for name, _ in pairs(__defaultMethods) do
			local superDefaultFunc = applyType[name]

			if superDefaultFunc ~= __defaultComponentMethod and type(superDefaultFunc) == "function" and rawget(component.superDefaultKeys, name) ~= false and rawget(componentVtbl, name) == __defaultComponentMethod then
				rawset(component.superDefaultKeys, name, true)
				rawset(componentVtbl, name, superDefaultFunc)
			end
		end

		applyType = applyType.super
	end
end

local function _addComponentPropertyCallbacks(cls, component)
	for opType, callbacks in pairs(component.__PropertyCallbacks__) do
		if cls.__PropertyCallbacks__[opType] == nil then
			cls.__PropertyCallbacks__[opType] = {}
		end

		for keyPath, callback in pairs(callbacks) do
			if cls.__PropertyCallbacks__[opType][keyPath] ~= nil and not reload and not ignoreDup then
				error(string.format("[WARNING] The propertyCallback %s is already in the Class %s!", keyPath, cls.toString(cls)))
			else
				cls.__PropertyCallbacks__[opType][keyPath] = callback
			end
		end
	end
end

local function _addComponentProperties(cls, component)
	for name, declare in pairs(component.__Name2PropertyDeclare__) do
		if cls.__Name2PropertyDeclare__[name] ~= nil and not reload and not ignoreDup then
			error(string.format("[WARNING] The property %s is already in the Class %s!", name, cls.toString(cls)))
		else
			cls.__Name2PropertyDeclare__[name] = declare
		end
	end
end

local function _addComponent(cls, component)
	assert(component.__IsComponent, "must be a component")
	assert(component.typeName ~= nil, "component must have a name")
	assert(ComponentNames[component.typeName] ~= nil, "component must register")
	assert(cls.__IsClass and not cls.__IsOldLightClass, "only class can add component")
	assert(cls.componentNames[component.typeName] == nil, "class already has same component " .. component.typeName)
	assert(component.__IsParseReady, "component " .. component.typeName .. " must be ready to add")

	local components = cls.components

	if components == EMPTY_TABLE then
		components = {}
		cls.components = components
		cls.componentNames = {}
	end

	cls.componentNames[component.typeName] = true
	components[#components + 1] = component

	_addComponentProperties(cls, component)
	_addComponentPropertyCallbacks(cls, component)
	_addComponentAttr(cls, component)
	__appendComponentLifecycleMethods(cls, component)

	for name in pairs(__shareableEmptyLifecycleMethods) do
		if cls.method2Components[__componentLifecycleListKeys[name]] ~= nil then
			__refreshClassLifecycleMethod(cls, name)
		end
	end

	for name, _ in pairs(component.__Name2ComponentMethod__) do
		if cls.method2Components[name] == nil then
			cls.method2Components[name] = {}
		end

		table.insert(cls.method2Components[name], component)
	end
end

function Class.AddComponents(cls, components, ignoreDupCheck)
	if ignoreDupCheck then
		ignoreDup = true
	end

	local componentCount = #components

	if componentCount > 0 then
		__clearFlatPostMethodCacheTree(cls)
	end

	for i = 1, componentCount do
		local component = components[i]

		_addComponent(cls, component)
	end

	if ignoreDupCheck then
		ignoreDup = false
	end
end

function Class.AddComponent(cls, ...)
	local n = select("#", ...)

	if n > 0 then
		__clearFlatPostMethodCacheTree(cls)
	end

	for i = 1, n do
		local v = select(i, ...)

		_addComponent(cls, v)
	end
end

function Class.BeforeReload()
	for _, cls in pairs(TypeNames) do
		__setClassSuperMeta(cls)
	end

	__clearAllInheritedVtbl()

	for _, cls in pairs(TypeNames) do
		if not __isNormalClass(cls) then
			for k in pairs(cls.superCachedKeys) do
				cls[k] = nil
			end

			cls.superCachedKeys = {}
			cls.superNilKeys = {}
		end

		local cache = cls.__flatPostMethodCache

		if cache then
			for k in pairs(cache) do
				cache[k] = nil
			end
		end

		if cls.__botStubCache then
			cls.__botWhitelist = false
			cls.__botStubCache = {}
			cls.__botReportedSet = {}
		end
	end

	for _, cls in pairs(__LiteClassList) do
		for k, _ in pairs(cls.__superCachedKeys) do
			cls[k] = nil
		end

		cls.__superCachedKeys = {}
	end

	for _, component in pairs(ComponentNames) do
		for k, _ in pairs(component.superPostKeys) do
			component[k] = nil
		end

		component.superPostKeys = {}

		local ownDefaultKeys = {}
		local componentVtbl = componentTypeToVtbl[component]

		for k, inherited in pairs(component.superDefaultKeys) do
			if inherited then
				rawset(componentVtbl, k, __defaultComponentMethod)
			else
				ownDefaultKeys[k] = false
			end
		end

		component.superDefaultKeys = ownDefaultKeys
	end
end

function Class.OnReload()
	for name, cls in pairs(TypeNames) do
		if not cls.__IsOldLightClass then
			for _, component in ipairs(cls.components) do
				_addComponentAttr(cls, component)
			end

			__rebuildComponentLifecycleMethods(cls)

			if #cls.components > 0 then
				local vtbl = __ClassTypeList[cls]

				for lifecycleName in pairs(__shareableEmptyLifecycleMethods) do
					local ownMethod = rawget(vtbl, "_" .. lifecycleName)

					if ownMethod == __emptyClassMethod then
						local currentMethod = rawget(vtbl, lifecycleName)
						local hasComponentMethod = cls.method2Components[__componentLifecycleListKeys[lifecycleName]] ~= nil

						if hasComponentMethod and (currentMethod == nil or currentMethod == __emptyClassMethod) or not hasComponentMethod and currentMethod ~= nil and currentMethod ~= __emptyClassMethod then
							__refreshClassLifecycleMethod(cls, lifecycleName)
						end
					end
				end
			end
		end
	end

	__rebuildAllInheritedVtbl(true)
end

function Class.profileInstanceCount()
	return {}
end

function Class.profileInheritedVtbl(forceCollect)
	if forceCollect then
		collectgarbage("collect")
		collectgarbage("collect")
	end

	local luaHeapBytesBeforeProfile = collectgarbage("count") * 1024
	local ret = {
		inheritedEntryCount = 0,
		ownEntryCount = 0,
		rawEntryCount = 0,
		classCount = 0,
		luaHeapBytesBeforeProfile = luaHeapBytesBeforeProfile,
		inheritedValueTypes = {},
		classes = {}
	}

	for typeName, classType in pairs(TypeNames) do
		if __isNormalClass(classType) then
			local rawEntryCount = 0
			local ownEntryCount = 0
			local inheritedEntryCount = 0
			local vtbl = __ClassTypeList[classType]

			for key, value in next, vtbl do
				rawEntryCount = rawEntryCount + 1

				if __isOwnVtblKey(classType, key) then
					ownEntryCount = ownEntryCount + 1
				else
					inheritedEntryCount = inheritedEntryCount + 1

					local valueType = type(value)

					ret.inheritedValueTypes[valueType] = (ret.inheritedValueTypes[valueType] or 0) + 1
				end
			end

			ret.classCount = ret.classCount + 1
			ret.rawEntryCount = ret.rawEntryCount + rawEntryCount
			ret.ownEntryCount = ret.ownEntryCount + ownEntryCount
			ret.inheritedEntryCount = ret.inheritedEntryCount + inheritedEntryCount
			ret.classes[#ret.classes + 1] = {
				typeName = typeName,
				rawEntries = rawEntryCount,
				ownEntries = ownEntryCount,
				inheritedEntries = inheritedEntryCount
			}
		end
	end

	table.sort(ret.classes, function(left, right)
		if left.inheritedEntries ~= right.inheritedEntries then
			return left.inheritedEntries > right.inheritedEntries
		end

		return left.typeName < right.typeName
	end)

	return ret
end

return Class
