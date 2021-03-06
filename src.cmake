# sources, headers
set(GAME_HEADER
	${RUNTIME_SRC_ROOT}/Classes/Audio/lua_Audio_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/ALHeader.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/ALSupport.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoder.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderFlac.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderMp3.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderVorbis.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderWav.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioEffect.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioEngine.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioFilter.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioMacros.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioPool.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioRecordingDevice.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioSoundData.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioSource.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioStream.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/Common.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/Dither.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/dr_flac.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/dr_mp3.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/IMA4Util.h
	${RUNTIME_SRC_ROOT}/Classes/Audio/RiffUtils.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/ArrayObjectPool.hpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XThreadPool.hpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/ControllerHelper.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/LabelPool.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/MemPoolManager.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/WindowHelper.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XBinaryHelper.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XBuffer.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XFileDialog.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XFileUtils.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XLabel.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XProfiler.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XRand.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XRefAdapter.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XStream.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XTriangles.h
	${RUNTIME_SRC_ROOT}/Classes/Classes/XTrianglesCommand.h
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMemPool.h
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyHash.h
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyRandom.h
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyStopWatch.h
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyStringHelper.h
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyParser/fcyPathParser.h
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppAllocator.hpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppDefine.hpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppModel.hpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppPal.hpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/lua_x_L2D_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/AppMacros.h
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Model.h
	${RUNTIME_SRC_ROOT}/Classes/Live2D/XLive2D.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/CirularQueue.hpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/Dictionary.hpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ObjectPool.hpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/AppFrame.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/BlendMode.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/CollisionDetect.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentData.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataAni.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataBlend.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataColli.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataLabel.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataLight.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataParticle.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataTrasform.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataVertex.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentManager.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameClass.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObject.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectBentLaser.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectManager.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectPool.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectPropertyHash.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectSymbol.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameResources.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/Global.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GOSymbolBoolean.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GOSymbolNumber.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/InputManager.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LogSystem.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LuaWrapper.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LuaWrapperEx.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWBuiltInFunction.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWColor.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWProfiler.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWRandomizer.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Audio.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Frame.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Graph.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Input.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Math.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Object.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Render.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Text.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/Renderer.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResAnimation.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResAudio.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResBase.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResFont.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResFX.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResourceMgr.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResParticle.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResRenderTarget.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResSprite.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResTexture.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UnicodeStringEncoding.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilColor.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilGLDefinition.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/Utility.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilLua.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilLuaConversion.h
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilLuaRes.h
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_BentLaser_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_BlendMode_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Buffer_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_cc_controller_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_cc_controller_manual.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_FileDialog_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_LogSystem_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_ObjSym_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_ParticlePool_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Random_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_ResourceMgr_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Resource_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Stream_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Triangles_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_WindowHelper_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_cc_ui_fix.h
	${RUNTIME_SRC_ROOT}/Classes/Math/meow_fft.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XCollision.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XComplex.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XConstant.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XDistance.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XEquation.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XFFT.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XIntersect.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XMath.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XRandom.h
	${RUNTIME_SRC_ROOT}/Classes/Math/XSpline.h
	${RUNTIME_SRC_ROOT}/Classes/reader/CreatorReader.h
	${RUNTIME_SRC_ROOT}/Classes/reader/CreatorReader_generated.h
	${RUNTIME_SRC_ROOT}/Classes/reader/Macros.h
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/AnimateClip.h
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/AnimationClip.h
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/AnimationClipProperties.h
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/AnimationManager.h
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/Bezier.h
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/Easing.h
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/Collider.h
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/ColliderManager.h
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/Contract.h
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/Intersection.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/DragonBonesHeaders.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/Animation.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/AnimationState.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/BaseTimelineState.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/IAnimateble.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/TimelineState.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/WorldClock.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/Armature.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/Bone.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/IArmatureDisplay.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/Slot.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/TransformObject.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCArmatureDisplay.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCDragonBonesHeaders.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCFactory.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCSlot.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCTextureData.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/core/BaseObject.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/core/DragonBones.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/events/EventObject.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/factories/BaseFactory.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/geom/ColorTransform.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/geom/Matrix.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/geom/Point.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/geom/Rectangle.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/geom/Transform.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/AnimationData.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/ArmatureData.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/DragonBonesData.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/FrameData.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/TimelineData.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/parsers/DataParser.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/parsers/JSONDataParser.h
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/textures/TextureData.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/code_generators.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/flatbuffers.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/grpc.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/hash.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/idl.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/reflection.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/reflection_generated.h
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers/util.h
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/creator_reader_bindings.hpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/dragonbones/lua_dragonbones_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/dragonbones/lua_dragonbones_manual.hpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/reader/lua_creator_reader_auto.hpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/reader/lua_creator_reader_manual.hpp
	${RUNTIME_SRC_ROOT}/Classes/reader/ui/PageView.h
	${RUNTIME_SRC_ROOT}/Classes/reader/ui/RichtextStringVisitor.h
	${RUNTIME_SRC_ROOT}/Classes/Video/SpriteVideo.h
	${RUNTIME_SRC_ROOT}/Classes/Video/VideoDecoder.h
	${RUNTIME_SRC_ROOT}/Classes/Video/VideoHeader.h
	${RUNTIME_SRC_ROOT}/Classes/Video/VideoMacros.h
	${RUNTIME_SRC_ROOT}/Classes/Video/VideoStream.h
	${RUNTIME_SRC_ROOT}/Classes/Video/VideoStruct.h
)
set(GAME_SOURCE
	${RUNTIME_SRC_ROOT}/Classes/Audio/ALSupport.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoder.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderFlac.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderMp3.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderVorbis.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioDecoderWav.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioEffect.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioEngine.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioFilter.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioMacros.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioPool.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioRecordingDevice.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioSoundData.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioSource.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/AudioStream.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/Common.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/lua_Audio_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/Audio/RiffUtils.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/ControllerHelper.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/LabelPool.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/MemPoolManager.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/WindowHelper.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XBinaryHelper.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XBuffer.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XFileDialog.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XFileUtils.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XLabel.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XProfiler.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XRand.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XRefAdapter.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XStream.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XTriangles.cpp
	${RUNTIME_SRC_ROOT}/Classes/Classes/XTrianglesCommand.cpp
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyHash.cpp
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyRandom.cpp
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyStopWatch.cpp
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc/fcyStringHelper.cpp
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyParser/fcyPathParser.cpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppAllocator.cpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppDefine.cpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppModel.cpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/LAppPal.cpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/lua_x_L2D_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Model.cpp
	${RUNTIME_SRC_ROOT}/Classes/Live2D/XLive2D.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/AppFrame.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/BlendMode.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/CollisionDetect.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentData.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataAni.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataBlend.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataColli.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataLabel.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataLight.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataParticle.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataTrasform.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentDataVertex.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ComponentManager.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameClass.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObject.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectBentLaser.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectManager.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectPool.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectPropertyHash.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GameObjectSymbol.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GOSymbolBoolean.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/GOSymbolNumber.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/InputManager.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LogSystem.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LuaWrapper.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LuaWrapperEx.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWBuiltInFunction.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWColor.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWProfiler.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LWRandomizer.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Audio.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Frame.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Graph.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Input.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Math.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Object.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Render.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/LW_Text.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/Renderer.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResAnimation.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResAudio.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResBase.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResFont.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResFX.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResourceMgr.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResParticle.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResRenderTarget.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResSprite.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/ResTexture.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UnicodeStringEncoding.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilColor.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilGLDefinition.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/Utility.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilLua.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilLuaConversion.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilLuaRes.cpp
	${RUNTIME_SRC_ROOT}/Classes/LSTG/UtilShader.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_BentLaser_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_BlendMode_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Buffer_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_cc_controller_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_cc_controller_manual.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_cc_ui_fix.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_FileDialog_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_LogSystem_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_ObjSym_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_ParticlePool_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Random_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_ResourceMgr_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Resource_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Stream_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_Triangles_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings/lua_WindowHelper_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XCollision.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XComplex.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XDistance.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XEquation.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XFFT.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XIntersect.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XRandom.cpp
	${RUNTIME_SRC_ROOT}/Classes/Math/XSpline.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/CreatorReader.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/AnimateClip.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/AnimationClip.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/AnimationManager.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/Bezier.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/animation/Easing.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/Collider.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/ColliderManager.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/Contract.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/collider/Intersection.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/Animation.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/AnimationState.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/TimelineState.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation/WorldClock.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/Armature.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/Bone.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature/Slot.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCArmatureDisplay.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCFactory.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCSlot.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx/CCTextureData.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/core/BaseObject.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/events/EventObject.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/factories/BaseFactory.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/AnimationData.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/ArmatureData.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/DragonBonesData.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/FrameData.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model/TimelineData.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/parsers/DataParser.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/parsers/JSONDataParser.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/textures/TextureData.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/creator_reader_bindings.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/dragonbones/lua_dragonbones_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/dragonbones/lua_dragonbones_manual.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/reader/lua_creator_reader_auto.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/reader/lua_creator_reader_manual.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/ui/PageView.cpp
	${RUNTIME_SRC_ROOT}/Classes/reader/ui/RichtextStringVisitor.cpp
	${RUNTIME_SRC_ROOT}/Classes/Video/SpriteVideo.cpp
	${RUNTIME_SRC_ROOT}/Classes/Video/VideoDecoder.cpp
)

