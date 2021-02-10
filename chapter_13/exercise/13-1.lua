#!/usr/bin/lua
function umod(n,m)
	while not math.ult(n,m) do
		n=n-m
		print(string.format("n=%u",n))
	end
	return n
end
