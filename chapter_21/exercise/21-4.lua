#!/usr/bin/lua
function newAccount(initialBalance)
	local o={balance=initialBalance or 0}
	local proxy={}
	local mt={
		balance=function ()
			return o.balance
		end,
		withdraw=function (v)
			o.balance=o.balance-v
		end,
		deposit=function (v)
			o.balance=o.balance+v
		end,
}
		mt.__index=mt
	setmetatable(proxy,mt)
	return proxy
end







a=newAccount(103)
b=newAccount()
a.deposit(100.0)
b.withdraw(20)
print(a.balance())
print(b.balance())
