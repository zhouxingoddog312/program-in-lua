#!/usr/bin/lua
function getvarvalue()
	local res={}
	local level=2
	local env
	for i=1,math.huge do
		local n,v=debug.getlocal(level,i)
		if not n then
			break
		end
		res[n]=v
	end
	local func=debug.getinfo(level,"f").func
	for i=1,math.huge do
		local n,v=debug.getupvalue(func,i)
		if not n then
			break
		end
		if n=="_ENV" then
			env=v
		end
		res[n]=v
	end
	if env then
		res.__index=env
		setmetatable(res,res)
	end
	return res
end
