#!/usr/bin/lua
local offset=0
local count=0
file=io.open(arg[1])
while count~=2 do
	offset=offset+1
	flag=file:seek("end",-offset)
	if not flag then
		file:seek("set")
		str=file:read("a")
		io.write(str)
		os.exit(0)
	end
	str=file:read(1)
	if str=="\n" then
		count=count+1
	end
	file:seek("set")
end
file:seek("end",-(offset-1))
str=file:read("a")
io.write(str)
file:close()
