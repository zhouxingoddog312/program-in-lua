function BoxMullerRandom()
	local rand1,rand2=math.random(),math.random()
	rand1=rand1==0 and (1) or rand1
	rand2=rand2==0 and (1) or rand2
	return math.sqrt(-2*math.log(rand1))*math.sin(2*math.pi*rand2)
end
