#!/usr/bin/lua
local t={}
local inp=io.input()
local out=io.output()
for line in inp:lines() do
	t[#t+1]=line
end
for i=#t,1,-1 do
	io.write(t[i],"\n")
end
