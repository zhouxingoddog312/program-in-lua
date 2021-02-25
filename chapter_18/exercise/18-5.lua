#!/usr/bin/lua
local function iter(tab,index)	--index[1]是front，index[2]是tail
	index[1]=index[1] or 1
	index[2]=index[2] or 0
	local temp={}
	if index[1]<#tab then
		if index[2]<#tab then
			index[2]=index[2]+1
		else
			index[1]=index[1]+1
			index[2]=index[1]
		end
		for i=index[1],index[2] do
			temp[#temp+1]=tab[i]
		end
		return index,temp
	else
		return nil
	end
end
function subtab(tab)
	return iter,tab,{}
end

a={1,2,3,4}
for _,t in subtab(a) do
	for k,v in pairs(t) do
		print(v)
	end
	print("-------------")
end
