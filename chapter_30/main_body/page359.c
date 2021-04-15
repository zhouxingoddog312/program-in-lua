//写入值
static char Key='k'
lua_pushlightuserdata(L,(void *)&Key);
lua_pushstring(L,myStr);
lua_settable(L,LUA_REGISTRYINDEX);

//获取值
lua_pushlightuserdata(L,(void *)Key);
lua_gettable(L,LUA_REGISTRYINDEX);
myStr=lua_tostring(L,-1);




//以下引入简化方法
static char Key='k'
lua_pushstring(L,myStr);
lua_rawsetp(L,LUA_REGISTRYINDEX,(void *)&Key);


lua_rawgetp(L,LUA_REGISTRYINDEX,(void *)&Key);
myStr=lua_tostring(L,-1);
