#!/usr/bin/lua
print(os.date("a %A in %B"))
print(os.date("%d/%m/%Y",906000490))
t=906000490
print(os.date("%Y-%m-%d",t))
print(os.date("%Y-%m-%dT%H:%M:%S",t))
print(os.date("%Y-%j",t))
print(os.date("!%c",0))
