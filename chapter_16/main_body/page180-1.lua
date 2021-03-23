#!/usr/bin/lua
local ok,msg=pcall(function ()
	condition=true
	if condition then
		error({code=121},1)
	else
		print(a[1])
	end
end
)
print(ok,msg)
