#!/usr/bin/lua
s="hello world"
i,j=string.find(s,"hello")
print(i,j)
print(string.sub(s,i,j))
print(string.find(s,"world"))
i,j=string.find(s,"l")
print(i,j)
print(string.find(s,"lll"))

--string.find("a [word]","[")
string.find("a [word]","[",1,true)


print(string.match("hello world","hello"))
date="Today is 17/7/1990"
d=string.match(date,%d+/%d+/%d+)
print(d)
