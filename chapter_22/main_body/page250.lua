#!/usr/bin/lua
--[[
_ENV={}
a=1
print(a)
]]

--[[
a=15
_ENV={g=_G}
a=1
g.print(_ENV.a,g.a)
]]
a=15
_ENV={_G=_G}
a=1
_G.print(_ENV.a,_G.a)
