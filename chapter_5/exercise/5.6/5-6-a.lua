#!/usr/bin/lua
function IsSequence(tab)
	i=0
	j=0
	for index in pairs(tab) do
		i=i+1
	end
	for index in ipairs(tab) do
		j=j+1
	end
	if i~=j then
		return false
	else
		return true
	end
end
