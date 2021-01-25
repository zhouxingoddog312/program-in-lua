#!/usr/bin/env lua
function split(s,d)
	local word={}
	d=("[".."^"..d.."]".."+")
	for w in string.gmatch(s,d) do
		word[#word+1]=w
	end
return word
end




--for test
t=split("a whole new world"," ")
for i,j in pairs(t) do
	print(i,j)
end
t=split("what asd . + whole new world as ","+")
print(table.unpack(t))
for i,j in pairs(t) do
	print(i,j)
end