# sources need to compile info, include dirs and source files
include_directories(
	${RUNTIME_SRC_ROOT}/Classes/Audio
	${RUNTIME_SRC_ROOT}/Classes/Classes
	${RUNTIME_SRC_ROOT}/Classes/fcyLib
	${RUNTIME_SRC_ROOT}/Classes/Live2D
	${RUNTIME_SRC_ROOT}/Classes/LSTG
	${RUNTIME_SRC_ROOT}/Classes/LuaBindings
	${RUNTIME_SRC_ROOT}/Classes/LuaExtensions
	${RUNTIME_SRC_ROOT}/Classes/Math
	${RUNTIME_SRC_ROOT}/Classes/reader
	${RUNTIME_SRC_ROOT}/Classes/Video
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyMisc
	${RUNTIME_SRC_ROOT}/Classes/fcyLib/fcyParser
	${RUNTIME_SRC_ROOT}/Classes/imgui
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Effect
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Id
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Math
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Model
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Motion
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Physics
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Rendering
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Type
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Utils
	${RUNTIME_SRC_ROOT}/Classes/Live2D/Framework/src/Rendering/OpenGL
	${RUNTIME_SRC_ROOT}/Classes/LuaExtensions/lfs
	${RUNTIME_SRC_ROOT}/Classes/LuaExtensions/lpeg
	${RUNTIME_SRC_ROOT}/Classes/reader/animation
	${RUNTIME_SRC_ROOT}/Classes/reader/collider
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones
	${RUNTIME_SRC_ROOT}/Classes/reader/flatbuffers
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings
	${RUNTIME_SRC_ROOT}/Classes/reader/ui
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/animation
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/armature
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/cocos2dx
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/core
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/events
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/factories
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/geom
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/model
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/parsers
	${RUNTIME_SRC_ROOT}/Classes/reader/dragonbones/textures
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/dragonbones
	${RUNTIME_SRC_ROOT}/Classes/reader/lua-bindings/reader
	${RUNTIME_SRC_ROOT}/external/Cubism/include
)

if(WINDOWS)
    list(APPEND GAME_HEADER
         ${RUNTIME_SRC_ROOT}/proj.win32/WindowHelperWin32.h
         )
	list(APPEND GAME_SOURCE ${cc_common_res})
	list(APPEND GAME_SOURCE
         ${RUNTIME_SRC_ROOT}/proj.win32/WindowHelperWin32.cpp
         )
endif()
