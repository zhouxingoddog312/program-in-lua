#include <dirent.h>
#include <errno.h>
#include <string.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
static int l_dir(lua_State *L)
{
	DIR *dir;
	struct dirent *entry;
	int i;
	const char *path=luaL_checkstring(L,1);
	dir=opendir(path);
	if(dir==NULL)
	{
		lua_pushnil(L);
		lua_pushstring(L,strerror(errno));
		return 2;
	}
	lua_newtable(L);
	i=1;
	while((entry=readdir(dir))!=NULL)
	{
		lua_pushinteger(L,i++);
		lua_pushstring(L,entry->d_name);
		lua_settable(L,-3);
	}
	closedir(dir);
	return 1;
}
int main(void)		//just a test
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	lua_pushcfunction(L,l_dir);
	lua_setglobal(L,"ld");
	luaL_loadstring(L,"t=ld('/home/goddog312');print(table.unpack(t))");
	lua_pcall(L,0,0,0);
	return 0;
}
