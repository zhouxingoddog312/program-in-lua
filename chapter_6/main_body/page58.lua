#!/usr/bin/lua
function maximum(a)
	local mi=1
	local m=a[mi]
	for i=1,#a do
		if a[i]>m then
			m=a[i]
			mi=i
		end
	end
	return m,mi
end
