#include <stdio.h>
#include <stdarg.h>
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

/*
double f(lua_State *L,double x,double y)
{
	int isnum;
	double z;
	lua_getglobal(L,"f");
	lua_pushnumber(L,x);
	lua_pushnumber(L,y);
	if(lua_pcall(L,2,1,0)!=LUA_OK)
		error(L,"error running function 'f':%s",lua_tostring(L,-1));
	z=lua_tonumberx(L,-1,&isnum);
	if(!isnum)
		error(L,"function 'f' should return a number");
	lua_pop(L,1);
	return z;
}
*/

void call_va(lua_State *L,const char *func,const char *sig,...)
{
	va_list vl;
	int narg,nres;
	va_start(vl,sig);
	lua_getglobal(L,func);
	for(narg=0;*sig;narg++)
	{
		lua_checkstack(L,1,"too many argument");
		switch(*sig++)
		{
			case 'd':
				lua_pushnumber(L,va_arg(vl,double));
				break;
			case 'i':
				lua_pushinteger(L,va_arg(vl,int));
				break;
			case 's':
				lua_pushstring(L,va_arg(vl,char *));
				break;
			case '>':
				goto endargs;
			default:
				error(L,"invalid opting (%c)",*(sig-1));
		}
	}
endargs:

	nres=strlen(sig);
	if(lua_pcall(L,narg,nres,0)!=0)
		error(L,"error calling '%s':'%s'",func,lua_tostring(L,-1));
	nres=-nres;
	while(*sig)
	{
		switch(*sig++)
		{
			case 'd':
				{
					int isnum;
					double n=lua_tonumberx(L,nres,&isnum);
					if(!isnum)
						error(L,"wrong result type");
					*va_arg(vl,double *)=n;
					break;
				}
			case 'i':
				{
					int isnum;
					int n=lua_tointegerx(L,nres,&isnum);
					if(!isnum)
						error(L,"wrong result type");
					*va_arg(vl,int *)=n;
					break;
				}
			case 's':
				{
					const char *s=lua_tostring(L,nres);
					if(s==NULL)
						error(L,"wrong result type");
					*va_arg(vl,char **)=s;
					break;
				}
			default:
				error(L,"invalid option (%c)",*(sig-1));
		}
		nres++;
	}
	va_end(vl);
}
