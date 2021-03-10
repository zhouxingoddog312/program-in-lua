#!/usr/bin/lua
--[[
t={__gc=function () print"finishing lua program" end}
setmetatable(t,t)
_G["*A*"]=t
--]]



do
	local mt={__gc=function (o) print"new cycle";setmetatable({},getmetatable(o)) end}
	setmetatable({},mt)
end
collectgarbage()
collectgarbage()
collectgarbage()
