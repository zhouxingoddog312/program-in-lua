#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
static int pack(lua_State *L)
{
	int parnum=lua_gettop(L);
	lua_newtable(L);
	for(int index=1;index<=parnum;index++)
	{
		lua_pushinteger(L,index);
		lua_rotate(L,1,-1);
		lua_settable(L,-3);
	}
	return 1;
}



//简单测试
int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,pack);
	lua_setglobal(L,"pack");
	luaL_loadstring(L,"t=pack(1,2,5,'hi');print(t[1],t[4])");
	lua_pcall(L,0,0,0);
	lua_close(L);
	return 0;
}
