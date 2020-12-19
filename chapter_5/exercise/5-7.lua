#!/usr/bin/lua
function TotalInsert(tab1,tab2,index)
	for i=1,#tab1 do
		table.insert(tab2,index,tab1[i])
		index=index+1
	end
end
