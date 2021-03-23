#!/usr/bin/lua
function factory_stringgrep(n)
	local result={}
	result[#result+1]="local s=...;"
	result[#result+1]='local r="";'
	odd="r=r..s;"
	even="s=s..s;"
	if n>0 then
		while n>1 do
			if n%2~=0 then
				result[#result+1]=odd
			end
			result[#result+1]=even
			n=math.floor(n/2)
		end
		result[#result+1]=odd
	end
	result[#result+1]="return r"
	return load(table.concat(result))
end




stringgrep=factory_stringgrep(5)
print(stringgrep("h "))
