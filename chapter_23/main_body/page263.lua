#!/usr/bin/lua
--[[
o={x="hi"}
setmetatable(o,{__gc=function (o) print(o.x) end})
o=nil
collectgarbage()
--]]

----------------------
--[[
o={x="hi"}
mt={}
setmetatable(o,mt)
mt.__gc=function (o) print(o.x) end
o=nil
collectgarbage()
--]]
o={x="hi"}
mt={__gc=true}
setmetatable(o,mt)
mt.__gc=function (o) print(o.x) end
o=nil
collectgarbage()
