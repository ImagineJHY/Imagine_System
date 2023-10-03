cmake_minimum_required(VERSION 3.0)
project(IMAGINE_SYSTEM)

add_custom_target(
    setup ALL # ALL代表每次构建都会运行这个目标
    COMMAND ./setup.sh
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} # 在哪个目录下执行命令
)

add_custom_target(
    init ALL # ALL代表每次构建都会运行这个目标
    COMMAND python3 init.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} # 在哪个目录下执行命令
)

add_custom_target(
    init_all ALL # ALL代表每次构建都会运行这个目标
    echo "This is Imagine System init_all target"
)

add_dependencies(init_all setup init)