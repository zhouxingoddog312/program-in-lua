#!/usr/bin/lua
_ENV={_G=_G}
local function foo ()
	_G.print(a)
end
a=10
foo()
_ENV={_G=_G,a=20}
foo()
