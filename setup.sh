#!/bin/bash
# current_dir=$(pwd)
export PATH=$PATH:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_Muduo/include
export PATH=$PATH:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_ZooKeeper/include
export PATH=$PATH:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_Rpc/include
export PATH=$PATH:${CMAKE_CURRENT_SOURCE_DIR}/worker/Imagine_MapReduce/include
echo PATH is $PATH