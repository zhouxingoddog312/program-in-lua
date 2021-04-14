#include <lauxlib.h>
int l_map(lua_State *L)
{
	int i,n;
	luaL_checktype(L,1,LUA_TTABLE);
	luaL_checktype(L,1,LUA_TFUNCTION);
	n=luaL_len(L,1);
	for(i=1;i<=n;i++)
	{
		lua_pushvalue(L,2);
		lua_geti(L,1,i);
		lua_call(L,1,1);
		lua_seti(L,1,i);
	}
	return 0;
}
