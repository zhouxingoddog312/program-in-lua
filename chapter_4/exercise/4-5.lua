#!/usr/bin/lua
function remove(string,index,length)
	return string.sub(string,-#string,index-#string-2)..string.sub(string,index+length)
end
