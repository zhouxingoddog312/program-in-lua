#!/usr/bin/lua
Lib={}
Lib.foo=function (x,y) return x+y end
Lib.goo=function (x,y) return x-y end


Lib={
	foo=function (x,y) return x+y end,
	goo=function (x,y) return x-y end
}


Lib={}
function Lib.foo(x,y)
	return x+y
end
function Lib.goo(x,y)
	return x-y
end
