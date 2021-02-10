#!/usr/bin/lua
function isrev(num)
	s=""
	while num~=0 do
		s=num&1==1 and s.."1" or s.."0"
		num=num>>1
	end
	if s==string.reverse(s) then
		return true
	else
		return false
	end
end
