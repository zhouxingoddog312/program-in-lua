#include <ctype.h>
#include <lauxlib.h>
static int str_upper(lua_State *L)
{
	size_t l;
	size_t i;
	luaL_Buffer b;
	const char *s=luaL_checklstring(L,1,&l);
	char *p=luaL_buffinitsize(L,&b,l);
	for(i=0;i<l;i++)
	{
		p[i]=toupper(uchar(s[i]));
	}
	luaL_pushresultsize(&b,l);
	return 1;
}
