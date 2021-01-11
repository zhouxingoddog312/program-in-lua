local found=nil
for i=1,#a do
	if a[i]<0 then
		found=i		--保存块内临时变量的值
		break
	end
end
print(found)
