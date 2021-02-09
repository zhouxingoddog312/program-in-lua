#!/usr/bin/lua
function wday(num)
	result=os.date("%w",num)
	return math.floor(result+1)
end
