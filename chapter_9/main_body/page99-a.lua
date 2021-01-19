do
	local oldsin=math.sin
	local k=math.pi/180
	math.sin=function (x)
		return oldsin(x*k)
	end
end
