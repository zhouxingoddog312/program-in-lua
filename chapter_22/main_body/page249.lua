#!/usr/bin/lua
--[[
local print,sin=print,math.sin
_ENV=nil
print(13)
print(sin(13))
print(math.cos(13))
]]
--------------------

a=13
local a=12
print(a)
print(_ENV.a)
print(a)
print(_G.a)
