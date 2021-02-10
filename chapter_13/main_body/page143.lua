#!/usr/bin/lua
--第一个参数是windows格式文件，第二个参数是想要转换成的POSIX格式文件
local inp=assert(io.open(arg[1],"rb"))
local out=assert(io.open(arg[2],"wb"))
local data=inp:read("a")
data=string.gsub(data,"\r\n","\n")
out:write(data)
assert(out:close())
