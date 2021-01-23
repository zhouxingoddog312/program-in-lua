#!/usr/bin/env lua
function unescape(s)
	s=string.gsub(s,"+"," ")
	s=string.gsub(s,"%%(%x%x)",function (n)
		return string.char(tonumber(n,16))
	end)
	return s
end
--print(unescape("a%2Bb+%3D+c"))
function decode(s)
	local cgi={}
	for name,value in string.gmatch(s,"([^&=]+)=([^&=]+)") do
		name=unescape(name)
		value=unescape(value)
		cgi[name]=value
	end
	return cgi
end

function escape(s)
	s=string.gsub(s,"[&=+%%%c]",function (n)
		return string.format("%%%02X",string.byte(n))
	end)
	s=string.gsub(s," ","+")
	return s
end
function encode(ts)
	local b={}
	for k,v in pairs(ts) do
--		print("k=",k,"v=",v)
		b[#b+1]=(escape(k).."="..escape(v))
	end
	return table.concat(b,"&")
end


t=[[q=yes+or+no&query=a%2Bb+%3D+c&name=al]]
table1=decode(t)
for i,j in pairs(table1) do
	print(i,j)
end

print(encode(table1))

