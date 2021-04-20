#include <lua.h>
#include <lauxlib.h>
#include <limits.h>
#define BITS_PER_WORD (CHAR_BIT*sizeof(unsigned int))
#define I_WORD(i) ((unsigned int)(i)/BITS_PER_WORD)
#define I_BIT(i) (1<<((unsigned int)(i)%BITS_PER_WORD))
#define checkarray(L) (BitArray *)luaL_checkudata(L,1,"LuaBook.array");
typedef struct BitArray
{
	int size;
	unsigned int values[1];
}BitArray;
static unsigned int *getparams(lua_State *L,unsigned int *mask)
{
	BitArray *a=checkarray(L);
	int index=(int)luaL_checkinteger(L,2)-1;
	luaL_argcheck(L,0<=index&&index<a->size,2,"index out of range");
	*mask=I_BIT(index);
	return &a->values[I_WORD(index)];
}
static int newarray(lua_State *L)
{
	int i;
	size_t nbytes;
	BitArray *a;
	int n=(int)luaL_checkinteger(L,1);
	luaL_argcheck(L,n>=1,1,"invalid size");
	nbytes=sizeof(BitArray)+I_WORD(n-1)*sizeof(unsigned int);
	a=(BitArray *)lua_newuserdata(L,nbytes);
	a->size=n;
	for(i=0;i<=I_WORD(n-1);i++)
		a->values[i]=0;
	luaL_getmetatable(L,"LuaBook.array");
	lua_setmetatable(L,-2);
	return 1;
}
static int setarray(lua_State *L)
{
	unsigned int mask;
	unsigned int *entry;
	entry=getparams(L,&mask);
	luaL_checkany(L,3);
	if(lua_toboolean(L,3))
		*entry|=mask;
	else
		*entry&=~mask;
	return 0;
}
static int getarray(lua_State *L)
{
	unsigned int mask;
	unsigned int *entry;
	entry=getparams(L,&mask);
	lua_pushboolean(L,*entry&mask);
	return 1;
}
static int getsize(lua_State *L)
{
	BitArray *a=checkarray(L);
	lua_pushinteger(L,a->size);
	return 1;
}
static const struct luaL_Reg arraylib[]=
{
	{"new",newarray},
	{"set",setarray},
	{"get",getarray},
	{"size",getsize},
	{NULL,NULL}
};
int luaopen_array(lua_State *L)
{
	luaL_newmetatable(L,"LuaBook.array");
	luaL_newlib(L,arraylib);
	return 1;
}
