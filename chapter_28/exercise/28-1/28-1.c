#include <stdio.h>
#include <stdlib.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
void error(lua_State *L,const char *fmt,...)
{
	va_list argp;
	va_start(argp,fmt);
	vfprintf(stderr,fmt,argp);
	va_end(argp);
	lua_close(L);
	exit(EXIT_FAILURE);
}

int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	if(luaL_loadfile(L,"28-1.lua")||lua_pcall(L,0,0,0))
		error(L,"function file load wrong:%s",lua_tostring(L,-1));
	lua_getglobal(L,"foo");
	lua_pushstring(L,"x+1");
	if(lua_pcall(L,1,5,0)!=LUA_OK)
		error(L,"error running function 'foo':%s",lua_tostring(L,-1));
	int index,r,isnum;
	for(index=-5;index<=-1;index++)
	{
		r=lua_tointegerx(L,index,&isnum);
		if(!isnum)
			error(L,"function 'foo' should return integer");
		for(int i=0;i<r;i++)
			printf("*");
		printf("\n");
	}
	lua_close(L);
	return 0;
}

