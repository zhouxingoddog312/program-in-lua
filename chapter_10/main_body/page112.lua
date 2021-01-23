test="int x; /* x */ int y; /* y */"
print((string.gsub(test,"/%*.*%*/","")))

test="int x; /* x */ int y; /* y */"
print((string.gsub(test,"/%*.-%*/","")))

--[[
if string.find(s,"^%d") then

if string.find(s,"^[+-]?%d$") then
--]]
