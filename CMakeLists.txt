cmake_minimum_required(VERSION 3.0)
project(IMAGINE_SYSTEM)

if(${IS_MAKE_PROJECT})
    set(IS_SUBMODULE_READY true)
    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce/CMakeLists.txt)
        message("Constructing PROJECT: subModule Imagine_MapReduce exists, add subModule...")
        add_subdirectory({IMAGINE_LIB_WORKER_DIR}/Imagine_MapReduce/CMakeLists.txt)
    else()
        set(IS_SUBMODULE_READY false)
        message("Constructing PROJECT: subModule Imagine_MapReduce NOT exists, cin make prepare to init it!")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc/CMakeLists.txt)
        message("Constructing PROJECT: subModule Imagine_Rpc exists, add subModule...")
        add_subdirectory({IMAGINE_LIB_WORKER_DIR}/Imagine_Rpc/CMakeLists.txt)
    else()
        set(IS_SUBMODULE_READY false)
        message("Constructing PROJECT: subModule Imagine_Rpc NOT exists, cin make prepare to init it!")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
        message("Constructing PROJECT: subModule Imagine_ZooKeeper exists, add subModule...")
        add_subdirectory({IMAGINE_LIB_WORKER_DIR}/Imagine_ZooKeeper/CMakeLists.txt)
    else()
        set(IS_SUBMODULE_READY false)
        message("Constructing PROJECT: subModule Imagine_ZooKeeper NOT exists, cin make prepare to init it!")
    endif()

    if(EXISTS ${IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
        message("Constructing PROJECT: subModule Imagine_Muduo exists, add subModule...")
        add_subdirectory({IMAGINE_LIB_WORKER_DIR}/Imagine_Muduo/CMakeLists.txt)
    else()
        set(IS_SUBMODULE_READY false)
        message("Constructing PROJECT: subModule Imagine_Muduo NOT exists, cin make prepare to init it!")
    endif()
else()
    message("Constructing LIB: this is Imagine_System")
endif()

add_custom_target(
    prepare_submodule
    COMMAND python3 ${CMAKE_CURRENT_SOURCE_DIR}/init.py
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} # 在哪个目录下执行命令
)

add_custom_target(
    system_prepare # ALL # ALL代表每次构建都会运行这个目标
)

if(Exists ${IS_SUBMODULE_READY})
    if(${IS_SUBMODULE_READY})
        add_custom_target(
            system_build # ALL # ALL代表每次构建都会运行这个目标
        )
        add_dependencies(system_build imagine_mapreduce imagine_rpc imagine_zookeeper imagine_muduo)
        message("Constructing PROJECT: every subModule is ready, starting buid subModule")
    else()
        message("Constructing PROJECT: Please cin make prepare to make every subModule ready!")
    endif()
else()
    message("Constructing LIB: This is Imagine_System")
endif()

add_dependencies(system_prepare prepare_submodule)