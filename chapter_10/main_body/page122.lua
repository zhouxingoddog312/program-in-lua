pattern=string.rep("[^\n]",70).."+"



function nocase(s)
	s=string.gsub(s,"%a",function (c)
		return "["..string.lower(c)..string.upper(c).."]"
	end)
	return s
end
print(nocase("Hi there!"))

s1=string.gsub(s1,"(%W)","%%%1")
s2=string.gsub(s2,"%%","%%%%")
