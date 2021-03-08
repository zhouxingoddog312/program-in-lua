#!/usr/bin/lua
function getfield(f)
	local v=_G
	w=string.match(f,"[^%w%._]")
	if w then
		error("seperation character was wrong!")
	end
	for w in string.gmatch(f,"([%a_][%w_]*)(%.?)") do
		v=v[w]
	end
	return v
end
