#!/usr/bin/lua
--[[
假设多项式是3x^5+4x^4-2x^3+8x^2-x^1+9
]]
function polynomial(x)
	tab={3,4,-2,8,-1,9}
	local sum=0
	for i=1,#tab do
		sum=sum+tab[i]*(x^(#tab-i))
	end
	return sum
end
