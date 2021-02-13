#!/usr/bin/lua
local a={}
for i=1,1000 do
	a[i]=0
end
print(#a)


a={}
for i=-5,5 do
	a[i]=0
end
print(#a)	--长度运算符遵循索引从1开始的管理，故这里的结果是5
