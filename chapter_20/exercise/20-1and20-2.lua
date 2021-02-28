#!/usr/bin/lua
local Set={}
local mt={}
function Set.new(l)
	local set={}
	setmetatable(set,mt)
	for _,v in pairs(l) do
		set[v]=true
	end
	return set
end
function Set.union(a,b)
	if getmetatable(a)~=mt or getmetatable(b)~=mt then
		error("attempt to 'add' a set with a non-set value",2)
	end
	local res=Set.new{}
	for k in pairs(a) do
		res[k]=true
	end
	for k in pairs(b) do
		res[k]=true
	end
	return res
end
function Set.intersection(a,b)
	if getmetatable(a)~=mt or getmetatable(b)~=mt then
		error("attempt to 'multiply' a set with a non-set value",2)
	end
	local res=Set.new{}
	for k in pairs(a) do
		res[k]=b[k]
	end
	return res
end
function Set.subtraction(a,b)
	if getmetatable(a)~=mt or getmetatable(b)~=mt then
		error("attempt to 'subtract' a set with a non-set value",2)
	end
	local res=Set.new{}
	for k in pairs(a) do
		res[k]=true
	end
	for k in pairs(b) do
		res[k]=nil
	end
	return res
end
function Set.tostring(set)
	local l={}
	for e in pairs(set) do
		l[#l+1]=e
	end
	return "{"..table.concat(l,",").."}"
end
function Set.length(set)
	local count=0
	for i in pairs(set) do
		count=count+1
	end
	return count
end
mt.__add=Set.union
mt.__mul=Set.intersection
mt.__sub=Set.subtraction
mt.__len=Set.length
mt.__tostring=Set.tostring
mt.__le=function (a,b)
	for k in pairs(a) do
		if not b[k] then
			return false
		end
	end
		return true
end
mt.__lt=function (a,b)
	return a<=b and not(b<=a)
end
mt.__eq=function (a,b)
	return a<=b and b<=a
end
return Set
