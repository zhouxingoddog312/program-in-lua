#include <stdio.h>
#include <math.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
/*
static int l_sin(lua_State *L)
{
	double d=lua_tonumber(L,1);
	lua_pushnumber(L,sin(d));
	return 1;
}
*/

static int l_sin(lua_State *L)
{
	double d=luaL_checknumber(L,1);
	lua_pushnumber(L,sin(d));
	return 1;
}

int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,l_sin);
	lua_setglobal(L,"mysin");
	
	
/*
	luaL_loadstring(L,"print(mysin(0.523))");	//或者直接执行代码段
	lua_pcall(L,0,0,0);
*/
	

	lua_getglobal(L,"mysin");
//	lua_pushnumber(L,0.523);
	lua_pushstring(L,"a");		//用lua_tostring(L,-1)查看错误信息
	lua_pcall(L,1,1,0);
	const char *str=lua_tostring(L,-1);
	printf("%s\n",str);
	double z=lua_tonumber(L,-1);
	printf("%g\n",z);

	
	
	lua_close(L);
	return 0;
}
