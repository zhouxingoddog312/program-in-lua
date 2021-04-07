#!/usr/bin/lua

function receive()
	return coroutine.yield()
end

function send(prod,x)
	coroutine.resume(prod,x)
end


function producer(prod)
	coroutine.resume(prod)
	coroutine.resume(prod)
	while true do
		local x=io.read()
		send(prod,x)
	end
end
function filter(prod)
	return coroutine.create(
		function ()
			for line=1,math.huge do
				local x=receive()
				x=string.format("%5d %s",line,x)
				send(prod,x)
			end
		end
	)
end
function consumer()
	return coroutine.create(
		function ()
			while true do
				local x=receive()
				io.write(x,"\n")
			end
		end
	)
end
producer(filter(consumer()))
