#!/usr/bin/env lua
--第一个参数是要输出的单词个数，第二个参数是包含要忽略的单词的文本文件
local ignore={}
if arg[2] then
	for line in io.lines(arg[2]) do
		for word in string.gmatch(line,"%w+") do
			ignore[word]=true
		end
	end
end
local counter={}
for line in io.lines() do
	for word in string.gmatch(line,"%w%w%w%w+") do
		if not arg[2] or ignore[word]~=true then
			counter[word]=(counter[word] or 0)+1
		end
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
