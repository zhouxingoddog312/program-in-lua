#!/usr/bin/lua
local metadata={}
Stack={}
function Stack:isempty()
	return #metadata[self]==0
end
function Stack:push(v)
	table.insert(metadata[self],v)
end
function Stack:pop()
	if #metadata[self]~=0 then
		table.remove(metadata[self])
	else
		error("Stack is empty")
	end
end
function Stack:top()
	if #metadata[self]~=0 then
		return metadata[self][#metadata[self]]
	else
		return nil
	end
end
function Stack:new(o)
	o=o or {}
	self.__index=self
	setmetatable(o,self)
	metadata[o]={}
	return o
end


---------------------
s=Stack:new()
s:push(3)
print("top is "..s:top())
s:push(4)
print("top is "..s:top())
s:pop()
s:pop()
if s:isempty() then
	print("stack is empty!!!")
end
