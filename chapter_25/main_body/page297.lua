#!/usr/bin/lua
local debug=require"debug"
local memlimit=1000
local steplimit=1000
local count=0
local function checkmem()
	if collectgarbage("count")>memlimit then
		error("script use too much memory")
	end
end
local function step()
	checkmem()
	count=count+1
	if count>steplimit then
		error("script use too much CPU")
	end
end
local f=assert(loadfile(arg[1],"t",{}))
debug.sethook(step,"",100)
f()
