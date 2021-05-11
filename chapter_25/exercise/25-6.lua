#!/usr/bin/lua
local Counters={}
local Names={}
local function hook()
	local f=debug.getinfo(3,"f").func
	local count=Counters[f]
	if count==nil then
		Counters[f]=1
		Names[f]=debug.getinfo(3,"Sn")
	else
		Counters[f]=count+1
	end
end
function getname(func)
	local n=Names[func]
	if n.what=="C" then
		return n.name
	end
	local lc=string.format("[%s]:%d",n.short_src,n.linedefined)
	if n.what~="main" and n.namewhat~="" then
		return string.format("%s (%s)",lc,n.name)
	else
		return lc
	end
end
--按次数顺序输出
function pairsbyvalue()
	local reverse={}
	local value={}
	for k,v in pairs(Counters) do
		reverse[v]=k
		value[#value+1]=v
	end
	table.sort(value,function (a,b) return a>b end)
	local index=0
	return function ()
		index=index+1
		return reverse[value[index]],value[index]
	end
end
local f=assert(loadfile(arg[1]))
debug.sethook(hook,"c")
f()
debug.sethook()


for func,count in pairsbyvalue() do
	print(getname(func),count)
end
