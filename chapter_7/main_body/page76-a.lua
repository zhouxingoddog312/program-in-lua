#!/usr/bin/lua
local f=io.popen("ls","r")
local dir={}
for entry in f:lines() do
	dir[#dir+1]=entry
	io.write(dir[#dir],'\n')
end

