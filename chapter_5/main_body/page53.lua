#!/usr/bin/lua
t={}
for line in io.lines() do
	table.insert(t,line)
end
print(#t)
