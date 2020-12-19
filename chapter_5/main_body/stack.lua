#!/usr/bin/lua
function InitStack()
	a={}
	return a
end
function IsEmpty(Stack)
	return #Stack==0
end
function MakeEmpty(Stack)
	for i=1,#Stack do
		Stack[i]=nil
	end
end
function Push(Element,Stack)
	table.insert(Stack,Element)
end
function Top(Stack)
	return Stack[#Stack]
end
function TopAndPop(Stack)
	top=table.remove(Stack)
	return top
end
function DisposeStack()
	return nil
end
