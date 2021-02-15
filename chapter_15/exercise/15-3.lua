#!/usr/bin/lua
function basicSerialize(o)
	return string.format("%q",o)
end
function serialize(o,deep)
	deep=deep or 0
	local t=type(o)
	if t=="boolean" or t=="number" or t=="string" or t=="nil" then
		io.write(string.format("%q",o))
	elseif t=="table" then
		deep=deep+1
		io.write("{\n")
		for k,v in pairs(o) do
			local s=string.match(k,"^[%a_]+[%w_]*$")
			if s then
				io.write(string.rep("\t",deep)," ",k," = ")
			else
				io.write(string.rep("\t",deep),string.format(" [%s] = ",basicSerialize(k)))
			end
			serialize(v,deep)
			io.write(",\n")
		end
		io.write("}\n")
	else
		error("cannot serialize a "..type(o))
	end
end
