#!/usr/bin/lua
reserved={["and"]=true,["break"]=true,["do"]=true,["else"]=true,["elseif"]=true,["end"]=true,["false"]=true,["goto"]=true,["for"]=true,["function"]=true,["if"]=true,["in"]=true,["local"]=true,["nil"]=true,["not"]=true,["or"]=true,["repeat"]=true,["return"]=true,["then"]=true,["true"]=true,["until"]=true,["while"]=true}
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
			local s=string.match(k,"^[%a_]+[%w_]*$")
			if s and not reserved[s] then
				io.write(string.rep("\t",deep)," ",k," = ")
			else
				io.write(string.rep("\t",deep),string.format(" [%s] = ",basicSerialize(k)))
			end
			serialize(v,deep+1)
			io.write(",\n")
		end
		io.write(string.rep("\t",deep),"}\n")
	else
		error("cannot serialize a "..type(o))
	end
end
