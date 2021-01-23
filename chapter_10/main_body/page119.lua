print(string.match("hello","()ll()"))
function expandTabs(s,Tab)
	Tab=Tab or 8
	local corr=0
	s=string.gsub(s,"()\t",function (p)
		local sp=Tab-(p-1+corr)%Tab
		corr=corr+sp-1
		return string.rep(" ",sp)
	end)
	return s
end
function unexpandTabs(s,Tab)
	Tab=Tab or 8
	local pat=string.rep(".",Tab)
	s=string.gsub(s,pat,"%0\1")
	s=string.gsub(s," +\1","\t")
	s=string.gsub(s,"\1","")
	return s
end



