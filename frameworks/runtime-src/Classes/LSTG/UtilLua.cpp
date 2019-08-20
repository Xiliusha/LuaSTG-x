﻿#include "UtilLua.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "scripting/lua-bindings/manual/LuaBasicConversions.h"
#include "Utility.h"
#include "LuaWrapper.h"
#include "AppFrame.h"
#include "LogSystem.h"
#include "LWColor.h"

using namespace std;
using namespace lstg;
using namespace cocos2d;

#define IMPL_BASIC_TO_NATIVE(_F, _T) bool lua::_F(lua_State* L, int lo, _T* outValue, const char* funcName){\
	return ::_F(L, lo, outValue, funcName); }
IMPL_BASIC_TO_NATIVE(luaval_to_boolean, bool);
IMPL_BASIC_TO_NATIVE(luaval_to_number, double);
IMPL_BASIC_TO_NATIVE(luaval_to_std_string, std::string);
IMPL_BASIC_TO_NATIVE(luaval_to_rect, Rect);
IMPL_BASIC_TO_NATIVE(luaval_to_size, Size);
IMPL_BASIC_TO_NATIVE(luaval_to_color3b, Color3B);
IMPL_BASIC_TO_NATIVE(luaval_to_color4b, Color4B);
IMPL_BASIC_TO_NATIVE(luaval_to_color4f, Color4F);
IMPL_BASIC_TO_NATIVE(luaval_to_physics_material, cocos2d::PhysicsMaterial);
IMPL_BASIC_TO_NATIVE(luaval_to_affinetransform, AffineTransform);
IMPL_BASIC_TO_NATIVE(luaval_to_fontdefinition, FontDefinition);
IMPL_BASIC_TO_NATIVE(luaval_to_mat4, cocos2d::Mat4);
IMPL_BASIC_TO_NATIVE(luaval_to_vec2, cocos2d::Vec2);
IMPL_BASIC_TO_NATIVE(luaval_to_vec3, cocos2d::Vec3);
IMPL_BASIC_TO_NATIVE(luaval_to_vec4, cocos2d::Vec4);
IMPL_BASIC_TO_NATIVE(luaval_to_blendfunc, cocos2d::BlendFunc);
IMPL_BASIC_TO_NATIVE(luaval_to_ttfconfig, cocos2d::TTFConfig);
IMPL_BASIC_TO_NATIVE(luaval_to_uniform, cocos2d::Uniform);
IMPL_BASIC_TO_NATIVE(luaval_to_vertexattrib, cocos2d::VertexAttrib);
IMPL_BASIC_TO_NATIVE(luaval_to_ccvalue, cocos2d::Value);
IMPL_BASIC_TO_NATIVE(luaval_to_mesh_vertex_attrib, cocos2d::MeshVertexAttrib);
IMPL_BASIC_TO_NATIVE(luaval_to_quaternion, cocos2d::Quaternion);
IMPL_BASIC_TO_NATIVE(luaval_to_texparams, cocos2d::Texture2D::TexParams);
IMPL_BASIC_TO_NATIVE(luaval_to_v3f_c4b_t2f, cocos2d::V3F_C4B_T2F);
IMPL_BASIC_TO_NATIVE(luaval_to_tex2f, cocos2d::Tex2F);

#define IMPL_BASIC_FROM_NATIVE(_F, _T) void lua::_F(lua_State* L, const _T& inValue){\
	::_F(L, inValue); }
