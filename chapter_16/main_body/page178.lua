#!/usr/bin/lua
--[[
print"enter a number:"
n=io.read("n")
if not n then
	error("invalid input")
end
--]]
print"enter a number:"
n=assert(io.read("n"),"invalid input")
