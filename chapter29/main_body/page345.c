static int luaB_pcall(lua_State *L)
{
	int status;
	luaL_checkany(L,1);
	status=lua_pcall(L,lua_gettop(L)-1,LUA_MULTRET,0);
	lua_pushboolean(L,(status==LUA_OK));
	lua_insert(L,1);
	return lua_gettop(L);
}




static int finishpcall(lua_State *L,int status,intptr_t ctx)
{
	(void)ctx;
	status=(status!=LUA_OK&&status!=LUA_YIELD);
	lua_pushboolean(L,(status==0));
	lua_insert(L,1);
	return lua_gettop(L);
}
static int luaB_pcall(lua_State *L)
{
	int status;
	luaL_checkany(L,1);
	status=lua_pcallk(L,lua_gettop()-1,LUA_MULTRET,0,0,finishpcall);
	return finishpcall(L,status,0);
}
