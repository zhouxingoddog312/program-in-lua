#!/usr/bin/lua
--需先获得N，M的值
N=4
M=5
local mt={}
for i=1,N do
	local row={}
	mt[i]=row
	for j=1,M do
		row[j]=0
	end
end


print(string.rep("-",20))
local mt={}
for i=1,N do
	local aux=(i-1)*M
	for j=1,M do
		mt[aux+j]=0
	end
end
print(string.rep("-",20))
--[[
local mt={}
for i=1,N do
	local row={}
	mt[i]=row
	for j=1,i do
		row[j]=0
	end
end
for i=1,#mt do
	for j=1,#(mt[i]) do
		io.write(string.format("%d",mt[i][j]))
	end
	io.write("\n")
end
--]]
