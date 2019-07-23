﻿#pragma once
#include <string>
#include "cocos2d.h"
#include "../Math/XCollision.h"
#include "BlendMode.h"

namespace lstg
{
	enum class ResourceType
	{
		Texture = 1,
		Sprite,
		Animation,
		Music,
		SoundEffect,
		Particle,
		Font,
		FX,
		RenderTarget,
		Video
	};

	inline std::string tostring(ResourceType type)
	{
		switch (type)
		{
		case ResourceType::Animation: return "Animation";
		case ResourceType::Texture: return "Texture";
		case ResourceType::Sprite: return "Sprite";
		case ResourceType::Music: return "Music";
		case ResourceType::SoundEffect: return "SoundEffect";
		case ResourceType::Particle: return "Particle";
		case ResourceType::Font: return "Font";
		case ResourceType::FX: return "FX";
		case ResourceType::RenderTarget: return "RenderTarget";
		case ResourceType::Video: return "Video";
		default: return "Unknown Resource Type";
		}
	}

	inline const char* toluatype(ResourceType type)
	{
		switch (type)
		{
		case ResourceType::Animation: return "lstg.ResAnimation";
		case ResourceType::Texture: return "lstg.ResTexture";
		case ResourceType::Sprite: return "lstg.ResSprite";
		case ResourceType::Music: return "lstg.ResMusic";
		case ResourceType::SoundEffect: return "lstg.ResSound";
		case ResourceType::Particle: return "lstg.ResParticle";
		case ResourceType::Font: return "lstg.ResFont";
		case ResourceType::FX: return "lstg.ResFX";
		case ResourceType::RenderTarget: return "lstg.ResRenderTarget";
		case ResourceType::Video: return "lstg.ResVideo";
		default: return "lstg.Resource";
		}
	}


	class Resource : public cocos2d::Ref
	{
	protected:
		ResourceType resType;
		std::string resName;
		std::string resPath;
	public:
		ResourceType getType()const noexcept { return resType; }
		const std::string& getName()const noexcept { return resName; }
		virtual const std::string& getPath()const noexcept { return resPath; }
		virtual std::string getInfo() const;
		void pushLua(lua_State* L);
		static Resource* fromLua(lua_State* L, int idx, ResourceType type);

		Resource& operator=(const Resource&) = delete;
		Resource(const Resource&) = delete;

		Resource(ResourceType t, const std::string& name, const std::string& path = "");
		virtual ~Resource();
	};

	class ResourceColliable : public Resource
	{
	protected:
		XColliderType colliderType = XColliderType::Circle;
		double halfSizeX = 0.;
		double halfSizeY = 0.;
	public:
		XColliderType getColliderType() const noexcept { return colliderType; }
		double getHalfSizeX()const noexcept { return halfSizeX; }
		double getHalfSizeY()const noexcept { return halfSizeY; }

		virtual std::string getInfo() const override;

		ResourceColliable(
			ResourceType t, const std::string& name,
		    XColliderType colliType, const std::string& path = "");
		ResourceColliable(
			ResourceType t, const std::string& name,
		    XColliderType colliType, double a, double b, const std::string& path = "");
		virtual ~ResourceColliable();
	};

	class ResourceQuad : public ResourceColliable
	{
	private:
		cocos2d::V3F_C4B_T2F_Quad vertex;
		BlendMode* blendMode = BlendMode::Default;
	public:
		virtual void setVertex(const cocos2d::V3F_C4B_T2F_Quad& v) { vertex = v; }
		virtual cocos2d::V3F_C4B_T2F_Quad& getVertex() { return vertex; }

		virtual void setColor(const cocos2d::Color4B& color);
		virtual void setColor(const cocos2d::Color4B& color, int i);
		virtual void setAlpha(uint8_t alpha);

		cocos2d::Color4B getColor(int i = 0) const;

		BlendMode* getBlendMode()const { return blendMode; }
		void setBlendMode(BlendMode* blm) { blendMode = blm; }

		virtual std::string getInfo() const override;

		ResourceQuad(ResourceType t, const std::string& name,
			XColliderType colliType, double a, double b, const std::string& path = "");
		virtual ~ResourceQuad() = default;

		ResourceQuad& operator=(const ResourceQuad&) = delete;
		ResourceQuad(const ResourceQuad&) = delete;
	};
}
