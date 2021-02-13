#!/usr/bin/lua
local buff=""
for line in io.lines() do
	buff=buff..line.."\n"
end

----------------------------------------------------
local t={}
for line in io.lines() do
	t[#t+1]=line.."\n"
end
local s=table.concat(t)

-----------------------------------------------------
local t={}
for line in io.lines() do
	t[#t+1]=line
end
local s=table.concat(t,"\n").."\n"

-----------------------------------------------------
local t={}
for line in io.lines() do
	t[#t+1]=line
end
t[#t+1]=""
local s=table.concat(t,"\n")
