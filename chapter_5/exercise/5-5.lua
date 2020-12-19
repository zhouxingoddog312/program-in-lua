#!/usr/bin/lua
--[[
假设多项式是3x^5+4x^4-2x^3+8x^2-x^1+9
]]
function polynomial(x)
	tab={9,-1,8,-2,4,3}
	local sum=0
	local product=1
	for i=1,#tab do
		sum=sum+tab[i]*product
		product=product*x
	end
	return sum
end
