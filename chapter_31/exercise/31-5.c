#include <stdarg.h>
#include <stdlib.h>
#include <lua.h>
#include <lauxlib.h>
#include <limits.h>
#define checkarray(L) (IntArray *)luaL_checkudata(L,1,"LuaInt.array");
typedef struct IntArray
{
	int size;
	int values[1];
}IntArray;
static void error(lua_State *L,const char *fmt,...)
{
	va_list argp;
	va_start(argp,fmt);
	vfprintf(stderr,fmt,argp);
	va_end(argp);
	exit(EXIT_FAILURE);
}
static int *getparams(lua_State *L)
{
	IntArray *a=checkarray(L);
	int index=(int)luaL_checkinteger(L,2)-1;
	luaL_argcheck(L,0<=index&&index<a->size,2,"index out of range");
	return &a->values[index];
}

static int array2string(lua_State *L)
{
	int index;
	luaL_Buffer b;
	luaL_buffinit(L,&b);
	IntArray *a=checkarray(L);
	lua_pushfstring(L,"array(%d)",a->size);
	luaL_addvalue(&b);
	for(index=0;index<a->size;index++)
	{
		lua_pushfstring(L," array[%d]=%d",index,a->values[index]);
		luaL_addvalue(&b);
	}
	luaL_pushresult(&b);
	return 1;
}

static int newarray(lua_State *L)
{
	int i;
	size_t nbytes;
	IntArray *a;
	int n=(int)luaL_checkinteger(L,1);
	luaL_argcheck(L,n>=1,1,"invalid size");
	nbytes=sizeof(IntArray)+(n-1)*sizeof(int);
	a=(IntArray *)lua_newuserdata(L,nbytes);
	a->size=n;
	for(i=0;i<n;i++)
		a->values[i]=0;
	luaL_getmetatable(L,"LuaInt.array");
	lua_setmetatable(L,-2);
	return 1;
}
static int setarray(lua_State *L)
{
	int *entry;
	entry=getparams(L);
	*entry=(int)luaL_checkinteger(L,3);
	return 0;
}
static int getarray(lua_State *L)
{
	int *entry;
	entry=getparams(L);
	lua_pushinteger(L,*entry);
	return 1;
}
static int getsize(lua_State *L)
{
	IntArray *a=checkarray(L);
	lua_pushinteger(L,a->size);
	return 1;
}
static const struct luaL_Reg arraylib_m[]=
{
	{"__newindex",setarray},
	{"__index",getarray},
	{"__len",getsize},
	{"__tostring",array2string},
	{NULL,NULL}
};
static const struct luaL_Reg arraylib_f[]=
{
	{"new",newarray},
	{NULL,NULL}
};
int luaopen_array(lua_State *L)
{
	luaL_newmetatable(L,"LuaInt.array");
	lua_pushvalue(L,-1);
	lua_setfield(L,-2,"__index");
	luaL_setfuncs(L,arraylib_m,0);
	luaL_newlib(L,arraylib_f);
	return 1;
}
