#!/usr/bin/lua
function hamming(num)
	local count=0
	while num~=0 do
		if num&1==1 then
			count=count+1
		end
		num=num>>1
	end
	return count
end
