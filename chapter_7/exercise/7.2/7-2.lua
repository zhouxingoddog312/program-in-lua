#!/usr/bin/lua
local lines={}
if arg[1] and arg[2] then
	flag=io.open(arg[2],"r")
	if not flag then
		io.input(arg[1])
		io.output(arg[2])
	else
		flag:close()
		io.write("File is exist. Enter y to cover the file:")
		s=io.read(1)
		if s=="y" then
			io.input(arg[1])
			io.output(arg[2])
		else
			os.exit(0)
		end
	end
elseif arg[1] then
	io.input(arg[1])
end
for line in io.lines() do
	lines[#lines+1]=line
end
table.sort(lines)
for _,l in ipairs(lines) do
	io.write(l,'\n')
end