IMPL_BASIC_FROM_NATIVE(vec2_to_luaval, cocos2d::Vec2);
IMPL_BASIC_FROM_NATIVE(vec3_to_luaval, cocos2d::Vec3);
IMPL_BASIC_FROM_NATIVE(vec4_to_luaval, cocos2d::Vec4);
IMPL_BASIC_FROM_NATIVE(size_to_luaval, cocos2d::Size);
IMPL_BASIC_FROM_NATIVE(rect_to_luaval, cocos2d::Rect);
IMPL_BASIC_FROM_NATIVE(color3b_to_luaval, cocos2d::Color3B);
IMPL_BASIC_FROM_NATIVE(color4b_to_luaval, cocos2d::Color4B);
IMPL_BASIC_FROM_NATIVE(color4f_to_luaval, cocos2d::Color4F);
IMPL_BASIC_FROM_NATIVE(affinetransform_to_luaval, cocos2d::AffineTransform);
IMPL_BASIC_FROM_NATIVE(physics_material_to_luaval, cocos2d::PhysicsMaterial);
IMPL_BASIC_FROM_NATIVE(fontdefinition_to_luaval, cocos2d::FontDefinition);
IMPL_BASIC_FROM_NATIVE(mat4_to_luaval, cocos2d::Mat4);
IMPL_BASIC_FROM_NATIVE(blendfunc_to_luaval, cocos2d::BlendFunc);
IMPL_BASIC_FROM_NATIVE(ttfconfig_to_luaval, cocos2d::TTFConfig);
IMPL_BASIC_FROM_NATIVE(uniform_to_luaval, cocos2d::Uniform);
IMPL_BASIC_FROM_NATIVE(vertexattrib_to_luaval, cocos2d::VertexAttrib);
IMPL_BASIC_FROM_NATIVE(ccvalue_to_luaval, cocos2d::Value);
IMPL_BASIC_FROM_NATIVE(mesh_vertex_attrib_to_luaval, cocos2d::MeshVertexAttrib);
IMPL_BASIC_FROM_NATIVE(quaternion_to_luaval, cocos2d::Quaternion);
IMPL_BASIC_FROM_NATIVE(texParams_to_luaval, cocos2d::Texture2D::TexParams);

template<typename T>
bool __luaval_to_integer(lua_State* L, int lo,
	typename std::enable_if<std::is_same<T, int64_t>::value || std::is_same<T, uint64_t>::value, T>::type* outValue,
	size_t targetSize, const char* funcName)
{
	if (nullptr == L || nullptr == outValue)
		return false;
	const auto type = lua_type(L, lo);
	if (type == lua::LUA_TCDATA)
	{
		if(std::is_same<T, int64_t>::value)
			lua_pushstring(L, "ffi.cast_int64");
		else
			lua_pushstring(L, "ffi.cast_uint64");
		lua_rawget(L, LUA_REGISTRYINDEX);
		const auto tfunc = lua_type(L, -1);
		if (tfunc == LUA_TFUNCTION)
		{
			void* ret = nullptr;
			lua_pushvalue(L, lo);
			lua_pushlightuserdata(L, &ret);
			if (lua_pcall(L, 1, 1, 0) == 0)
			{
				lua::luaval_to_cptr(L, -1, &ret);
				if (ret)
				{
					*outValue = *(T*)ret;
					return true;
				}
			}
		}
		else
		{
			lua_pop(L, 1);
		}
	}
	tolua_Error tolua_err;
	bool is_number = type == LUA_TNUMBER;
	if (!is_number)
	{
		tolua_err.index = lo; tolua_err.array = 0; tolua_err.type = "number";
#if COCOS2D_DEBUG >=1
		luaval_to_native_err(L, "#ferror:", &tolua_err, funcName);
#endif
		return false;
	}
	if (std::is_same<T, int64_t>::value && targetSize == 4)
	{
		// see luaval_to_int32
		const uint32_t estimateValue = (uint32_t)lua_tonumber(L, lo);
		if (estimateValue == (uint32_t)std::numeric_limits<int32_t>::min())
			*outValue = (int32_t)estimateValue;
		else
			*outValue = (int64_t)(int32_t)lua_tonumber(L, lo);
	}
	else
		*outValue = (T)tolua_tonumber(L, lo, 0);
	return true;
}

bool lua::_luaval_to_integer(lua_State* L, int lo, int64_t* outValue, size_t targetSize, const char* funcName)
{
	return __luaval_to_integer<int64_t>(L, lo, outValue, targetSize, funcName);
}

bool lua::_luaval_to_unsigned_integer(lua_State* L, int lo, uint64_t* outValue, size_t targetSize, const char* funcName)
{
	return __luaval_to_integer<uint64_t>(L, lo, outValue, targetSize, funcName);
}

LuaStack* lua::stack()
{
	return LuaEngine::getInstance()->getLuaStack();
}

int lua::StackTraceback(lua_State *L)
{
	lua_getfield(L, LUA_GLOBALSINDEX, "debug");  // errmsg t
	if (!lua_istable(L, -1))
	{
		lua_pop(L, 1);
		return 1;
	}
	lua_getfield(L, -1, "traceback");  // errmsg t f
	if (!lua_isfunction(L, -1) && !lua_iscfunction(L, -1))
	{
		lua_pop(L, 2);
		return 1;
	}
	lua_pushvalue(L, 1);  // errmsg t f errmsg
	lua_pushinteger(L, 2);  // errmsg t f errmsg 2
	if (0 != lua_pcall(L, 2, 1, 0))  // errmsg t 
	{
		LWARNING("error in traceback (%s)", lua_tostring(L, -1));
		lua_pop(L, 2);
	}
	return 1;
}

