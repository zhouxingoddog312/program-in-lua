
--[[
h指高，l指母线，A指母线与轴线的夹角弧度表示
--]]
function volume(h,A)
	return (math.pi*h*((h/math.cos(A))*math.sin(A))^2)/3
end
