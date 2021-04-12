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
static const struct luaL_Reg mylib[]=
{
	{"dir",l_dir},
	{NULL,NULL}
};
int luaopen_mylib(lua_State *L)		//把动态库的搜索路径添加一个当前目录，就可以方便测试
{
	luaL_newlib(L,mylib);
	return 1;
}
