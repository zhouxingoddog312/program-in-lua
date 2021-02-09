#!/usr/bin/lua
local date=os.time()
local day2year=365.242			--一年的天数
local sec2hour=60*60			--一小时的秒数
local sec2day=sec2hour*24		--一天的秒数
local sec2year=sec2day*day2year		--一年的秒数

--年
print(date//sec2year+1970)

--小时
print(date%sec2day//sec2hour)

--分钟
print(date%sec2hour//60)

--秒
print(date%60)


print(os.time({year=2021,month=2,day=9,hour=10,min=38,sec=20}))
print(os.time({year=1970,month=1,day=1,hour=0}))	--因为是中国，所以负8小时
print(os.time({year=1970,month=1,day=1,hour=0,sec=1}))
print(os.time({year=1970,month=1,day=1}))		--这是默认时间12:00
