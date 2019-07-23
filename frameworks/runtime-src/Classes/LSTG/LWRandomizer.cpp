﻿#include "LWRandomizer.h"
#include "LuaWrapper.h"
using namespace std;
using namespace lstg;

#define check_rng(L, idx) (static_cast<fcyRandomWELL512*>(luaL_checkudata(L, idx, TYPENAME_RANDGEN)))

void RandomizerWrapper::Register(lua_State* L)noexcept
{
	struct WrapperImplement
	{
		static int Seed(lua_State* L)noexcept
		{
			auto p = check_rng(L, 1);
			p->SetSeed(uint32_t(luaL_checknumber(L, 2)));
			return 0;
		}
		static int GetSeed(lua_State* L)noexcept
		{
			auto p = check_rng(L, 1);
			lua_pushnumber(L, lua_Number(p->GetRandSeed()));
			return 1;
		}
		static int Int(lua_State* L)noexcept
		{
			auto p = check_rng(L, 1);
			int a = luaL_checkinteger(L, 2), b = luaL_checkinteger(L, 3);
			lua_pushinteger(L, a + static_cast<int32_t>(p->GetRandUInt(static_cast<uint32_t>(b - a))));
			return 1;
		}
		static int Float(lua_State* L)noexcept
		{
			auto p = check_rng(L, 1);
			double a = luaL_checknumber(L, 2), b = luaL_checknumber(L, 3);
			lua_pushnumber(L, p->GetRandFloat(float(a), float(b)));
			return 1;
		}
		static int Sign(lua_State* L)noexcept
		{
			auto p = check_rng(L, 1);
			lua_pushinteger(L, p->GetRandUInt(1) * 2 - 1);
			return 1;
		}
		static int Meta_ToString(lua_State* L)noexcept
		{
			auto p = check_rng(L, 1);
			lua_pushfstring(L, "lstg.Rand object 0x%x", p);
			return 1;
		}
	};

	luaL_Reg tMethods[] =
	{
		{ "Seed", &WrapperImplement::Seed },
		{ "GetSeed", &WrapperImplement::GetSeed },
		{ "Int", &WrapperImplement::Int },
		{ "Float", &WrapperImplement::Float },
		{ "Sign", &WrapperImplement::Sign },
		{nullptr, nullptr }
	};
	luaL_Reg tMetaTable[] =
	{
		{ "__tostring", &WrapperImplement::Meta_ToString },
		{nullptr, nullptr }
	};

	luaL_openlib(L, TYPENAME_RANDGEN, tMethods, 0);  // t
	luaL_newmetatable(L, TYPENAME_RANDGEN);  // t mt
	luaL_openlib(L, nullptr, tMetaTable, 0);  // t mt
	lua_pushliteral(L, "__index");  // t mt s
	lua_pushvalue(L, -3);  // t mt s t
	lua_rawset(L, -3);  // t mt (mt["__index"] = t)
	lua_pushliteral(L, "__metatable");  // t mt s
	lua_pushvalue(L, -3);  // t mt s t
	lua_rawset(L, -3);  // t mt (mt["__metatable"] = t) // make metatable readonly
	lua_pop(L, 2);
}

fcyRandomWELL512* RandomizerWrapper::CreateAndPush(lua_State* L)
{
	fcyRandomWELL512* p = static_cast<fcyRandomWELL512*>(lua_newuserdata(L, sizeof(fcyRandomWELL512)));
	new(p) fcyRandomWELL512();
	luaL_getmetatable(L, TYPENAME_RANDGEN);
	lua_setmetatable(L, -2);
	return p;
}
