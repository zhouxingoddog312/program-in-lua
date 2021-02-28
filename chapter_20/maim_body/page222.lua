#!/usr/bin/lua
--[[
function setDefault(t,d)
	local mt={__index=function () return d end}
	setmetatable(t,mt)
end
]]
--[[
local mt={__index=function (t) return t.___ end}
function setDefault(t,d)
	t.___=d
	setmetatable(t,mt)
end
]]
local key={}
local mt={__index=function (t) return t[key] end}
function setDefault(t,d)
	t[key]=d
	setmetatable(t,mt)
end

tab={x=10,y=2}
print(tab.x,tab.z)
setDefault(tab,0)
print(tab.x,tab.z)
