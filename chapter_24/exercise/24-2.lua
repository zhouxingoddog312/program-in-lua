#!/usr/bin/lua
function arrange(tab,begin)
  begin=begin or 0
  if begin==0 then
    main_index=1
  end
  if main_table==nil or begin==0 then
    main_table={}
  end
  if sub_table==nil or begin==0 then
    sub_table={}
  end
  if begin==(#tab) then
    main_table[main_index]=table.move(sub_table,1,#sub_table,1,{})
    main_index=main_index+1
  else
    table.insert(sub_table,tab[begin+1])
    arrange(tab,begin+1)
    table.remove(sub_table)
    arrange(tab,begin+1)
  end
  return main_table
end

function printResult(tab)
	for i=1,#tab do
		io.write(tab[i]," ")
	end
	io.write('\n')
end

function generator(tab)
	local t=arrange(tab)
	for i=1,#t do
		coroutine.yield(t[i])
	end
end

function factory(tab)
	local co=coroutine.create(function () generator(tab) end)
	return function ()
		local code,res=coroutine.resume(co)
		return res
	end
end

for p in factory({1,2,3,4}) do
	printResult(p)
end