int push_table_instance(lua_State* L, int lo)
{
	if (lua_istable(L, lo)) {
		lua_pushstring(L, ".c_instance");
		lua_gettable(L, lo);
		if (lua_isuserdata(L, -1)) {
			lua_replace(L, lo);
			return 1;
		}
		lua_pop(L, 1);
		return 0;
	}
	return 0;
}
int lua::isusertype(lua_State* L, int lo, const char* type)
{
	// note: lo must be positive
	if (lo < 0)
		lo = lua_gettop(L) + lo + 1;
	if (lo <= 0)
		return 0;
	if (!lua_isuserdata(L, lo)) {
		if (!push_table_instance(L, lo)) {
			return 0;
		}
	}
	if (lua_getmetatable(L, lo))        /* if metatable? */
	{
		lua_rawget(L, LUA_REGISTRYINDEX);  /* get registry[mt] */
		const char *tn = lua_tostring(L, -1);
		const int r = tn && (strcmp(tn, type) == 0);
		lua_pop(L, 1);
		if (r)
			return 1;
		else
		{
			/* check if it is a specialized class */
			lua_pushstring(L, "tolua_super");
			lua_rawget(L, LUA_REGISTRYINDEX); /* get super */
			lua_getmetatable(L, lo);
			lua_rawget(L, -2);                /* get super[mt] */
			if (lua_istable(L, -1))
			{
				lua_pushstring(L, type);
				lua_rawget(L, -2);                /* get super[mt][type] */
				const int b = lua_toboolean(L, -1);
				lua_pop(L, 3);
				if (b)
					return 1;
			}
		}
	}
	return 0;
}

void* lua::_tousertype(lua_State* L, int lo)
{
	if (!lua_isuserdata(L, lo)) {
		if (!push_table_instance(L, lo))
			return nullptr;
	}
	const auto u = lua_touserdata(L, lo);
	return u ? *(void**)u : nullptr;
}

bool lua::_luaval_to_color4b(lua_State* L, int lo, Color4B* outValue, const char* funcName)
{
	if (lua_type(L, lo) == LUA_TUSERDATA)
	{
		const auto c = luaL_checkcolor(L, lo);
		if (!c)
			return false;
		// need copy because c is lua value and can be released
		*outValue = *c;
		return true;
	}
	else
	{
		return ::luaval_to_color4b(L, lo, outValue, funcName);
	}
}

void lua::_color4b_to_luaval(lua_State* L, const Color4B& cc)
{
	const auto p = ColorWrapper::CreateAndPush(L);
	*p = cc;
}

bool lua::_luaarray_to_numbers(lua_State* L, int lo, const std::function<void(double)>& callBack)
{
	if (!L || !callBack || lua_gettop(L) < lo)
		return false;
	tolua_Error tolua_err;
	if (!tolua_istable(L, lo, 0, &tolua_err))
		return false;
	bool ok = true;
	const size_t len = lua_objlen(L, lo);
	for (size_t i = 0; i < len; i++)
	{
		lua_pushnumber(L, i + 1);
		lua_gettable(L, lo);
		if (lua_isnumber(L, -1))
			callBack(tolua_tonumber(L, -1, 0));
		else
			ok = false;
		lua_pop(L, 1);
		if (!ok)
			break;
	}
	return ok;
}

bool lua::luaval_to_unsigned_long_long(lua_State* L, int lo, unsigned long long* outValue, const char* funcName)
{
	if (NULL == L || NULL == outValue)
		return false;

	bool ok = true;

	tolua_Error tolua_err;
	if (!tolua_isnumber(L, lo, 0, &tolua_err))
	{
#if COCOS2D_DEBUG >=1
		luaval_to_native_err(L, "#ferror:", &tolua_err, funcName);
#endif
		ok = false;
	}

	if (ok)
	{
		*outValue = (unsigned long long)tolua_tonumber(L, lo, 0);
	}

	return ok;
}

