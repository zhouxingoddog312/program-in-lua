#!/usr/bin/lua
function dofile(filename)
	local f=assert(loadfile(filename))
	return f()
end
