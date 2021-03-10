#!/usr/bin/lua
local metas={}
setmetatable(metas,{__mode="v"})
function setDefaults(t,d)
	local mt=metas[d]
	if mt==nil then
		mt={__index=function () return d end}
		metas[d]=mt
	end
	setmetatable(t,mt)
end
