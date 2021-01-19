function disk1(x,y)
	return (x-1.0)^2+(y-3.0)^2<=4.5^2
end

function disk(cx,cy,cr)
	return function (x,y)
		return (x-cx)^2+(y-cy)^2<=cr^2
	end
end

function rect(left,right,bottom,up)
	return function (x,y)
		return left<=x and x<=right and bottom<=y and y<=up
	end
end

function complement(r)
	return function(x,y)
		return not r(x,y)
	end
end
function union(r1,r2)
	return function(x,y)
		return r1(x,y) or r2(x,y)
	end
end
function intersection(r1,r2)
	return function(x,y)
		return r1(x,y) and r2(x,y)
	end
end
function difference(r1,r2)
	return function(x,y)
		return r1(x,y) and not r2(x,y)
	end
end
function translate(r,dx,dy)
	return function (x,y)
		return r(x-dx,y-dy)
	end
end
--[[
function rotate(r,deg)
  return function (x,y)
    local rad=math.atan(y,x)-math.rad(deg)
    local sp=(x^2+y^2)^(1/2)
    if x==0 and y==0 then
      rad=0
    end
    return r(sp*math.cos(rad),sp*math.sin(rad))
  end
end
--]]
function rotate(r,deg)
	return function (x,y)
		local rad=math.rad(deg)
		if x==0 and y==0 then
			rad=0
		end
		return r(x*math.cos(rad)+y*math.sin(rad),y*math.cos(rad)-x*math.sin(rad))
	end
end

function plot(r,M,N)
	io.write("P1\n",M," ",N,"\n")
	for i=1,N do
		local y=(N-i*2)/N
		for j=1,M do
			local x=(j*2-M)/M
			io.write(r(x,y) and "1" or "0")
		end
		io.write("\n")
	end
end
local file=io.open("test1.bmp","w")
io.output(file)
c1=disk(0,0,1)
plot(rotate(difference(c1,translate(c1,-0.3,0)),180),500,500)
io.close(file)
