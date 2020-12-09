--unbiased rounding
function round(x)
	local f=math.floor(x)
	if f==x or (x%2.0==0.5) then	--这里x%2.0==0.5处理的是，当x+0.5为奇数时，使其向最近的偶数取整
		return f
	else
		return math.floor(x+0.5)
	end
end
