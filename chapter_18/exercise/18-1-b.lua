#!/usr/bin/lua
local function iter(m,n)	--注意m和n的顺序
	n=n+1
	if n<=m then
		return n
	end
end
function fromto (n,m)
	return iter,m,n-1	--m不可变状态，n控制变量
end

for i in fromto(3,11) do
	print(i)	--body
end
