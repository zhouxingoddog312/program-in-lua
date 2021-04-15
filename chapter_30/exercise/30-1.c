#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
int filter(lua_State *L)
{
	int index=1;
	luaL_checktype(L,1,LUA_TTABLE);
	luaL_checktype(L,2,LUA_TFUNCTION);
	int len=luaL_len(L,1);
	lua_newtable(L);
	lua_insert(L,3);
	for(int i=1;i<=len;i++)
	{
		lua_pushvalue(L,2);
		lua_geti(L,1,i);
		lua_call(L,1,1);
		if(lua_toboolean(L,-1))
		{
			lua_geti(L,1,i);
			lua_seti(L,3,index++);
			lua_pop(L,1);
		}
		else
			lua_pop(L,1);
	}
	return 1;
}

int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,filter);
	lua_setglobal(L,"filter");
	luaL_loadstring(L,"t=filter({1,3,20,-4,5},function (x) return x<5 end);print(table.unpack(t))");
	lua_call(L,0,0);
	return 0;
}
