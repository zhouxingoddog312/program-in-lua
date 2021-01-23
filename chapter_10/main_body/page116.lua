#!/usr/bin/env lua
function expand(s)
	return (string.gsub(s,"$(%w+)",_G))
end
name = "Lua"; status = "great"
print(expand("$name is $status, isn't it?"))
print(expand("$othername is $status, isn't it?"))


function expand1(s)
	return (string.gsub(s,"$(%w+)",function (n) return tostring(_G[n]) end))
end
print(expand1("print=$print; a=$a"))
