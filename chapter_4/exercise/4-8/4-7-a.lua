#!/usr/bin/lua
function ispali(string)
	string=string.gsub(string,"%p","")
	string=string.gsub(string," ","")
	index=1
	length=string.len(string)
	while index< length do
		if string:byte(index) ~= string:byte(length-index+1) then
			return false
		end
		index=index+1
	end
	return true
end
