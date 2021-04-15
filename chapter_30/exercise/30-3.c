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
int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,l_transliterate);
	lua_setglobal(L,"transliterate");
	lua_pushlstring(L,"abcdefg",7);
	lua_setglobal(L,"str");
	luaL_loadstring(L,"s=transliterate(str,{a='1',b=false,c='3',d='4',e=true});print(s)");
	lua_call(L,0,0);
	lua_close(L);
	return 0;
}
