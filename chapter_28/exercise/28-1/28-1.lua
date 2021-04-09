function foo(str)
	local t={}
	f=assert(load("return "..str))
	for i=1,5 do
		x=i
		t[#t+1]=f()
	end
	return table.unpack(t)
end
