#!/usr/bin/lua
function unpack(t,i,n)
	i=i or 1
	n=n or #t
	if i<=n then
		return t[i],unpack(t,i+1,n)
	end
end
function foo(n)
	if n>0 then
		return foo(n-1)
	end
end
