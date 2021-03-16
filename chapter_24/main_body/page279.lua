#!/usr/bin/lua
local function printResult(a)
	for i=1,#a do
		io.write(a[i]," ")
	end
	io.write("\n")
end
function permgen(a,n)
	n=n or #a
	if n<=1 then
		coroutine.yield(a)
	else
		for i=1,n do
			a[i],a[n]=a[n],a[i]
			permgen(a,n-1)
			a[i],a[n]=a[n],a[i]
		end
	end
end
--[[
function permutations(a)
	local co=coroutine.create(function () permgen(a) end)
	return function ()
		local code,res=coroutine.resume(co)
		return res
	end
end
--]]
function permutations(a)
	return coroutine.wrap(function () permgen(a) end)
end
for p in permutations{"a","b","c"} do
	printResult(p)
end
