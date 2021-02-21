#!/usr/bin/lua
function loadwithprefix(...)
	local arg={...}
	local f=load(table.concat(arg))
	return f
end
