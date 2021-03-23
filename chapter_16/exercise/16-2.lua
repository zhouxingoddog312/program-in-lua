#!/usr/bin/lua
function multiload(...)
	local main={}
	local arg=table.pack(...)
	for i=1,arg.n do
		if arg[i]==nil then
			error("invalide arg")
		elseif type(arg[i])=="string" then
			main[#main+1]=arg[i]
		elseif type(arg[i])=="function" then
			local result={}
			for w in arg[i] do
				result[#result+1]=w
			end
			main[#main+1]=table.concat(result)
		end
	end
	str=table.concat(main)

	return load(str)
end
