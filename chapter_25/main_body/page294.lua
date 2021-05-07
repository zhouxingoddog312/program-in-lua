#!/usr/bin/lua
function trace(event,line)
	local s=debug.getinfo(2).short_src
	print(s..":"..line)
end
function debug1()
	while true do
		io.write("debug> ")
		local line=io.read()
		if line=="cont" then
			break
		end
		assert(load(line))()
	end
end
