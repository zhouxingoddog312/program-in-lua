#!/usr/bin/lua
local result={}
setmetatable(result,{__mode="v"})
function mem_loadstring (s)
	local res=result[s]
	if res==nil then
		res=assert(load(s))
		result[s]=res
	end
	return res
end

