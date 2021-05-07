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
		lua_pcall(L,2,0,0);	//两种实现都可以
	}
	return 0;
}
static const struct luaL_Reg mylib[]=
{
	{"summation",summation},
	{"pack",pack},
	{"reverse",reverse},
	{"foreach",foreach},
	{NULL,NULL}
};
int luaopen_mylib(lua_State *L)
{
	luaL_newlib(L,mylib);
	return 1;
}
