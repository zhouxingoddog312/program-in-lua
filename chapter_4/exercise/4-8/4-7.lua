#!/usr/bin/lua
function ispali(string)
	string=string.gsub(string,"%p","")
	string=string.gsub(string," ","")
	return string.reverse(string)==string
end
