#!/usr/bin/lua
function dsec(num)
	temp=os.date("*t",num)
	sum=temp.hour*3600+temp.min*60+temp.sec
	return sum
end
