#!/usr/bin/lua
s="hello\0lua\0world\0"
local i=1
while i<=#s do
local res
res,i=string.unpack("z",s,i)
print(res)
end
