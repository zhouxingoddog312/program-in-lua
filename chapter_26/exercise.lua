#!/usr/bin/lua
local socket=require"socket"
function receive(connection)
	connection:settimeout(0)
	local s,status,partial=connection:receive(2^10)
	if status=="timeout" then
		coroutine.yield(connection)
	end
	return s or partial,status
end
function download(host,file)
	local c=assert(socket.connect(host,80))
	local count=0
	local request=string.format("GET %s HTTP/1.0\r\nhost: %s\r\n\r\n",host,file)
	c:send(request)
	while true do
		local s,status=receive(c)
		count=count+#s
		if status=="closed" then
			break
		end
	end
	c:close()
	print(file,count)
end
tasks={}
function get(host,file)
	local co=coroutine.wrap(function ()
		download(host,file)
	end)
	table.insert(tasks,co)
end
--[[
function dispatch()
	local i=1
	while true do
		if tasks[i]==nil then
			if tasks[1]==nil then
				break
			end
			i=1
		end
		local res=tasks[i]()
		if not res then
			table.remove(tasks,i)
		else
			i=i+1
		end
	end
end
--]]
function dispatch()
	local i=1
	local timeout={}
	while true do
		if tasks[i]==nil then
			if tasks[1]==nil then
				break
			end
			i=1
			timeout={}
		end
		local res=tasks[i]()
		if not res then
			table.remove(tasks,i)
		else
			i=i+1
			timeout[#timeout+1]=res
			if #timeout==#tasks then
				socket.select(timeout)
			end
		end
	end
end
get("www.lua.org","/ftp/lua-5.3.2.tar.gz")
get("www.lua.org","/ftp/lua-5.3.1.tar.gz")
dispatch()
