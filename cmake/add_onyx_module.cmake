function(add_onyx_module TARGET_NAME)
    
    # Parse arguments using cmake_parse_arguments
    cmake_parse_arguments(
        TARGET                  # The prefix for the parsed arguments
        ""                      # No options
        "PRECOMPILED_HEADER"    # single-value arguments
        "PUBLIC_SOURCES;PRIVATE_SOURCES;PUBLIC_DEPENDENCIES;PRIVATE_DEPENDENCIES;PUBLIC_DEFINES;PRIVATE_DEFINES"  # Multi-value arguments (source and dependency lists)
        ${ARGN}                 # Remaining arguments
    )

    #### Target ####
    add_library(${TARGET_NAME} STATIC 
         ${TARGET_PUBLIC_SOURCES}
         ${TARGET_PRIVATE_SOURCES}
    )

    if(TARGET_PUBLIC_SOURCES)
        source_group(TREE ${TARGET_PUBLIC_PATH} FILES ${TARGET_PUBLIC_SOURCES})
    endif()

    if(TARGET_PRIVATE_SOURCES)
        source_group(TREE ${TARGET_PRIVATE_PATH} FILES ${TARGET_PRIVATE_SOURCES})
    endif()

    #target_sources(${TARGET_NAME} PUBLIC ${${TARGET_NAME}_public_sources})
    #target_sources(${TARGET_NAME} PRIVATE ${${TARGET_NAME}_private_sources})

    #source_group(TREE ${TARGET_PUBLIC_PATH} FILES ${${TARGET_NAME}_public_sources})
    #source_group(TREE ${TARGET_PRIVATE_PATH} FILES ${${TARGET_NAME}_private_sources})

    #### Target Properties ####
    set_target_properties(${TARGET_NAME} PROPERTIES
        CXX_STANDARD 20
        CXX_STANDARD_REQUIRED YES
        CXX_EXTENSIONS NO
        CXX_VISIBILITY_PRESET hidden
        VISIBILITY_INLINES_HIDDEN YES
        SOVERSION ${MAJOR_VERSION}
        VERSION ${LIB_VERSION}
        PUBLIC_HEADERS "${TARGET_PUBLIC_SOURCES}"
        FOLDER modules/
    )
    
    #### Precompiled Header ####
    if (DEFINED TARGET_PRECOMPILED_HEADER)
        target_precompile_headers(${TARGET_NAME} PUBLIC ${TARGET_PRECOMPILED_HEADER})
    endif()

    #### Compiler Defines ####
    target_compile_definitions(${TARGET_NAME} PUBLIC ${ONYX_PUBLIC_DEFINES})
    target_compile_definitions(${TARGET_NAME} PRIVATE ${ONYX_PRIVATE_DEFINES})

    if (DEFINED TARGET_PUBLIC_DEFINES)
        target_compile_definitions(${TARGET_NAME} PUBLIC ${TARGET_PUBLIC_DEFINES})
    endif()

     if (DEFINED TARGET_PRIVATE_DEFINES)
        target_compile_definitions(${TARGET_NAME} PRIVATE ${TARGET_PRIVATE_DEFINES})
    endif()

    #### Compiler & Link Options ####
    target_compile_options(${TARGET_NAME} PRIVATE ${ONYX_COMPILE_OPTIONS})
    target_link_options(${TARGET_NAME} PRIVATE ${ONYX_LINK_OPTIONS})

    #### Includes ####
    target_include_directories(${TARGET_NAME} PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/public>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/${TARGET_NAME}>
    )
    target_include_directories(${TARGET_NAME} PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/private>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/${TARGET_NAME}>
    )

    #### Dependencies ####
    if(DEFINED TARGET_PUBLIC_DEPENDENCIES)
        target_link_libraries(${TARGET_NAME} PUBLIC ${TARGET_PUBLIC_DEPENDENCIES})
    endif()

    if(DEFINED TARGET_PRIVATE_DEPENDENCIES)
        target_link_libraries(${TARGET_NAME} PRIVATE ${TARGET_PRIVATE_DEPENDENCIES})
    endif()

    #### Install ####
    include(GNUInstallDirs)
    install(TARGETS ${TARGET_NAME}
        EXPORT ${TARGET_NAME}-targets
            DESTINATION lib
        RUNTIME
            DESTINATION ${CMAKE_INSTALL_BINDIR}
            COMPONENT ${TARGET_NAME}_RunTime
        LIBRARY
            DESTINATION ${CMAKE_INSTALL_LIBDIR}
            COMPONENT ${TARGET_NAME}_RunTime
            NAMELINK_COMPONENT ${TARGET_NAME}_Development
        ARCHIVE
            DESTINATION ${CMAKE_INSTALL_LIBDIR}
            COMPONENT ${TARGET_NAME}_Development
        PUBLIC_HEADER
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${TARGET_NAME}
    )
    
    install(TARGETS ${INSTALL_TARGETS} EXPORT imgui-targets DESTINATION lib)
    install(EXPORT ${TARGET_NAME}-targets
        FILE  ${TARGET_NAME}-config.cmake
        NAMESPACE onyx::
        DESTINATION lib/cmake/onyx)
        install(FILES ${TARGET_PUBLIC_SOURCES} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cmake/${TARGET_NAME})

    export(EXPORT ${TARGET_NAME}-targets FILE ${TARGET_NAME}Config.cmake)

endfunction()
