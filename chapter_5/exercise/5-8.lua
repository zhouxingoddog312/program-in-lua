#!/usr/bin/lua
function Concatenate(tab,start,over)
	string="\0"
	for i=start,over do
		string=string..tab[i]
	end
	return string
end
