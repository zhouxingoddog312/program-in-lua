function integral (f,delta)
	delta=delta or 1e-4
	return function (a,b)
		local sp=0
		for i=a,b,delta do
			sp=sp+f(i)	--得到分割成的矩形的高，并把所有的高求和
		end
		return sp*delta		--得到所有矩形的面积的和
	end
end
c=integral(math.cos)
print(math.sin(10),c(0,10))
