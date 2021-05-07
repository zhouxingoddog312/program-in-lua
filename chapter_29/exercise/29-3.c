#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
static int reverse(lua_State *L)
{
	int parnum=lua_gettop(L);
	for(int index=1;index<=parnum/2;index++)
	{
		lua_pushvalue(L,index);
		lua_pushvalue(L,parnum-index+1);
		lua_replace(L,index);
		lua_replace(L,parnum-index+1);
	}
	return parnum;
}





//简单测试
int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,reverse);
	lua_setglobal(L,"rever");
	luaL_loadstring(L,"print(rever(1,'hello',20,'hi'))");
	lua_pcall(L,0,0,0);
	lua_close(L);
	return 0;
}