bool lua::luaval_to_V3F_C4B_T2F_Quad(lua_State* L, int lo, V3F_C4B_T2F_Quad* outValue, const char* /*funcName*/)
{
	if (!lua_istable(L, lo))return false;
	V3F_C4B_T2F_Quad ret;
	const auto p = (V3F_C4B_T2F*)&ret;
	for (auto i = 0; i < 4; ++i)
	{
		lua_rawgeti(L, lo, i + 1);
		if (!lua_istable(L, -1))return false;
		lua_rawgeti(L, -1, 4);
		Color4B color;
		if (!_luaval_to_color4b(L, -1, &color))
			return false;
		lua_pop(L, 1);
		lua_rawgeti(L, -1, 1);
		lua_rawgeti(L, -2, 2);
		lua_rawgeti(L, -3, 3);
		p[i].vertices.x = lua_tonumber(L, -3);
		p[i].vertices.y = lua_tonumber(L, -2);
		p[i].vertices.z = lua_tonumber(L, -1);
		lua_pop(L, 3);
		lua_rawgeti(L, -1, 1);
		lua_rawgeti(L, -2, 2);
		p[i].texCoords.u = lua_tonumber(L, -2);
		p[i].texCoords.v = lua_tonumber(L, -1);
		lua_pop(L, 2);
	}
	*outValue = ret;
	return true;
}

void lua::V3F_C4B_T2F_Quad_to_luaval(lua_State* L, V3F_C4B_T2F_Quad quad)
{
	lua_createtable(L, 0, 4);
	const auto p = (V3F_C4B_T2F*)&quad;
	for (auto i = 0; i < 4; ++i)
	{
		const auto v = p[i];
		lua_createtable(L, 6, 0);
		lua_pushnumber(L, v.vertices.x);
		lua_rawseti(L, -2, 1);
		lua_pushnumber(L, v.vertices.y);
		lua_rawseti(L, -2, 2);
		lua_pushnumber(L, v.vertices.z);
		lua_rawseti(L, -2, 3);
		_color4b_to_luaval(L, v.colors);
		lua_rawseti(L, -2, 4);
		lua_pushnumber(L, v.texCoords.u);
		lua_rawseti(L, -2, 5);
		lua_pushnumber(L, v.texCoords.v);
		lua_rawseti(L, -2, 6);
		lua_rawseti(L, -2, i + 1);
	}
}

bool lua::luaval_to_BlendMode(lua_State* L, int lo, BlendMode** outValue, const char* /*funcName*/)
{
	if (!outValue)return false;
	const auto type = lua_type(L, lo);
	BlendMode* b = nullptr;
	if (type == LUA_TNUMBER)
		b = BlendMode::getByID(luaL_checkinteger(L, lo));
	else if (type == LUA_TSTRING)
		b = BlendMode::getByName(luaL_checkstring(L, lo));
	else
		b = tousertype<BlendMode>(L, lo, "lstg.BlendMode");
	if (!b)return false;
	*outValue = b;
	return true;
}

void lua::BlendMode_to_luaval(lua_State* L, BlendMode* blendMode)
{
	if(blendMode)
		object_to_luaval<lstg::BlendMode>(L, "lstg.BlendMode", blendMode);
	else
		lua_pushnil(L);
}

bool lua::luaval_to_ColliderType(lua_State* L, int lo, XColliderType* outValue, const char* /*funcName*/)
{
	const auto type = lua_type(L, lo);
	if (type == LUA_TSTRING)
	{
		const auto v = xmath::collision::from_string(luaL_checkstring(L, lo));
		if (v == XColliderType::ColliderTypeNum)
			return false;
		*outValue = v;
		return true;
	}
	else if (type == LUA_TBOOLEAN)
	{
		if (lua_toboolean(L, lo))
			*outValue = XColliderType::OBB;
		else
			*outValue = XColliderType::Circle;
		return true;
	}
	else if (type == LUA_TNUMBER)
	{
		const auto i = luaL_checkinteger(L, lo);
		if (i < 0 || i >= (int)XColliderType::ColliderTypeNum)
			return false;
		*outValue = (XColliderType)i;
		return true;
	}
	return false;
}

void lua::ColliderType_to_luaval(lua_State* L, XColliderType colliderType)
{
	if (colliderType != XColliderType::Circle)
		lua_pushinteger(L, (lua_Integer)colliderType);
	else
		lua_pushboolean(L, false);
}

