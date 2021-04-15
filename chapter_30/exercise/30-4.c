#include <string.h>
#include <lauxlib.h>
#include <stdio.h>
#include <lua.h>
#include <lualib.h>
static int l_transliterate(lua_State* L)
{
	int index;
	size_t len;
	luaL_Buffer b;
	lua_getfield(L,LUA_REGISTRYINDEX,"table");
	lua_insert(L,2);
	luaL_checktype(L,1,LUA_TSTRING);
	luaL_checktype(L,2,LUA_TTABLE);
	const char *str=lua_tolstring(L,1,&len);
	luaL_buffinit(L,&b);
	for(index=0;index<len;index++)
	{
		lua_pushlstring(L,str+index,1);
		switch(lua_gettable(L,2))
		{
			case 1:
				if(lua_toboolean(L,-1))
				{
					lua_pop(L,1);
					lua_pushlstring(L,str+index,1);
					luaL_addvalue(&b);
					break;
				}
				else
				{
					lua_pop(L,1);
					break;
				}
			case 4:
				luaL_addvalue(&b);
				break;
			default:
				lua_pop(L,1);
				lua_pushlstring(L,str+index,1);
				luaL_addvalue(&b);
		}
	}
	luaL_pushresult(&b);
	return 1;
}
static int l_settrans(lua_State *L)
{
	luaL_checktype(L,1,LUA_TTABLE);
	lua_pushvalue(L,1);
	lua_setfield(L,LUA_REGISTRYINDEX,"table");
	return 0;
}
static int l_gettrans(lua_State *L)
{
	lua_getfield(L,LUA_REGISTRYINDEX,"table");
	return 1;
}
static const struct luaL_Reg trans[]=
{
	{"transliterate",l_transliterate},
	{"settrans",l_settrans},
	{"gettrans",l_gettrans},
	{NULL,NULL}
};
int luaopen_lib(lua_State *L)
{
	luaL_newlib(L,trans);
	return 1;
}
