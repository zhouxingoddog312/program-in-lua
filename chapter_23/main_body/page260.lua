#!/usr/bin/lua
local result={}
setmetatable(result,{__mode="v"})
function createRGB(r,g,b)
	local key=string.format("%d-%d-%d",r,g,b)
	local color=result[key]
	if color==nil then
		color={red=r,green=g,blue=b}
		result[key]=color
	end
	return color
end