bool lua::luaval_to_GameObject(lua_State* L, int lo, GameObject** outValue, const char* /*funcName*/)
{
	const auto type = lua_type(L, lo);
	if (type == LUA_TTABLE)
	{
		lua_rawgeti(L, lo, 2);
		if (!lua_isnumber(L, -1))
		{
			lua_pop(L, 1);
			return false;
		}
		const auto id = size_t(lua_tonumber(L, -1));
		lua_pop(L, 1);
		const auto ret = LPOOL.GetPooledObject(id);
		if (ret&&ret->status != STATUS_FREE)
		{
			*outValue = ret;
			return true;
		}
	}
	if (type == LUA_TCDATA)
		return lua::luaval_to_cptr(L, lo, (void**)outValue);
	return false;
}

void lua::GameObject_to_luaval(lua_State* L, GameObject* obj)
{
	LPOOL.pushObject(L, obj);
	//lua::cptr_to_luaval(L, obj);
}

void lua::BaseLight_to_luaval(lua_State* L, BaseLight* light)
{
	if (light)
	{
		string type = "cc.BaseLight";
		switch (light->getLightType())
		{
		case LightType::DIRECTIONAL: type = "cc.DirectionLight"; break;
		case LightType::POINT: type = "cc.PointLight"; break;
		case LightType::SPOT: type = "cc.SpotLight"; break;
		case LightType::AMBIENT: type = "cc.AmbientLight"; break;
		default: ;
		}
		object_to_luaval<cocos2d::BaseLight>(L, type.c_str(), light);
	}
	else
		lua_pushnil(L);
}

bool lua::luaval_to_cptr(lua_State* L, int lo, void** outValue)
{
	const auto top = lua_gettop(L);
	if (lo < 0)
		lo = top + 1 + lo;
	if (lo<1 || lo>top)
	{
		*outValue = nullptr;
		return false;
	}
	lua_pushstring(L, "ffi.convert_ptr");
	lua_rawget(L, LUA_REGISTRYINDEX);
	const auto tfunc = lua_type(L, -1);
	if (tfunc == LUA_TFUNCTION)
	{
		void* ret = nullptr;
		lua_pushvalue(L, lo);
		lua_pushlightuserdata(L, &ret);
		if (lua_pcall(L, 2, 0, 0) == 0)
		{
			*outValue = ret;
			return true;
		}
		LERROR("failed to call ffi.convert_ptr");
		*outValue = nullptr;
		return false;
	}
	else
	{
		lua_pop(L, 1);
		*outValue = nullptr;
		return false;
	}
}

void lua::cptr_to_luaval(lua_State* L, void* ptr)
{
	if (!ptr)
		lua_pushnil(L);
	else
		lua_pushlightuserdata(L, ptr);
}

void lua::cptr_to_luaval(lua_State* L, void* ptr, const std::string& ptrType)
{
	if (!ptr)
		lua_pushnil(L);
	else
	{
		lua_pushstring(L, "ffi.cast_ptr");
		lua_rawget(L, LUA_REGISTRYINDEX);
		lua_pushlightuserdata(L, ptr);
		lua_pushlstring(L, ptrType.c_str(), ptrType.size());
		if (lua_pcall(L, 2, 1, 0) != 0)
		{
			LERROR("failed to call ffi.cast_ptr");
		}
	}
}

void lua::V3F_C4B_T2F_ptr_to_luaval(lua_State* L, V3F_C4B_T2F* ptr)
{
	if (!ptr)
		lua_pushnil(L);
	else
	{
		lua_pushstring(L, "ffi.cast_ptr_vert");
		lua_rawget(L, LUA_REGISTRYINDEX);
		lua_pushlightuserdata(L, ptr);
		if (lua_pcall(L, 1, 1, 0) != 0)
		{
			LERROR("failed to call ffi.cast_ptr_vert");
		}
	}
}

bool lua::luaval_to_async_callback(lua_State* L, int lo, std::function<void()>* outValue)
{
	const LUA_FUNCTION handler = toluafix_ref_function(L, lo, 0);
	if (handler == 0)
		return false;
	if (outValue)
	{
		*outValue = [=]()
		{
			LuaEngine::getInstance()->getLuaStack()->executeFunctionByHandler(handler, 0);
			// async_callback will ba called only once
			LuaEngine::getInstance()->removeScriptHandler(handler);
		};
	}
	return true;
}

