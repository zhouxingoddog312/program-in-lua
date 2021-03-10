#!/usr/bin/lua
Stack={}
function Stack:isempty()
	return #self==0
end
function Stack:push(v)
	table.insert(self,v)
end
function Stack:pop()
	if #self~=0 then
		table.remove(self)
	else
		error("Stack is empty")
	end
end
function Stack:top()
	if #self~=0 then
		return self[#self]
	else
		return nil
	end
end
function Stack:new(o)
	o=o or {}
	self.__index=self
	setmetatable(o,self)
	return o
end
--以上是Stack类的定义
StackQueue=Stack:new()
function StackQueue:insertbottom(v)
	table.insert(self,1,v)
end


--以上是StackQueue的定义


---------------------
s=StackQueue:new({2})
print("top is "..s:top())
s:push(3)
print("top is "..s:top())
s:insertbottom(5)
s:pop()
print("top is "..s:top())
s:pop()
print("bottom is "..s:top())
s:pop()
if s:isempty() then
	print("stack is empty!!!")
end