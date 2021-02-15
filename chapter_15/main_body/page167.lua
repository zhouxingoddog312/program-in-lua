#!/usr/bin/lua
function basicSerialize(o)
	return string.format("%q",o)
end
function serialize(o)
	local t=type(o)
	if t=="boolean" or t=="number" or t=="string" or t=="nil" then
		io.write(string.format("%q",o))
	elseif t=="table" then
		io.write("{\n")
		for k,v in pairs(o) do
--			io.write(" ",k," = ")
			io.write(string.format(" [%s] = ",basicSerialize(k)))
			serialize(v)
			io.write(",\n")
		end
		io.write("}\n")
	else
		error("cannot serialize a "..type(o))
	end
end
