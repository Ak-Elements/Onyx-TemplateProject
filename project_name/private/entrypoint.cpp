#include <onyx/morton.h>
#include <onyx/application/application.h>

namespace Onyx
{
    void RegisterEngineModules();
}

namespace Onyx::Application
{
    void OnApplicationCreate()
    {
        // setup additional app settings if needed
        RegisterEngineModules();
    }

    void OnApplicationCreated(Application& /*application*/)
    {
    }

    void OnApplicationShutdown(Application& /*application*/ )
    {
    }
}
