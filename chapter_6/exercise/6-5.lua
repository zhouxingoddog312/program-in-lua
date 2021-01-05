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
