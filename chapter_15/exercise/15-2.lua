#!/usr/bin/lua
function basicSerialize(o)
	return string.format("%q",o)
end
function serialize(o,deep)
	local deep=deep or 0
	local t=type(o)
	if t=="boolean" or t=="number" or t=="string" or t=="nil" then
		io.write(string.format("%q",o))
	elseif t=="table" then
		io.write("{\n")
		for k,v in pairs(o) do
			io.write(string.rep("\t",deep+1),string.format(" [%s] = ",basicSerialize(k)))
			serialize(v,deep+1)
			io.write(",\n")
		end
		io.write(string.rep("\t",deep),"}\n")
	else
		error("cannot serialize a "..type(o))
	end
end
