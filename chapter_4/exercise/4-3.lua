#!/usr/bin/lua
function insert(string,index,substring)
	temp1=string.sub(string,index)
	temp2=string.sub(string,-#string,index-#string-2)
	return temp2..substring..temp1
end
