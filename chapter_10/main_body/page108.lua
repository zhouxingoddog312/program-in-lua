#!/usr/bin/lua
s=string.gsub("Lua is cute","cute","great")
print(s)
s=string.gsub("all lii","l","x")
print(s)
s=string.gsub("Lua is great","Sol","Sun")
s=string.gsub("all lii","l","x",1)
print(s)
s=string.gsub("all lii","l","x",2)
print(s)

s="some string"
words={}
for w in string.gmatch(s,"%a+") do
	words[#words+1]=w
end
for i,j in pairs(words) do
	print(i,j)
end
