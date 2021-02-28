#!/usr/bin/lua
prototype={x=0,y=0,width=100,height=100}
local mt={}
function new(o)
	setmetatable(o,mt)
	return o
end
--[=[
mt.__index=function (_,k)
	return prototype[k]
end
]=]
mt.__index=prototype

w=new{x=10,y=20}
print(w.width)
