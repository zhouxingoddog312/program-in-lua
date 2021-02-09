#!/usr/bin/lua
function nextmonth(num)
	temp=os.date("*t",num)
	temp.month=temp.month+1
	return os.time(temp)
end
