#!/usr/bin/lua
function trans()
	for count=1,math.huge do
		local line=io.read("L")
		if line==nil then
			break
		end
		io.write(string.format("%6d	",count),line)
	end
end
function trans1()
	count=0
	for line in io.lines() do
		count=count+1
		io.write(string.format("%6d	",count),line)
	end
end
