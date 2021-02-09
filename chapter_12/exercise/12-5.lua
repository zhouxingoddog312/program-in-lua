#!/usr/bin/lua
function diffday(num1,num2)
	return math.floor(os.difftime(num1,num2)//(24*60*60))
end
