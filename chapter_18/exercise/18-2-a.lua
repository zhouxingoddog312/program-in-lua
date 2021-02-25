#!/usr/bin/lua
--数值型for应该指的是for i=n,m,k的形式，也就是i从n开始按步长k逐渐递增，直到大于m结束循环
function fromto(n,m,k)
	k=k or 1
	n=n-k
	return function ()
			n=n+k
			if n<=m then
				return n
			end
		end
end

for i in fromto(2,6,0.5) do
	print(i)	--body
end