void lua::ref_type_to_luaval(lua_State* L, cocos2d::Ref* ref, const char* typeID)
{
	if (ref)
	{
		std::string typeName;
		if (typeID)
			typeName = typeID;
		else
			typeName = typeid(*ref).name();
		const auto iter = g_luaType.find(typeName);
		auto type = "cc.Ref";
		if (g_luaType.end() != iter)
			type = iter->second.c_str();
		toluafix_pushusertype_ccobject(
			L, (int)ref->_ID, &ref->_luaID, (void*)ref, type);
	}
	else
	{
		lua_pushnil(L);
	}
}

//int lua::pushArray(lua_State* L, const std::vector<float>& arr)
//{
//	return pushArray(L, arr.data(), arr.size());
//}

//std::vector<float> lua::getArray(lua_State* L, int lo)
//{
//	const auto len = lua_objlen(L, lo);
//	std::vector<float> ret;
//	ret.reserve(len);
//	for (size_t i = 1; i <= len; i++)
//	{
//		lua_rawgeti(L, lo, i);
//		ret.push_back(luaL_checknumber(L, -1));
//	}
//	return ret;
//}

std::vector<float> lua::getArray(lua_State* L, int lo, const char* field)
{
	const auto len = lua_objlen(L, lo);
	std::vector<float> ret;
	ret.reserve(len);
	for (size_t i = 1; i <= len; i++)
	{
		lua_rawgeti(L, lo, i);
		lua_getfield(L, -1, field);
		ret.push_back(luaL_checknumber(L, -1));
		lua_pop(L, 1);
	}
	return ret;
}

std::vector<Vec2> lua::getVec2Array(lua_State* L, int lo)
{
	const auto len = lua_objlen(L, lo);
	std::vector<Vec2> ret;
	ret.reserve(len);
	for (size_t i = 1; i <= len; i++)
	{
		lua_rawgeti(L, lo, i);
		lua_rawgeti(L, -1, 1);
		const auto x = luaL_checknumber(L, -1);
		lua_rawgeti(L, -1, 2);
		const auto y = luaL_checknumber(L, -1);
		ret.emplace_back(x, y);
		lua_pop(L, 1);
	}
	return ret;
}

std::vector<Vec2> lua::getVec2Array(lua_State* L, int lo, const char* k1, const char* k2)
{
	const auto len = lua_objlen(L, lo);
	std::vector<Vec2> ret;
	ret.reserve(len);
	for (size_t i = 1; i <= len; i++)
	{
		lua_rawgeti(L, lo, i);
		lua_getfield(L, -1, k1);
		const auto x = luaL_checknumber(L, -1);
		lua_getfield(L, -1, k2);
		const auto y= luaL_checknumber(L, -1);
		ret.emplace_back(x, y);
		lua_pop(L, 1);
	}
	return ret;
}

int lua::pushCArray(lua_State* L, lua_Number* arr, uint32_t size)
{
	if (!arr || size == 0)return 0;
	lua_pushstring(L, "ffi.alloc_arr");
	lua_rawget(L, LUA_REGISTRYINDEX);
	const auto tfunc = lua_type(L, -1);
	if (tfunc == LUA_TFUNCTION)
	{
		lua_pushinteger(L, size);
		if (lua_pcall(L, 1, 1, 0) == 0)
		{
			void* p;
			if (luaval_to_cptr(L, -1, &p))
			{
				memcpy(p, arr, size * sizeof(lua_Number));
				return 1;
			}
			else
			{
				lua_pop(L, 1);
				LERROR("error when call luaval_to_cptr");
			}
		}
		else
		{
			LERROR("error when call ffi.alloc_arr");
		}
	}
	else
		lua_pop(L, 1);
	return 0;
}

#if CC_64BITS
#define HASH_OFFSET -3
#else
#define HASH_OFFSET -2
#endif

const char* lua::checkstring(lua_State* L, int lo, size_t* strlen, uint32_t* hash)
{
	auto ret = luaL_checklstring(L, lo, strlen);
	if (hash)
		*hash = ((uint32_t*)ret)[HASH_OFFSET];// hack into lua
	return ret;
}

const char* lua::tostring(lua_State* L, int lo, size_t* strlen, uint32_t* hash)
{
	auto ret = lua_tolstring(L, lo, strlen);
	if (hash)
		*hash = ((uint32_t*)ret)[HASH_OFFSET];
	return ret;
}

std::string lua::getClassNameByTypeID(const std::string& typeID)
{
	const auto it = g_luaType.find(typeID);
	if (it != g_luaType.end())
		return it->second;
	return "";
}
