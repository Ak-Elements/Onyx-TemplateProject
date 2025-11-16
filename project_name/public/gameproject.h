#pragma once

#include <onyx/engine/enginesystem.h>

namespace Game
{
    class GameSystem : public Onyx::IEngineSystem
    {
    public:
        static constexpr Onyx::StringId32 TypeId = "Game::GameSystem";
        Onyx::StringId32 GetTypeId() const override { return TypeId; }

        void Init();
    };
}
