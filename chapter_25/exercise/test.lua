#!/usr/bin/lua
env={__index=_ENV,print=print}
setmetatable(env,env)
line=io.read()
x=1
load(line,"s","t",env)()
