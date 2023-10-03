cmake_minimum_required(VERSION 3.0)
project(IMAGINE_SYSTEM)

set(ENV{PATH} $ENV{PATH}:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_Muduo/include)
set(ENV{PATH} $ENV{PATH}:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_ZooKeeper/include)
set(ENV{PATH} $ENV{PATH}:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_Rpc/include)
set(ENV{PATH} $ENV{PATH}:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_MapReduce/include)

message($ENV{PATH})

# add_custom_target(
#     setup ALL # ALL代表每次构建都会运行这个目标
#     COMMAND source ${CMAKE_CURRENT_SOURCE_DIR}/setup.sh
#     WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} # 在哪个目录下执行命令
# )

add_custom_target(
    init ALL # ALL代表每次构建都会运行这个目标
    COMMAND python3 ${CMAKE_CURRENT_SOURCE_DIR}/init.py
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} # 在哪个目录下执行命令
)

add_custom_target(
    init_all ALL # ALL代表每次构建都会运行这个目标
    echo "This is Imagine System init_all target"
)

add_dependencies(init_all init)