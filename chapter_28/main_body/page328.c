#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#define MAX_COLOR 255

struct ColorTable
{
	char *name;
	unsigned char red,green,blue;
}colortable[]=
{
	{"WHITE",MAX_COLOR,MAX_COLOR,MAX_COLOR},
	{"RED",MAX_COLOR,0,0},
	{"GREEN",0,MAX_COLOR,0},
	{"BLUE",0,0,MAX_COLOR},
	{NULL,0,0,0}
};
void setcolorfield(lua_State *L,const char *index,int value)	//假定表位于栈顶
{
	lua_pushstring(L,index);
	lua_pushnumber(L,(double)value/MAX_COLOR);
	lua_settable(L,-3);
}
void setcolor(lua_State *L,struct ColorTable *ct)
{
	lua_newtable(L);	//创建一个空表，并压入栈
	setcolorfield(L,"red",ct->red);
	setcolorfield(L,"green",ct->green);
	setcolorfield(L,"blue",ct->blue);
	lua_setglobal(L,ct->name);
}

void error(lua_State *L,const char *fmt,...)
{
	va_list argp;
	va_start(argp,fmt);
	vfprintf(stderr,fmt,argp);
	va_end(argp);
	lua_close(L);
	exit(EXIT_FAILURE);
}

int getglobint(lua_State *L,const char *var)
{
	int isnum,result;
	lua_getglobal(L,var);
	result=(int)lua_tointegerx(L,-1,&isnum);
	if(!isnum)
		error(L,"'%s' should be a number\n",var);
	lua_pop(L,1);
	return result;
}
void load(lua_State *L,const char *fname,int *w,int *h)
{
	if(luaL_loadfile(L,fname)||lua_pcall(L,0,0,0))
		error(L,"can not run config. file:%s",lua_tostring(L,-1));
	*w=getglobint(L,"width");
	*h=getglobint(L,"height");
}
int getcolorfield(lua_State *L,const char *key)		//此处假定表已经位于栈顶
{
	int isnum,result;
	lua_pushstring(L,key);
	lua_gettable(L,-2);
	result=(int)(lua_tonumberx(L,-1,&isnum)*MAX_COLOR);
	if(!isnum)
		error(L,"invalid component '%s' in color",key);
	lua_pop(L,1);
	return result;
}
int main(void)
{
	lua_State *L=luaL_newstate();
	luaL_openlibs(L);
	int width,height,red,green,blue;

/*	用于注册颜色
	int i=0;
	while(colortable[i].name!=NULL)
		setcolor(L,&colortable[i++]);
*/

	load(L,"config",&width,&height);
	printf("width=%d	height=%d\n",width,height);

	lua_getglobal(L,"background");
/*
	if(!lua_istable(L,-1))
		error(L,"'background' is not a table");
	red=getcolorfield(L,"red");
	green=getcolorfield(L,"green");
	blue=getcolorfield(L,"blue");
*/
	if(lua_isstring(L,-1))
	{
		const char *colorname=lua_tostring(L,-1);
		int i;
		for(i=0;colortable[i].name!=NULL;i++)
		{
			if(strcmp(colorname,colortable[i].name)==0)
				break;
		}
		if(colorname==NULL)
			error(L,"invalid color name (%s)",colorname);
		else
		{
			red=colortable[i].red;
			green=colortable[i].green;
			blue=colortable[i].blue;
		}
	}
	else if(lua_istable(L,-1))
	{
		red=getcolorfield(L,"red");
		green=getcolorfield(L,"green");
		blue=getcolorfield(L,"blue");
	}
	else
		error(L,"invalid value for 'background'");

	printf("red=%d		green=%d	blue=%d\n",red,green,blue);
	lua_close(L);
	return 0;
}



