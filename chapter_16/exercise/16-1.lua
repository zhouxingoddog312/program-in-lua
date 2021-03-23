#!/usr/bin/lua
function loadwithprefix(prefix,main)
	if type(main)=="function" then
		local t={}
		t[1]=prefix
		for w in main do
			t[#t+1]=w
		end
		return load(table.concat(t))
	else
		return load(prefix..main)
	end
end


--f=loadwithprefix("return ","1+1")
f=loadwithprefix("return ",io.lines())
print(f())
