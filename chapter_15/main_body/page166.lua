function quote(s)
	local n=-1
	for w in string.gmatch(s,"]=*") do
		n=math.max(n,#w-1)
	end
	local eq=string.rep("=",n+1)
	return string.format("[%s[\n%s]%s]",eq,s,eq)
end
