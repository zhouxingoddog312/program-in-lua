#!/usr/bin/lua
function fileAsArray(filename)
	local proxy={}

	local filearray={}
	local file=assert(io.open(filename,"r"))
	for block in file:lines(1) do
		filearray[#filearray+1]=block
	end
	file:close()
	
	local mt={
		__index=function (_,k) return filearray[k] end,
		__newindex=function (_,k,v)
			filearray[k]=v
			local file=assert(io.open(filename,"w"))
			for _,w in ipairs(filearray) do
				file:write(w)
			end
			file:close()
		end,
		__pairs=function ()
			return function (_,k)
				local nextkey,nextvalue=next(filearray,k)
				return nextkey,nextvalue
			end
		end,
		__len=function ()
			return #filearray
		end
	}


	setmetatable(proxy,mt)
	return proxy
end


--the content under the line are for test 
f=fileAsArray("text")
print(f[2])
f[2]="i"
for x,y in pairs(f) do
	print(x,y)
end
print(#f)
