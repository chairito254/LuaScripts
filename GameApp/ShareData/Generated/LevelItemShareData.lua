-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\ShareData\\Generated\\LevelItemShareData.lua

local LuaCSharpArr = require("Utils.LuaCSharpArr")
local inx2Getter = {
	id = function(t)
		return t[1]
	end,
	state = function(t)
		return t[2]
	end,
	isActive = function(t)
		return t[3]
	end,
	position = function(t)
		return Vector3(t[4], t[5], t[6])
	end,
	rotation = function(t)
		return Vector3(t[7], t[8], t[9])
	end,
	scale = function(t)
		return Vector3(t[10], t[11], t[12])
	end
}
local inx2Setter = {
	id = function(t, v)
		t[1] = v
	end,
	state = function(t, v)
		t[2] = v

		t.shell:OnIndexChange(2)
	end,
	isActive = function(t, v)
		t[3] = v

		t.shell:OnIndexChange(3)
	end,
	position = function(t, v)
		t[4] = v[1]
		t[5] = v[2]
		t[6] = v[3]

		t.shell:OnIndexChange(4)
	end,
	rotation = function(t, v)
		t[7] = v[1]
		t[8] = v[2]
		t[9] = v[3]

		t.shell:OnIndexChange(7)
	end,
	scale = function(t, v)
		t[10] = v[1]
		t[11] = v[2]
		t[12] = v[3]

		t.shell:OnIndexChange(10)
	end
}
local count = 12
local name = "LevelItemShareData"
local meta = {
	__index = function(t, k)
		local getter = inx2Getter[k]

		if not getter then
			return
		end

		return getter(t)
	end,
	__newindex = function(t, k, v)
		local setter = inx2Setter[k]

		if not setter then
			return
		end

		setter(t, v)
	end
}
local shareDataCreator = {
	create = function()
		local t = {}

		for i = 1, count do
			t[i] = 0
		end

		local access = LuaCSharpArr.GetCSharpAccess(t)

		t.shell = ShareDataFactory.CreateShareData(name, access)

		setmetatable(t, meta)

		return t
	end,
	destroy = function(t)
		t.shell:Destroy()

		t.shell = nil

		LuaCSharpArr.DestroyCSharpAccess(t)
	end
}

shareDataCreator.schema = {
	count = 12,
	fields = {
		id = {
			slot = 1,
			kind = "int"
		},
		state = {
			slot = 2,
			kind = "int"
		},
		isActive = {
			slot = 3,
			kind = "bool"
		},
		position = {
			slot = 4,
			kind = "vec3"
		},
		rotation = {
			slot = 7,
			kind = "vec3"
		},
		scale = {
			slot = 10,
			kind = "vec3"
		}
	}
}

return shareDataCreator
