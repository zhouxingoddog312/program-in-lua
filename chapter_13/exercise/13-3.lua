#!/usr/bin/lua
function powtwo(num)
	if num&(num-1)==0 then
		return true
	else
		return false
	end
end
