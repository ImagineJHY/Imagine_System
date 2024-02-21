cmake_minimum_required(VERSION 3.0)
project(IMAGINE_SYSTEM)

# string(ASCII 27 Esc)
# set(R "${Esc}[0;31m")
# set(B "${Esc}[1;34m")
# set(E "${Esc}[m")

if(DEFINED IMAGINE_TARGET_LIB)

    if(${IMAGINE_TARGET_LIB} STREQUAL "Imagine_Muduo")

        message("${G}[Imagine System]: Target lib is Imagine_Muduo, no submodule is dependent${E}")

    elseif(${IMAGINE_TARGET_LIB} STREQUAL "Imagine_ZooKeeper")

        message("[${G}[Imagine System]: Target lib is Imagine_ZooKeeper, lib Imagine_Muduo is dependent${E}")

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_Muduo exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
        else()
            message("${R}[Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

    elseif(${IMAGINE_TARGET_LIB} STREQUAL "Imagine_Rpc")

        message("${G}[Imagine System]: Target lib is Imagine_Rpc, lib Imagine_Muduo and Imagine_ZooKeeper is dependent${E}")

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_Muduo exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
        else()
            message("${R}[Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_ZooKeeper exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper)
        else()
            message("${R}[Imagine System]: lib Imagine_ZooKeeper NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

    elseif(${IMAGINE_TARGET_LIB} STREQUAL "Imagine_MapReduce")

        message("${G}[Imagine System]: Target lib is Imagine_MapReduce, lib Imagine_Muduo, Imagine_ZooKeeper and Imagine_Rpc is dependent${E}")

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_Muduo exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
        else()
            message("${R}[Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_ZooKeeper exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper)
        else()
            message("${R}[Imagine System]: lib Imagine_ZooKeeper NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_Rpc exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc)
        else()
            message("${R}[Imagine System]: lib Imagine_Rpc NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()
    elseif(${IMAGINE_TARGET_LIB} STREQUAL "ALL")

        message("${G}[Imagine System]: Target lib is Imagine_MapReduce, lib Imagine_Muduo, Imagine_ZooKeeper and Imagine_Rpc is dependent${E}")

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_Muduo exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
        else()
            message("${R}[Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_ZooKeeper exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper)
        else()
            message("${R}[Imagine System]: lib Imagine_ZooKeeper NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_Rpc exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc)
        else()
            message("${R}[Imagine System]: lib Imagine_Rpc NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()

        if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce/CMakeLists.txt)
            message("${G}[Imagine System]: lib Imagine_MapReduce exists, add subModule...${E}")
            add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce)
        else()
            message("${R}[Imagine System]: lib Imagine_MapReduce NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
        endif()
    endif()
else()
    set(IMAGINE_TARGET_LIB "ALL")

    message("${G}[Imagine System]: build all lib${E}")

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
        message("${G}[Imagine System]: lib Imagine_Muduo exists, add subModule...${E}")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
    else()
        message("${R}[Imagine System]: lib Imagine_Muduo NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
        message("${G}[Imagine System]: lib Imagine_ZooKeeper exists, add subModule...${E}")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper)
    else()
        message("${R}[Imagine System]: lib Imagine_ZooKeeper NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc/CMakeLists.txt)
        message("${G}[Imagine System]: lib Imagine_Rpc exists, add subModule...${E}")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc)
    else()
        message("${R}[Imagine System]: lib Imagine_Rpc NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce/CMakeLists.txt)
        message("${G}[Imagine System]: lib Imagine_MapReduce exists, add subModule...${E}")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce)
    else()
        message("${R}[Imagine System]: lib Imagine_MapReduce NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!${E}")
    endif()
endif()