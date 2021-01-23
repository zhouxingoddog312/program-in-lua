#!/usr/bin/lua
s="a (enclosed (in) parentheses) line"
print((string.gsub(s,"%b()","")))


s="the anthem is the theme"
print((string.gsub(s,"%f[%w]the%f[%W]","one")))

pair="name = Anna"
key,value=string.match(pair,"(%a+)%s*=%s*(%a+)")
print(key,value)
