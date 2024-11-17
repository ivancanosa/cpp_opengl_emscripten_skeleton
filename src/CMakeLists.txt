cmake_minimum_required(VERSION 3.10)
project(Example VERSION 1.0 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

include(cmake/extern.cmake)

add_executable(example main.cpp)
target_link_libraries(example PRIVATE glad::glad glfw::glfw glm::glm)
