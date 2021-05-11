local breakpoint={}
local function hook(event,line)
	if breakpoint[line] then
		debug.debug()
	end
end
local function setbreakpoint(func,line)
	breakpoint[line]=true
	if not debug.gethook() then
		debug.sethook(hook,"l")
	end
	return line
end
local function removebreakpoint(handle)
	breakpoint[handle]=nil
end
return {
	setbreakpoint=setbreakpoint,
	removebreakpoint=removebreakpoint,
}
