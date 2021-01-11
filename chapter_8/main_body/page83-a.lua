#!/usr/bin/lua
for i=1,math.huge do
	if(0.3*i^3-20*i^2-500>=0) then
		print(i)
		break
	end
end
