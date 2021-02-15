#!/usr/bin/lua
local authors={}
function Entry(b)
	authors[b.author or "unknown"]=true
end
dofile("./data2")
for name in pairs(authors) do
	print(name)
end
