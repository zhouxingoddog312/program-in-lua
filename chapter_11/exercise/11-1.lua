#!/usr/bin/env lua
local counter={}
for line in io.lines() do
	for word in string.gmatch(line,"%w%w%w%w+") do
		counter[word]=(counter[word] or 0)+1
	end
end
local words={}
for word in pairs(counter) do
	words[#words+1]=word
end
table.sort(words,function (w1,w2)
	return counter[w1]>counter[w2] or counter[w1]==counter[w2] and w1<w2
end)
local n=math.min(tonumber(arg[1]) or math.huge,#words)
for i=1,n do
	io.write(words[i],"\t",counter[words[i]],"\n")
end