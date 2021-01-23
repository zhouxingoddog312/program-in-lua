#!/usr/bin/lua
date="Today is 23/1/2021"
d,m,y=string.match(date,"(%d+)/(%d+)/(%d+)")
print(d,m,y)

s=[[then he said: "it's all right!"]]
q,quotedpart=string.match(s,"([\"'])(.-)%1")
print(quotedpart)
print(q)

s="a = [=[[[ something ]] ]==] ]=]; print(a)"
p="%[(=*)%[(.-)%]%1%]"
print(string.match(s,p))
