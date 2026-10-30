-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\CustomRichTextUtils.lua

local FormulaExplictData = require("Data.formula_explict_data")
local GameStringConfig = require("Data.gamestring_config_data")
local AttributeConst = require("Common.Const.AttributeConst")
local FormulaData = require("Data.formula_data")
local AbilityCalcValData = require("Data.ability_calc_value_data")
local TimelineCalcValData = require("Data.timeline_calc_value_data")
local BuffCalcValueData = require("Data.buff_calc_value_data")
local BuffConfigData = require("Data.buff_config_data")
local CustomRichTextUtils = {}

local function isEmpty(value)
	return value == nil or value == ""
end

function CustomRichTextUtils.create(getLocalizationText, getFormatText, getPetAttributeMap, strict)
	local resolver = {}

	local function trimDecimal(v)
		if type(v) ~= "number" then
			return v
		end

		if v == math.floor(v) then
			return v
		end

		local s = string.format("%.2f", v)

		s = s:gsub("0+$", "")
		s = s:gsub("%.$", "")

		return s
	end

	local function formatValue(value, isPercent, formatStr)
		local needPercent = isPercent ~= nil and isPercent ~= false and isPercent ~= 0 and isPercent ~= ""

		if needPercent then
			value = value * 100
		end

		local result = isEmpty(formatStr) and tostring(trimDecimal(value)) or string.format(formatStr, value)

		if needPercent then
			result = result .. "%"
		end

		return result
	end

	local function buildFormulaExplictFormatArgs(calcData, explictData)
		local formulaByPetCacheProp = calcData.formulaByPetCacheProp
		local baseValue = 0

		for i = 2, 6 do
			if type(formulaByPetCacheProp[i]) == "number" then
				baseValue = formulaByPetCacheProp[i]

				break
			end
		end

		local val1 = formatValue(math.abs(explictData.minNum * baseValue), explictData.isPercent, explictData.formatStr)
		local val2 = tostring(trimDecimal(math.abs(explictData.rate)))
		local val3 = getLocalizationText(explictData.name)
		local val4 = formatValue(math.abs(explictData.upRate * explictData.rate * baseValue), explictData.isPercent2, explictData.formatStr2)
		local val5 = formatValue(math.abs(explictData.maxNum * baseValue), explictData.isPercent3, explictData.formatStr3)
		local iconUrl = explictData.icon
		local val6 = isEmpty(iconUrl) and "" or iconUrl

		return val1, val2, val3, val4, val5, val6
	end

	local function getCalcDataByArgs(tableName, key, paramName, level)
		if tableName == "ability" then
			return AbilityCalcValData[key] and AbilityCalcValData[key][paramName] and AbilityCalcValData[key][paramName][level] and AbilityCalcValData[key][paramName][level]
		elseif tableName == "buff" then
			return BuffCalcValueData[key] and BuffCalcValueData[key][paramName] and BuffCalcValueData[key][paramName][level] and BuffCalcValueData[key][paramName][level]
		elseif tableName == "timeline" then
			return TimelineCalcValData[key] and TimelineCalcValData[key][paramName] and TimelineCalcValData[key][paramName]
		end
	end

	function resolver._getCalcDesc(calcData, format, isDecimal, calcDataLinkPayload)
		if calcData.calcValue then
			local result = math.abs(calcData.calcValue) or 0

			if type(result) == "number" and format then
				if isDecimal then
					result = string.format(format, result)
				else
					result = string.format(format, result * 100)
				end
			elseif not format then
				result = trimDecimal(result)
			end

			return result
		elseif calcData.formulaByPetCacheProp and calcData.formulaExplictId then
			local petInfo = resolver.customRichTextData.petInfo
			local explictData = FormulaExplictData[calcData.formulaExplictId]
			local value = 0
			local attributeMap = petInfo and getPetAttributeMap(petInfo) or nil

			if not petInfo or not attributeMap then
				for i = 2, 6 do
					local resultValue = calcData.formulaByPetCacheProp[i]

					if type(resultValue) == "number" then
						local minRate = explictData.minNum

						value = math.abs(resultValue * minRate)

						break
					end
				end
			else
				local formulaId = calcData.formulaByPetCacheProp[1]
				local formulaData = FormulaData[formulaId]

				if not formulaData then
					return "0"
				end

				local argList = {}

				for i = 2, 6 do
					local arg = 0
					local propName = calcData.formulaByPetCacheProp[i]

					if propName then
						if type(propName) == "number" then
							arg = propName
						else
							local propId = AttributeConst[propName]

							if not propId then
								break
							end

							arg = attributeMap[propId] or 0
						end
					else
						break
					end

					table.insert(argList, arg)
				end

				value = math.abs(formulaData.formula(unpack(argList)) or 0)
			end

			if type(value) == "number" and format then
				value = formatValue(value, not isDecimal, format)
			elseif not format then
				value = trimDecimal(value)
			end

			local desc = getLocalizationText(GameStringConfig.formulaExplictDesc.desc)
			local val1, val2, val3, val4, val5, val6 = buildFormulaExplictFormatArgs(calcData, explictData)
			local result = getFormatText(desc, value, val1, val2, val3, val4, val5, val6)

			if isEmpty(calcDataLinkPayload) then
				return result
			end

			return string.format("<link=\"%s\"><u>%s</u></link>", calcDataLinkPayload, result)
		end

		if strict then
			error("Unsupported calcData configuration")
		end

		return "0"
	end

	function resolver.getCalcData(strArray)
		local tableName = strArray[1]
		local key = tonumber(strArray[2])
		local paramName = strArray[3]
		local level = resolver.customRichTextData[strArray[4]] or tonumber(strArray[4])
		local format = strArray.Length >= 6 and strArray[5]
		local isDecimal = strArray.Length >= 7 and strArray[6] == "1"
		local data = getCalcDataByArgs(tableName, key, paramName, level)
		local calcDataLinkPayload = string.format("calcDataLink_%s,%s,%s,%s", tableName, key, paramName, strArray[4])

		if format then
			calcDataLinkPayload = string.format("%s,%s", calcDataLinkPayload, format)
		end

		if not data then
			if strict then
				error("Missing calcData: " .. tableName .. "/" .. tostring(key) .. "/" .. paramName .. "/" .. tostring(level))
			end

			return 0
		end

		return resolver._getCalcDesc(data, format, isDecimal, calcDataLinkPayload)
	end

	function resolver.getConfigData(strArray)
		local tableName = strArray[1]
		local result, table = xpcall(require, debug.traceback, "Data." .. tableName)

		if not result then
			return
		end

		local keyLength = strArray.Length - 2
		local result = table

		for i = 1, keyLength do
			local nextKey = strArray[i + 1]

			result = result[nextKey] or result[tonumber(nextKey)]

			if not result then
				return
			end
		end

		if type(result) == "number" or type(result) == "string" then
			return tostring(result)
		end
	end

	function resolver.petItemSource(strArray)
		local sourceName = strArray[1]

		if resolver.customRichTextData.petInfo then
			return string.format("source_%d_%s", sourceName, resolver.customRichTextData.petInfo.id)
		end

		return string.format("source_%d", sourceName)
	end

	local customRichTextMap = {
		buffConfigData = function(strArray)
			return BuffConfigData[tonumber(strArray[1])] and BuffConfigData[tonumber(strArray[1])][strArray[2]]
		end,
		calcData = resolver.getCalcData,
		getConfigData = resolver.getConfigData,
		petItemSource = resolver.petItemSource
	}

	resolver.customRichTextData = {}

	function resolver.getCustomRichTextData(strArray)
		if strArray == nil or strArray.Length < 2 then
			return ""
		end

		local typeName = strArray[0]
		local fun = customRichTextMap[typeName]

		if not fun and strict then
			error("Unknown custom rich text type: " .. tostring(typeName))
		end

		return fun and fun(strArray) or ""
	end

	resolver.getCalcDataByArgs = getCalcDataByArgs
	resolver.buildFormulaExplictFormatArgs = buildFormulaExplictFormatArgs

	return resolver
end

return CustomRichTextUtils
