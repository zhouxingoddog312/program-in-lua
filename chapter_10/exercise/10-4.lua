#!/usr/bin/lua
function oldtrim(s)
	s=string.gsub(s,"%s*(.-)%s*","%1")
	return s
end
str=string.rep(" ",100000000)
str=(" ".."a"..str.."a".." ")
time=os.clock()
oldtrim(str)
print(os.clock()-time)

function newtrim(s)
	s=string.match(s,"%S.*%S")
	return s
end
time=os.clock()
newtrim(str)
print(os.clock()-time)
