#!/usr/bin/lua
local proxy={}
local mt={}
function readOnly(t)
	mt.__index=function (_,k) return rawget(t,k) end
	mt.__newindex=function (t,k,v) error("attempt to update a read-only table",2) end
	setmetatable(proxy,mt)
	return proxy
end




days={"Sunday","Monday","Tuesday","Wednesday","Tursday","Friday","Saturday"}
days=readOnly(days)
print(days[1])
--days[2]="Noday"

test=readOnly{1,2,3,4}
print(test[1])
test[2]=4
