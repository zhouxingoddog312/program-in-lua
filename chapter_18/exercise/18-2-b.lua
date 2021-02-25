#!/usr/bin/lua
local function iter(t,n)	--注意m和n的顺序
	n=n+t[2]
	if n<=t[1] then
		return n
	end
end
function fromto (n,m,k)
	return iter,{m,k},n-k	--m不可变状态，n控制变量
end

for i in fromto(3,11,0.5) do
	print(i)	--body
end
