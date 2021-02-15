#!/usr/bin/lua
--[[
local fmt={integer = "%d",float = "%a"}
function serialize(o)
	if type(o)=="number" then
		io.write(string.format(fmt[math.type(o)],o))
	elseif type(o)=="string" then
		io.write(string.format("%q",o))
--]]
function serialize(o)
	local t=type(o)
	if t=="number" or t=="string" or t=="nil" or t=="Boolean" then
		io.write(string.format("%q",o))
	end
