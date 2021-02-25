#!/usr/bin/lua
--所有重复的单词只输出一次，将单词作为键，单词出现的次数作为键值
function uniquewords(file)
	local t={}
	local pos=1
	for line in io.lines(file) do
		local w,e=string.match(line,"(%w+)()",pos)
		while w do
			pos=e
			t[w]=t[w]==nil and 1 or t[w]+1
			w,e=string.match(line,"(%w+)()",pos)
		end
		pos=1
	end
	return next,t,nil
end
