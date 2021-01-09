#!/usr/bin/lua
function createdir(dir)
	flag=os.execute("mkdir "..dir)
	if flag==nil then
		io.write("Create directory fail!")
	end
end
function removedir(dir)
	flag=os.execute("rm -r "..dir)
	if flag==nil then
		io.write("Directory remove fail!")
	end
end
function listdir(dir)
	os.execute("ls "..dir)
end
