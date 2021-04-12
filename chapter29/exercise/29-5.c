#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
static int foreach(lua_State *L)
{
	lua_pushnil(L);
	while(lua_next(L,1)!=0)
	{
/*		lua_pushvalue(L,2);
		lua_pushvalue(L,3);
		lua_pushvalue(L,4);
		lua_pcall(L,2,0,0);
		lua_pop(L,1);
*/
		lua_pushvalue(L,2);
		lua_pushvalue(L,3);
		lua_rotate(L,2,2);
		lua_pcall(L,2,0,0);	//两总实现都可以
	}
	return 0;
}



//简单测试
int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,foreach);
	lua_setglobal(L,"foreach");
	luaL_loadstring(L,"foreach({1,2,3},print)");
	lua_pcall(L,0,0,0);
	lua_close(L);
	return 0;
}
