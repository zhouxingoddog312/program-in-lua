#!/usr/bin/lua
function id(...)
	return ...
end
function fwrite(fmt,...)
	return io.write(string.format(fmt,...))
end
function nonils(...)
	local arg=table.pack(...)
	for i=1,arg.n do
		if arg[i]==nil then
			return false
		end
	end
	return true
end
