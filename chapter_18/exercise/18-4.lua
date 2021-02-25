#!/usr/bin/lua
local function iter(str,t)	--t[1]是front，t[2]是tail
	t[1]=t[1] or 1
	t[2]=t[2] or 0
	::flag::
	if t[1]<#str then
		if t[2]<#str then
			t[2]=t[2]+1
		else
			t[1]=t[1]+1
			t[2]=t[1]
		end
		local substr=string.sub(str,t[1],t[2])
		if string.match(substr,"[%S]+") then	--当子串全是空白字符时认为是空子串，不返回
			return t,substr
		else
			goto flag
		end
	else
		return nil
	end
end



function substring(str)
	return iter,str,{}
end

----------------------------------------------
for _,s in substring("hel l o") do
	print(s)
end
