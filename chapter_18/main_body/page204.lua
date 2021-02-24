#!/usr/bin/lua
--[[
local function getnext(node)
	return node.next
end
function traverse(list)
	return getnext,nil,list
end
]]
local function getnext(list,node)
	if not node then
		return list
	else
		return node.next
	end
end
function traverse(list)
	return getnext,list,nil
end
