#!/usr/bin/lua
function add(a)
	local sum=0
	for i=1,#a do
		sum=sum+a[i]
	end
	return sum
end
