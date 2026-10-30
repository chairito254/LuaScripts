-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\UGCContentPlaceholder.lua

local UGCContentPlaceholder = {}

function UGCContentPlaceholder.applyToImage(imageWidget, containerWidget, options)
	options = options or {}

	if imageWidget then
		imageWidget.url = ""
		imageWidget.sprite = nil
	end

	if containerWidget and not string.isNilOrEmpty(options.placeholderPage) then
		containerWidget:TryChangePage(options.placeholderPage, 1)
	end
end

return UGCContentPlaceholder
