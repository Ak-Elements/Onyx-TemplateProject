#pragma once

#include <onyx/engine/enginesystem.h>

namespace Onyx::Ui
{
    class ImGuiSystem;
}

namespace Irrlicht
{
    class IrrlichtSystem : public Onyx::IEngineSystem
    {
    public:
        void Init();
    };
}
