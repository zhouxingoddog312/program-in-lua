#!/usr/bin/lua
local function search(k,plist)
	for i=1,#plist do
		local v=plist[i][k]
		if v then
			return v
		end
	end
end
function createClass(...)
	local c={}
	local parents={...}
	setmetatable(c,{__index=function (t,k)
				return search(k,parents)
			end
	})
	c.__index=c
	function c:new(o)
		o=o or {}
		setmetatable(o,c)
		return o
	end
	return c
end

--一个类Account
Account={balance=0}
function Account:new(o)
	o=o or {}
	self.__index=self
	setmetatable(o,self)
	return o
end
function Account:withdraw(v)
	if v>self.balance then
		error"insufficient funds"
	end
	self.balance=self.balance-v
end
function Account:deposite(v)
	self.balance=self.balance+v
end

--一个类Named
Named={}
function Named:getname()
	return self.name
end
function Named:setname(v)
	self.name=v
end


NamedAccount=createClass(Account,Named)	--构造新类


account=NamedAccount:new({name="Paul"})
print(account:getname())
account:setname("Zhou")
print(account:getname())
