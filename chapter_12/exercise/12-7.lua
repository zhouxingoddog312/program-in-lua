#!/usr/bin/lua
t1={year=2021,month=8,day=31}
t1=os.date("*t",os.time(t1))
t2=t1
t1.day=t1.day+1
t1=os.date("*t",os.time(t1))
t1.month=t1.month+1
t1=os.date("*t",os.time(t1))



t2.month=t2.month+1
t2=os.date("*t",os.time(t2))
t2.day=t2.day+1
t2=os.date("*t",os.time(t2))
print(os.date("%c",os.time(t1)))
print(os.date("%c",os.time(t2)))
