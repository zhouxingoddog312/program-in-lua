#!/usr/bin/lua
print("enter function to be plotted (with variable 'x'):")
local line=io.read()
local f=assert(load("return "..line))
for i=1,20 do
	x=i
	print(string.rep("*",f()))
end
