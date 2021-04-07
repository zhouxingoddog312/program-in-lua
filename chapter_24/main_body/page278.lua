#!/usr/bin/lua
local function printResult(a)
	for i=1,#a do
		io.write(a[i],"")
	end
	io.write("\n")
end
function permgen(a,n)
	n=n or #a
	if n<=1 then
		printResult(a)
	else
		for i=1,n do
			a[i],a[n]=a[n],a[i]
			permgen(a,n-1)
			a[i],a[n]=a[n],a[i]
		end
	end
end
