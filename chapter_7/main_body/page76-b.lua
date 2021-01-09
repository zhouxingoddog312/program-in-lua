local subject="some news"
local address="zhouxin312@qq.com"
local cmd=string.format("mail -s '%s' '%s'",subject,address)
local f=io.popen(cmd,"w")
f:write([[
Nothing to say
-- goddog312
]])
f:close()
