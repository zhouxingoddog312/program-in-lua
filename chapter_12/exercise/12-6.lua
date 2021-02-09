#!/usr/bin/lua
function diffmonth(num1,num2)
	t1=os.date("*t",num1)
	t2=os.date("*t",num2)
	mon1=t1.month-t2.month
	year1=math.abs(t1.year-t2.year)
	mon1=year1*12+mon1
	return mon1
end
