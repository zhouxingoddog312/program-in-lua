#!/usr/bin/lua
setmetatable(_G,{
--[[
	__newindex=function (_,n)
		error("attempt to write to undeclared variable "..n,2)
	end,
]]
	__newindex=function (t,n,v)
		local w=debug.getinfo(2,"S").what
		if w~="main" and w~="C" then
			error("attemt to write to undeclared variable "..n,2)
		end
		rawset(t,n,v)
	end,
	__index=function (_,n)
		error("attempt to read undeclared variable "..n,2)
	end,
})
function declare(name,initval)
	rawset(_G,name,initval or false)
end
