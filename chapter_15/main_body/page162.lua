#!/usr/bin/lua
local count=0
function Entry()
	count=count+1
end
dofile("./data1")
print("number of entries: "..count)

local authors={}
function Entry(b)
	authors[b[1]]=true
end
dofile("./data1")
for name in pairs(authors) do
	print(name)
end
