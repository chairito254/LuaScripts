-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Core\\Common\\Sha256.lua

local bit = bit or require("bit")
local Sha256 = {}
local K = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298
}

local function unsigned32(value)
	value = bit.tobit(value)

	return value < 0 and value + 4294967296 or value
end

local function rotateRight(value, count)
	return bit.bor(bit.rshift(value, count), bit.lshift(value, 32 - count))
end

local function toHex(value)
	return (value:gsub(".", function(char)
		return string.format("%02x", string.byte(char))
	end))
end

local function digest(value)
	local bitLength = #value * 8

	value = value .. string.char(128)
	value = value .. string.rep("\x00", (56 - #value % 64) % 64)

	local high = math.floor(bitLength / 4294967296)
	local low = bitLength % 4294967296

	value = value .. string.char(bit.band(bit.rshift(high, 24), 255)) .. string.char(bit.band(bit.rshift(high, 16), 255)) .. string.char(bit.band(bit.rshift(high, 8), 255)) .. string.char(bit.band(high, 255)) .. string.char(bit.band(bit.rshift(low, 24), 255)) .. string.char(bit.band(bit.rshift(low, 16), 255)) .. string.char(bit.band(bit.rshift(low, 8), 255)) .. string.char(bit.band(low, 255))

	local h0, h1, h2, h3 = 1779033703, 3144134277, 1013904242, 2773480762
	local h4, h5, h6, h7 = 1359893119, 2600822924, 528734635, 1541459225
	local words = {}

	for offset = 1, #value, 64 do
		for index = 0, 15 do
			local b1, b2, b3, b4 = value:byte(offset + index * 4, offset + index * 4 + 3)

			words[index + 1] = bit.tobit(bit.lshift(b1, 24) + bit.lshift(b2, 16) + bit.lshift(b3, 8) + b4)
		end

		for index = 17, 64 do
			local w15 = words[index - 15]
			local w2 = words[index - 2]
			local s0 = bit.bxor(rotateRight(w15, 7), rotateRight(w15, 18), bit.rshift(w15, 3))
			local s1 = bit.bxor(rotateRight(w2, 17), rotateRight(w2, 19), bit.rshift(w2, 10))

			words[index] = bit.tobit(words[index - 16] + s0 + words[index - 7] + s1)
		end

		local a, b, c, d = h0, h1, h2, h3
		local e, f, g, h = h4, h5, h6, h7

		for index = 1, 64 do
			local s1 = bit.bxor(rotateRight(e, 6), rotateRight(e, 11), rotateRight(e, 25))
			local choose = bit.bxor(bit.band(e, f), bit.band(bit.bnot(e), g))
			local temp1 = bit.tobit(h + s1 + choose + K[index] + words[index])
			local s0 = bit.bxor(rotateRight(a, 2), rotateRight(a, 13), rotateRight(a, 22))
			local majority = bit.bxor(bit.band(a, b), bit.band(a, c), bit.band(b, c))
			local temp2 = bit.tobit(s0 + majority)

			h, g, f = g, f, e
			e = bit.tobit(d + temp1)
			d, c, b = c, b, a
			a = bit.tobit(temp1 + temp2)
		end

		h0, h1, h2, h3 = bit.tobit(h0 + a), bit.tobit(h1 + b), bit.tobit(h2 + c), bit.tobit(h3 + d)
		h4, h5, h6, h7 = bit.tobit(h4 + e), bit.tobit(h5 + f), bit.tobit(h6 + g), bit.tobit(h7 + h)
	end

	local output = {}

	for _, value32 in ipairs({
		h0,
		h1,
		h2,
		h3,
		h4,
		h5,
		h6,
		h7
	}) do
		local unsigned = unsigned32(value32)

		output[#output + 1] = string.char(bit.band(bit.rshift(unsigned, 24), 255))
		output[#output + 1] = string.char(bit.band(bit.rshift(unsigned, 16), 255))
		output[#output + 1] = string.char(bit.band(bit.rshift(unsigned, 8), 255))
		output[#output + 1] = string.char(bit.band(unsigned, 255))
	end

	return table.concat(output)
end

function Sha256.hex(value)
	value = value or ""

	if phonestcore and phonestcore.sha256Hex then
		return string.lower(phonestcore.sha256Hex(value))
	end

	return toHex(digest(value))
end

return Sha256
