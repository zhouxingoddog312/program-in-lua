#!/usr/bin/lua
function listNew()
	return {first=0,last=0}
end
function empty(list)
	return list.first==list.last and list[list.first]==nil
end
function pushFirst(list,value)
	if empty(list) then
		list.last=list.last-1
	end
	local first=list.first-1
	list[first]=value
	list.first=first
end
function pushLast(list,value)
	if empty(list) then
		list.first=list.first+1
	end
	local last=list.last+1
	list.last=last
	list[last]=value
end
function popFirst(list)
	if empty(list) then
		error("list is empty")
	end
	local first=list.first
	local value=list[first]
	list[first]=nil
	if first==list.last then
		list.first=0
		list.last=0
	else
		list.first=first+1
	end
	return value
end
function popLast(list)
	if empty(list) then
		error("list is empty")
	end
	local last=list.last
	local value=list[last]
	list[last]=nil
	if last==list.first then
		list.first=0
		list.last=0
	else
		list.last=last-1
	end
	return value
end
function display(list)
	while not empty(list) do
		local value=popFirst(list)
		io.write(value.."\t")
	end
end


L=listNew()
if empty(L) then
	print("Empty list created")
end
pushFirst(L,3)
pushFirst(L,1)
pushLast(L,2)
display(L)
