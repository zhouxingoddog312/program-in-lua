#!/usr/bin/lua
--把字符串常量转换为十六进制表示,每十个字符一行
function escape(s)
	local count=1
	s=string.gsub(s,".",function (n)
		if count<10 then
			count=count+1
			return string.format("\\x%02X",string.byte(n))
		else
			count=1
			return string.format("\\x%02X\n",string.byte(n))
		end
	end)
	return s
end

--把十六进制转换成字符串常量
function unescape(s)
	s=string.gsub(s,"\n","")
	s=string.gsub(s,"\\x(%x%x)",function (n)
		return string.char(tonumber(n,16))
	end)
	return s
end




s="\0\1hello\nworld\nwakakakakakakakak"
s=escape(s)
print(s)
s=unescape(s)
print(s)

