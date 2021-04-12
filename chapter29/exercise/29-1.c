#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
static int summation(lua_State *L)
{
	int parnum;
	double sum=0.0;
	parnum=lua_gettop(L);
	for(int i=1;i<=parnum;i++)
	{
		sum+=luaL_checknumber(L,i);
	}
	lua_pushnumber(L,sum);
	return 1;
}


//简单测试
int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,summation);
	lua_setglobal(L,"summa");
	luaL_loadstring(L,"print(summa(2.3,5.4,-34,{}))");
	lua_pcall(L,0,0,0);
	lua_close(L);
	return 0;
}
