#!/usr/bin/lua
Account={
	balance=0,
	withdraw=function (self,v)
		self.balance=self.balance-v
	end
}
function Account:deposite(v)
	self.balance=self.balance+v
end
--[[
local mt={__index=Account}

function Account.new(o)
	o=o or {}
	setmetatable(o,mt)
	return o
end
a=Account.new{balance=0}
a:deposite(100.0)
print(a.balance)
--]]


function Account:new(o)
	o=o or {}
	self.__index=self
	setmetatable(o,self)
	return o
end
--a=Account.new(Account,{balance=0})
a=Account:new()
a:deposite(100.0)
print(a.balance)
