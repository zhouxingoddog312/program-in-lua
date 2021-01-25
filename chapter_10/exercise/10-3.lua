#!/usr/bin/lua
function transliterate(s,t)
	for key,alpha in pairs(t) do
		local sp=string.gsub(key,"(%W)","%%%1")
		if t[key]==false then
			s=string.gsub(s,sp,"")
		else
			s=string.gsub(s,sp,alpha)
		end
	end
	return s
end
str="hello world![[[--]]]"
tab={e="1",l="2",["["]="x"}
str=transliterate(str,tab)
print(str)
