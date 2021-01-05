#!/usr/bin/lua
function foo(...)
	local arg=table.pack(...)
	arg[arg.n]=nil
	arg.n=arg.n-1
	return table.unpack(arg)
end
