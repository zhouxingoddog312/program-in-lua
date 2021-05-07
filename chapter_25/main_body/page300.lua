#!/usr/bin/lua
local debug=require"debug"
local memlimit=1000
local steplimit=1000
local count=0
local validfunc={
	[string.upper]=true
	[string.lower]=true
}
local function checkmem()
	if collectgarbage("count")>memlimit then
		error("script use too much memory")
	end
end
local function hook(event)
	if event=="call" then
		local info=debug.getinfo(2,"fn");
		if not validfunc[info.func] then
			error("calling bad function: "..(info.name or "?"))
		end
	end
	checkmem()
	count=count+1
	if count>steplimit then
		error("script use too much CPU")
	end
end
local f=assert(loadfile(arg[1],"t",{}))
debug.sethook(hook,"",100)
f()
