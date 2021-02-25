#!/usr/bin/lua
--数值型for应该指的是for i=n,m,1的形式，也就是i从n开始按步长1逐渐递增，直到大于m结束循环
function fromto(n,m)
	n=n-1
	return function ()
			n=n+1
			if n<=m then
				return n
			end
		end
end

for i in fromto(2,6) do
	print(i)	--body
end
