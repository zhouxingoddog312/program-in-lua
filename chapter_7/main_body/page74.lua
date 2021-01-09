function trans()
	for block in io.input:lines(2^13) do
		io.write(block)
	end
end
function fsize(file)
	local current=file:seek("cur",0)
	local size=file:seek("end",0)
	file:seek("set",current)
	return size
end
