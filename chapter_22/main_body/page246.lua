#!/usr/bin/lua
local declareNames={}
setmetatable(_G,{
	__newindex=function (t,n,v)
		if not declareNames[n] then
			local w=debug.getinfo(2,"S")
			if w~="main" and w~="C" then
				error("attempt to write to undeclared variable "..n,2)
			end
			declareNames[n]=true
		end
		rawset(t,n,v)
	end,
	__index=function (_,n)
		if not declareNames[n] then
			error("attempt to read undeclared variable "..n,2)
		else
			return nil
		end
	end
})
