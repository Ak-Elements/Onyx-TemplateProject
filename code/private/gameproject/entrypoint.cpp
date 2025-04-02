#include <gameproject/gameproject.h>

#include <onyx/application/application.h>

#include <editor/editormodule.h>

#include <onyx/filesystem/imagefile.h>
#include <onyx/gamecore/gamecore.h>

#include <onyx/graphics/graphicsapi.h>
#include <onyx/assets/assetsystem.h>
#include <onyx/ui/imguisystem.h>
#include <onyx/graphics/window.h>
#include <onyx/input/inputsystem.h>
#include <onyx/input/inputactionsystem.h>
#include <onyx/input/inputmodule.h>

#include <onyx/nodegraph/nodegraphmodule.h>
#include <onyx/volume/volumesystem.h>

namespace Onyx::Application
{
    void OnApplicationCreate(ApplicationSettings& /*settings*/)
    {
        // setup additional app settings if needed
    }

    void OnApplicationCreated(Application& application)
    {
        Assets::AssetSystem& assetSystem = application.AddSystem<Assets::AssetSystem>();

        Graphics::GraphicsSystem& graphicsSystem = application.AddSystem<Graphics::GraphicsSystem>();

        application.AddSystem<Input::InputSystem>();
        Input::InputActionSystem& inputActionSystem = application.AddSystem<Input::InputActionSystem>();

        NodeGraph::Init();

        application.AddSystem<Ui::ImGuiSystem>();

        application.AddSystem<GameCore::GameCoreSystem>();
        application.AddSystem<Volume::VolumeSystem>();
        application.AddSystem<Editor::EditorSystem>();

        const ApplicationSettings& settings = application.GetSettings();

        Reference<Input::InputActionsAsset> inputActionsAsset;
        assetSystem.GetAsset(settings.InputConfig, inputActionsAsset);
        inputActionSystem.SetActionsMapAsset(inputActionsAsset);

        Reference<Graphics::RenderGraph> mainRenderGraph;
        assetSystem.GetAsset(settings.GraphicSettings.DefaultRenderGraph, mainRenderGraph);

        Graphics::Window& window = graphicsSystem.GetWindow();
        window.SetIcon("engine:/onyx128x128.png");

        window.Show();
        graphicsSystem.GetGraphicsApi().SetRenderGraph(mainRenderGraph);

        application.AddSystem<Irrlicht::IrrlichtSystem>();
    }

    void OnApplicationShutdown(Application& /*application*/ )
    {
    }
}
