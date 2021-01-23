print((string.gsub("hello lua!","%a","%0-%0")))
print((string.gsub("hello lua!","(%a)","%1-%1")))

print((string.gsub("hello lua!","(.)(.)","%2%1")))

s=[[the \quote{task} is to \em{change} that.]]
s=string.gsub(s,"\\(%a+){(.-)}","<%1>%2</%1>")
print(s)

function trim(s)
	s=string.gsub(s,"^%s*(.-)%s*$","%1")
	return s
end
