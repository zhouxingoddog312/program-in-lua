#!/usr/bin/lua
--假定稀疏矩阵是用不规则数组表示的
function add(a,b)
	local c={}
	for i=1,#a do
		c[i]={}
		for j=1,#a[i] do
			c[i][j]=a[i][j]+b[i][j]
		end
	end
	return c
end
a={{1,2,3},{1,2,3},{1,2,3}}
b={{1,1,1},{2,2,2},{3,3,3}}
c=add(a,b)
for i=1,#c do
	for j=1,#c[i] do
		io.write(c[i][j].."  ")
	end
	io.write("\n")
end
