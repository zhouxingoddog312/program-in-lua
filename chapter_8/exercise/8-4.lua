#!/usr/bin/lua
function room1()
	local move=io.read()
	if move=="south" then
		return room3()
	elseif move=="east" then
		return room2()
	else
		print("Invalid room!")
		return room1()
	end
end
function room2()
	local move=io.read()
	if move=="west" then
		return room1()
	elseif move=="south" then
		return room4()
	else
		print("Invalid room!")
		return room2()
	end
end
function room3()
	local move=io.read()
	if move=="north" then
		return room1()
	elseif move=="east" then
		return room4()
	else
		print("Invalid room!")
		return room3()
	end
end
function room4()
	print("Congratulations, you won!")
end
room1()
