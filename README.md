## Introduction
This is the default template for an empty project using Onyx.

### HOW TO USE THIS TEMPLATE

> **DO NOT FORK** this is meant to be used from **[Use this template](https://github.com/Ak-Elements/Onyx-TemplateProject/generate)** feature.

1. Click on **[Use this template](https://github.com/Ak-Elements/Onyx-TemplateProject/generate)**
3. Give a name to your project  
   (e.g. `my_awesome_project` recommendation is to use all lowercase and underscores separation for repo names.)
3. Wait until the first run of CI finishes  
   (Github Actions will process the template and commit to your new repo)
4. Read the Onyx install guide to check all requirements & dependencies. https://github.com/Ak-Elements/Onyx
5. Clone your new project and happy coding!

> **NOTE**: **WAIT** until first CI run on github actions before cloning your new project.

## Requirements & Dependencies
To successfully build and run Onyx, ensure the following software and tools are installed:

### Required Tools
1. **CMake**  
   - **Version**: `3.28` or higher  
   - [Download CMake](https://cmake.org/download/)

2. **Vulkan SDK**  
   - **Version**: `1.3` or higher  
   - **Additional Requirements**:  
     During Vulkan SDK installation, ensure the following components are selected:  
     - **SDK 32-bit Core Components**  
     - **Shader Toolchain Debug Symbols 64-bit**  
     - **Shader Toolchain Debug Symbols 32-bit**  
   - [Download Vulkan SDK](https://vulkan.lunarg.com/sdk/home)

3. **C++ Compiler**  
   - **Standard**: `C++20` or higher  
   - **Examples**:  
     - Microsoft Visual Studio
         - The free [Community Edition](https://visualstudio.microsoft.com/vs/community/) includes the MSVC compiler with C++20 support.
      - GCC (GNU Compiler Collection)
         - Install GCC 11+ from the [GCC Installation Guide](https://gcc.gnu.org/install/).
         - Windows users can install GCC via [WSL](https://code.visualstudio.com/docs/cpp/config-wsl) for a Linux-like environment.

## Set project name
 By default the template for this default project is called 'project_name' and is renamed by github once you create a new repository from it using the **[Use this template](https://github.com/Ak-Elements/Onyx-TemplateProject/generate)** feature.
 If you decided to download the repository manually you have to change those default names yourself by opening all 3 generate_projects scripts and replace `@PROJECT_NAME@` with the name of your project as well as renaming the folder `project_name` to the name you chose.

> It is highly recommended to use the template from GitHub instead of manually downloading the source.

## Additional Notes

-   A GPU with Vulkan support is required.
-   Contributions and issues can be tracked on the repository's GitHub page.

## License

Required Notice: Copyright AkElements

This repository is licensed under the PolyForm Noncommercial License 1.0.0
https://polyformproject.org/licenses/noncommercial/1.0.0/

For questions regarding the license or if you would like to have a more permissive license feel free to contact me. (akelements.dev@gmail.com)
