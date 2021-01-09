#!/usr/bin/lua
function createdir(dir)
	io.popen("mkdir "..dir)
end
function removedir(dir)
	io.popen("rm -r "..dir)
end
function listdir(dir)
	f=io.popen("ls "..dir,"r")
	s=f:read("a")
	io.write(s)
end
