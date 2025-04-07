# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.28)

option(project_name "project_name")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")

set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(PATCH_VERSION 0)
set(LIB_VERSION ${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION})

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

project (${project_name} VERSION ${LIB_VERSION} LANGUAGES CXX)

set( PROJECT_COMPILE_OPTIONS
	$<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>>: -Wall -Wnocomment -fno-rtti>
	$<$<CXX_COMPILER_ID:MSVC>:/W4 /WX /Zc:__cplusplus /Zi /GR- >)
set( PROJECT_LINK_OPTIONS
	$<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>>: >
	$<$<CXX_COMPILER_ID:MSVC>:/ignore:4099>)

include(FetchContent)
include(cmakepackagemanager)

CPMAddPackage(
    NAME Onyx
    GITHUB_REPOSITORY Ak-Elements/Onyx
    GIT_TAG main
    OPTIONS
    "ONYX_TARGETS_FOLDER onyx"
)

# Include sub-projects.
add_subdirectory(${project_name})

if(MSVC AND ONYX_BUILD_EDITOR)
	#### Set as startup project ####
	set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${ONYX_GAME_PROJECT_NAME})
endif()