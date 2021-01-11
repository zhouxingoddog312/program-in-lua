#!/usr/bin/lua
::s1:: do
local c=io.read(1)
if c=='0' then
	goto s2
elseif c==nil then
	print("OK!")
	return
else
	goto s1
end
end
::s2:: do
local c=io.read(1)
if c=='0' then
	goto s1
elseif c==nil then
	print"Not OK!"
	return
else
	goto s2
end
end
