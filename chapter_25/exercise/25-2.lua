#!/usr/bin/lua
function setvarvalue(name,value,level)
	level=(level or 1)+1
	for i=1,math.huge do
		local n,v=debug.getlocal(level,i)
		if not n then
			break
		end
		if n==name then
			debug.setlocal(level,i,value)
			return "local"
		end
	end

	local func=debug.getinfo(level,"f").func
	for i=1,math.huge do
		local n,v=debug.getupvalue(func,i)
		if not n then
			break
		end
		if n==name then
			debug.setupvalue(func,i,value)
			return "upvalue"
		end
	end
	for i=1,math.huge do
		local n,v=debug.getupvalue(func,i)
		if not n then
			break
		end
		if n=="_ENV" then
			v[name]=value
			return "global"
		end
	end
end
