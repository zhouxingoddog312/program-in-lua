#!/usr/bin/env lua
function code(s)
	return (string.gsub(s,"\\(.)",function (c)
		return string.format("\\%03d",string.byte(c))
	end))
end
function decode(s)
	return (string.gsub(s,"\\(%d%d%d)",function (n)
		return "\\"..string.char(tonumber(n))
	end))
end
s=[[follows a typical string: "This is \"great\"!".]]
s=code(s)
s=string.gsub(s,'".-"',string.upper)
s=decode(s)
print(s)

print(decode(string.gsub(code(s),'".-"',string.upper)))
