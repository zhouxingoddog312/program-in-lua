#!/usr/bin/lua
function getvarvalue(_,name,level,isenv)
	local value
	local found=false
	level=(level or 1)+1
	for i=1,math.huge do
		local n,v=debug.getlocal(level,i)
		if not n then
			break
		end
		if n==name then
			value=v
			found=true
		end
	end
	if found then
		return value
	end
	local func=debug.getinfo(level,"f").func
	for i=1,math.huge do
		local n,v=debug.getupvalue(func,i)
		if not n then
			break
		end
		if n==name then
			return v
		end
	end
	if isenv then
		return "noenv"
	end
	local env=getvarvalue(nil,"_ENV",level,true)
	if env then
		return env[name]
	else
		return "noenv"
	end
end
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
function debug1()
	while true do
		io.write("debug> ")
		local line=io.read()
		if line=="cont" then
			break
		end
		local env={print=print,__index=getvarvalue,__newindex=setvarvalue}
		setmetatable(env,env)
		load(line,"testcode","t",env)()
	end
end


x=1
local y=2
debug1()
