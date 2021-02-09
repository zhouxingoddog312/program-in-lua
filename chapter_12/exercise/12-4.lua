#!/usr/bin/lua
function firstfriday(num)	--年用四位记法
	temp={year=num,month=1,day=1}
	temp=os.date("*t",os.time(temp))
	cur=temp.wday
	if cur<=6 then
		temp.day=temp.day+6-cur
	else
		temp.day=temp.day+6
	end
	temp=os.date("*t",os.time(temp))
	return temp.yday
end
