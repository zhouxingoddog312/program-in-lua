#!/usr/bin/lua
local lines={}
if arg[1] and arg[2] then
	io.input(arg[1])
	io.output(arg[2])
elseif arg[1] then
	io.input(arg[1])
end
for line in io.lines() do
	lines[#lines+1]=line
end
table.sort(lines)
for _,l in ipairs(lines) do
	io.write(l,'\n')
end
