# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.28)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")

set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(PATCH_VERSION 0)
set(LIB_VERSION ${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION})

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(ONYX_GAME_PROJECT_NAME "myproject")
project (${ONYX_GAME_PROJECT_NAME} VERSION ${LIB_VERSION} LANGUAGES CXX)

include(FetchContent)
include(cmakepackagemanager)

CPMAddPackage(
    NAME Onyx
    GITHUB_REPOSITORY Ak-Elements/Onyx
    GIT_TAG release
)

# Include sub-projects.
add_subdirectory(${ONYX_GAME_PROJECT_NAME})

if(MSVC AND ONYX_BUILD_EDITOR)
	#### Set as startup project ####
	set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT Game)
endif()