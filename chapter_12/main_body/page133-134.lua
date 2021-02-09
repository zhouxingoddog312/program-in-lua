#!/usr/bin/lua
t=os.date("*t")
print(os.date("%Y/%m/%d",os.time(t)))
t.day=t.day+40
print(os.date("%Y/%m/%d",os.time(t)))

--[[
temp=t
print(temp.day,temp.month)
temp=os.date("*t",os.time(temp)-3456000)
print(temp.day,temp.month)
--]]

print("------------------------------------------------------------------------")
print(t.day,t.month)
t.day=t.day-40
print(t.day,t.month)
t=os.date("*t",os.time(t))
print(t.day,t.month)


print("------------------------------------------------------------------------")
print(os.date("%Y/%m/%d",os.time(t)))
t.month=t.month+6
print(os.date("%Y/%m/%d",os.time(t)))

print("------------------------------------------------------------------------")
temp1=os.date("*t",os.time({year=2021,month=3,day=31}))
print(temp1.month,temp1.day)
temp1.month=temp1.month+1
temp1=os.date("*t",os.time(temp1))
print(temp1.month,temp1.day)

temp2=os.date("*t",os.time({year=2021,month=5,day=1}))
print(temp2.month,temp2.day)
temp2.month=temp2.month-1
temp2=os.date("*t",os.time(temp2))
print(temp2.month,temp2.day)

print("------------------------------------------------------------------------")
local t5_3=os.time({year=2015,month=1,day=12})
local t5_2=os.time({year=2011,month=12,day=16})
local d=os.difftime(t5_3,t5_2)
print(d//(24*3600))
print("------------------------------------------------------------------------")
myepoch=os.time({year=2000,month=1,day=1,hour=0})
now=os.time({year=2015,month=11,day=20})
print(os.difftime(now,myepoch))
T={year=2000,month=1,day=1,hour=0}
T.sec=os.difftime(now,myepoch)
print(os.date("%Y/%m/%d",os.time(T)))
print("------------------------------------------------------------------------")
local x=os.clock()
local s=0
for i=1,100000 do
	s=s+i
end
print(string.format("elapsed time:%.4f\n",os.clock()-x))	--时间太短，增加小数点后面的位数
