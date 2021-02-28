#!/usr/bin/lua
t=require("20-1and20-2")
a=t.new({1,2,3,4})
b=t.new{3,5}
print(a-b)
print(a+b)
print(a*b)
print("#a="..#a)
