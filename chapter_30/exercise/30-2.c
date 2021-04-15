#include <string.h>
#include <lauxlib.h>
#include <stdio.h>
#include <lua.h>
#include <lualib.h>
static int l_split(lua_State *L)
{
	size_t len;
	int i=1;
	const char *s=lua_tolstring(L,1,&len);
	if(s==NULL)
		return 0;
	const char *sep=luaL_checkstring(L,2);
	char  *e;
	lua_newtable(L);
	while((e=memchr(s,*sep,len))!=NULL)
	{
		lua_pushlstring(L,s,e-s);
		lua_rawseti(L,-2,i++);
		len=len-(e-s+1);
		s=e+1;
	}
	if(len!=0)
	{
		lua_pushlstring(L,s,len);
		lua_rawseti(L,-2,i);
	}
	return 1;
}
int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,l_split);
	lua_setglobal(L,"split");
	lua_pushlstring(L,"hello\0:hi:pi\0",13);
	lua_setglobal(L,"str");
	luaL_loadstring(L,"t=split(str,':');print(table.unpack(t))");
	lua_call(L,0,0);
	lua_close(L);
	return 0;
}
