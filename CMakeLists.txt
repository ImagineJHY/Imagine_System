cmake_minimum_required(VERSION 3.0)
project(IMAGINE_SYSTEM)

if(DEFINED TARGET_LIB)

    if(${TARGET_LIB} STREQUAL "Imagine_Muduo")

        message("[Constructing LIB][Imagine System]: Target lib is Imagine_Muduo, no submodule is dependent")

    elseif(${TARGET_LIB} STREQUAL "Imagine_ZooKeeper")

        message("[Constructing LIB][Imagine System]: Target lib is Imagine_ZooKeeper, lib Imagine_Muduo is dependent")

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
            message("[Constructing LIB][Imagine System]: lib Imagine_Muduo exists, add subModule...")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
        else()
            message("[Constructing LIB][Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!")
        endif()

    elseif(${TARGET_LIB} STREQUAL "Imagine_Rpc")

        message("[Constructing LIB][Imagine System]: Target lib is Imagine_Rpc, lib Imagine_Muduo and Imagine_ZooKeeper is dependent")

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
            message("[Constructing LIB][Imagine System]: lib Imagine_Muduo exists, add subModule...")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
        else()
            message("[Constructing LIB][Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
            message("[Constructing LIB][Imagine System]: lib Imagine_ZooKeeper exists, add subModule...")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper)
        else()
            message("[Constructing LIB][Imagine System]: lib Imagine_ZooKeeper NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!")
        endif()

    elseif(${TARGET_LIB} STREQUAL "Imagine_MapReduce")

        message("[Constructing LIB][Imagine System]: Target lib is Imagine_MapReduce, lib Imagine_Muduo, Imagine_ZooKeeper and Imagine_Rpc is dependent")

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
            message("[Constructing LIB][Imagine System]: lib Imagine_Muduo exists, add subModule...")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
        else()
            message("[Constructing LIB][Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
            message("[Constructing LIB][Imagine System]: lib Imagine_ZooKeeper exists, add subModule...")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper)
        else()
            message("[Constructing LIB][Imagine System]: lib Imagine_ZooKeeper NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc/CMakeLists.txt)
            message("[Constructing LIB][Imagine System]: lib Imagine_Rpc exists, add subModule...")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc)
        else()
            message("[Constructing LIB][Imagine System]: lib Imagine_Rpc NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!")
        endif()
        
    else()
        message("[Constructing LIB][Imagine System]: NO IDEA what lib is made and what lib is dependent, please add CPLUS_INCLUDE_PATH YOURSELF!")
    endif()
else()
    message("[Constructing LIB][Imagine System]: Target lib is NOT clear, please add CPLUS_INCLUDE_PATH YOURSELF!")
endif()