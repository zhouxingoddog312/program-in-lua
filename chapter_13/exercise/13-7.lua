#!/usr/bin/lua
local sum=0
local f=assert(io.open(arg[1],"rb"))
local blocksize=11
for bytes in f:lines(blocksize) do
	_,_,t=string.unpack("ibf",bytes)
	sum=sum+t
end
return sum
