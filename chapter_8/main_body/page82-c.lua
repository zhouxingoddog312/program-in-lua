#!/usr/bin/lua
local sqr=arg[1]/2
repeat
	sqr=(sqr+arg[1]/sqr)/2
	local error=math.abs(sqr^2-arg[1])
until error<arg[1]/10000
print(sqr)
