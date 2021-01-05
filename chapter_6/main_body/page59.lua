#!/usr/bin/lua
function foo0()
end
function foo1()
	return "a"
end
function foo2()
	return "a","b"
end
function foo(i)
	if i==0 then
		return foo0()
	elseif i==1 then
		return foo1()
	elseif i==2 then
		return foo2()
	end
end
function fooCall(...)
	print("Calling foo:",...)
	return foo(...)
end
