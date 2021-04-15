#include <string.h>
#include <lauxlib.h>
static int l_split(lua_State *L)
{
	int i=1;
	const char *s=luaL_checkstring(L,1);
	const char *sep=luaL_checkstring(L,2);
	char *e;
	lua_newtable(L);
	while((e=strchr(s,*sep))!=NULL)
	{
		lua_pushlstring(L,s,e-s);
		lua_rawseti(L,-2,i++);
		s=e+1;
	}
	lua_pushstring(L,s);
	lua_rawseti(L,-2,i);
	return 1;
}
