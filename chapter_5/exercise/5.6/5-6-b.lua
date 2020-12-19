#!/usr/bin/lua
function IsSequence(tab)
	for i=1,#tab do
		if tab[i]==nil then
			return false
		end
	end
	return true
end
