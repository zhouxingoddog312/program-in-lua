function round(x)
	local f=math.floor(x)
	if f==x then	--这里处理的时大整数取整可能不精确
		return f
	else
		return math.floor(x+0.5)	--这里x+0.5处理的是向最近的整数取整
	end
end
--避免对大整数取整时出现的不精确
