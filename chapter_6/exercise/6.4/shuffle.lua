#!/usr/bin/lua
function swap(array,index1,index2)
	local temp
	temp=array[index1]
	array[index1]=array[index2]
	array[index2]=temp
end
function shuffle(array)
	math.randomseed(os.time())
	for index=2,#array do
		swap(array,index,math.random(1,index))
	end
end
