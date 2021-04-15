static int tconcat(lua_State *L)
{
	luaL_buffer b;
	int i;
	luaL_checktype(L,1,LUA_TTABLE);
	n=luaL_len(L,1);
	luaL_buffinit(L,&b);
	for(i=1;i<=n;i++)
	{
		lua_geti(L,1,i);
		luaL_addvalue(b);
	}
	luaL_pushresult(b);
	return 1;
}
