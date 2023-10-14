cmake_minimum_required(VERSION 3.0)
project(IMAGINE_SYSTEM)

# make project
if(${IS_MAKE_PROJECT})
    set(IS_SUBMODULE_READY true)
    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Tool/CMakeLists.txt)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_Tool exists, add subModule...")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Tool)
    else()
        set(IS_SUBMODULE_READY false)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_Tool NOT exists, cin make prepare to init it!")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_Muduo exists, add subModule...")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
    else()
        set(IS_SUBMODULE_READY false)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_Muduo NOT exists, cin make prepare to init it!")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_ZooKeeper exists, add subModule...")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper)
    else()
        set(IS_SUBMODULE_READY false)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_ZooKeeper NOT exists, cin make prepare to init it!")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc/CMakeLists.txt)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_Rpc exists, add subModule...")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc)
    else()
        set(IS_SUBMODULE_READY false)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_Rpc NOT exists, cin make prepare to init it!")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce/CMakeLists.txt)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_MapReduce exists, add subModule...")
        add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce)
    else()
        set(IS_SUBMODULE_READY false)
        message("[Constructing PROJECT][Imagine System]: subModule Imagine_MapReduce NOT exists, cin make prepare to init it!")
    endif()
# make lib
else()
    if(DEFINED TARGET_LIB)
        if(${TARGET_LIB} STREQUAL "Imagine_Tool")
            message("[Constructing LIB][Imagine System]: Target lib is Imagine_Tool, lib thirdparty of github is dependent")

            if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/yaml-cpp/CMakeLists.txt)
                message("[Constructing LIB][Imagine System]: lib thirdparty of github yaml-cpp exists, add subModule...")
                add_subdirectory(${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo)
            else()
                message("[Constructing LIB][Imagine System]: lib thirdparty of github yaml-cpp is NOT exists, cin make prepare to init it or add CPLUS_INCLUDE_PATH YOURSELF!")
            endif()
        elseif(${TARGET_LIB} STREQUAL "Imagine_Muduo")
            message("[Constructing LIB][Imagine System]: Target lib is Imagine_Muduo, lib Imagine_Tool is dependent")
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
endif()

add_custom_target(
    prepare_submodule
    COMMAND python3 ${CMAKE_CURRENT_SOURCE_DIR}/init.py
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} # 在哪个目录下执行命令
)

add_custom_target(
    prepare_thirdparty
    COMMAND python3 ${CMAKE_CURRENT_SOURCE_DIR}/init_base.py
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} # 在哪个目录下执行命令
)

add_custom_target(
    prepare_submodule_bak
    COMMAND python3 ${CMAKE_CURRENT_SOURCE_DIR}/init_bak.py
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} # 在哪个目录下执行命令
)

add_custom_target(
    system_prepare # ALL # ALL代表每次构建都会运行这个目标
)

add_custom_target(
    system_prepare_bak # ALL # ALL代表每次构建都会运行这个目标
)

if(DEFINED IS_SUBMODULE_READY)
    if(${IS_SUBMODULE_READY})
        add_custom_target(
            system_build # ALL # ALL代表每次构建都会运行这个目标
        )
        add_dependencies(system_build imagine_mapreduce imagine_rpc imagine_zookeeper imagine_muduo)
        add_dependencies(imagine_zookeeper imagine_muduo)
        add_dependencies(imagine_rpc imagine_zookeeper imagine_muduo)
        add_dependencies(imagine_mapreduce imagine_rpc imagine_zookeeper imagine_muduo)
        message("[Constructing PROJECT][Imagine System]: every subModule is ready, starting buid subModule")
    else()
        message("[Constructing PROJECT][Imagine System]: Please cin make prepare to make every subModule ready!")
    endif()
else()
    message("[Constructing LIB][Imagine System]: This is Imagine_System")
endif()

add_dependencies(system_prepare prepare_submodule prepare_thirdparty)
add_dependencies(system_prepare_bak prepare_submodule_bak)