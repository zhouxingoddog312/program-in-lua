#!/usr/bin/lua
math.randomseed(os.time())
function allwords()
	local line=io.read()
	local pos=1
	return function ()
		while line do
			local w,e=string.match(line,"(%w+[,;.:]?)()",pos)
			if w then
				pos=e
				return w
			else
				line=io.read()
				pos=1
			end
		end
		return nil
	end
end
function prefix(tab)
	return table.concat(tab," ")
end
local statetab={}
function insert(prefix,value)
	local list=statetab[prefix]
	if list==nil then
		statetab[prefix]={value}
	else
		list[#list+1]=value
	end
end

local MAXGEN=200
local NOWORD="\n"
local tab={}
for i=1,arg[1] do		--用第一个参数前缀单词序列的长度
	tab[#tab+1]=NOWORD
end
for nextword in allwords() do
	insert(prefix(tab),nextword)
	table.move(tab,2,#tab,1)
	tab[#tab]=nextword
end
insert(prefix(tab),NOWORD)
for i=1,arg[1] do
	tab[i]=NOWORD
end
for i=1,MAXGEN do
	local list=statetab[prefix(tab)]
	local r=math.random(#list)
	local nextword=list[r]
	if nextword==NOWORD then
		return
	end
	io.write(nextword," ")
	table.move(tab,2,#tab,1)
	tab[#tab]=nextword
end
