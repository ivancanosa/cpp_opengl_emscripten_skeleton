include(FetchContent)

if(NOT EMSCRIPTEN) 
# Glad
    set(GL_VERSION "4.3")
    set(GLAD_PROFILE "core"	CACHE STRING "OpenGL profile")
    set(GLAD_GENERATOR "c"	CACHE STRING "Language to generate the binding for")

    FetchContent_Declare(
      glad
      GIT_REPOSITORY https://github.com/Dav1dde/glad
      GIT_TAG        v2.0.8
      GIT_PROGRESS   TRUE
      SOURCE_SUBDIR  cmake
    )
    FetchContent_MakeAvailable(glad)
    glad_add_library(glad REPRODUCIBLE EXCLUDE_FROM_ALL LOADER API gl:core=${GL_VERSION})
    add_library(glad::glad ALIAS glad)

# GLFW
    FetchContent_Declare(
      glfw
      GIT_REPOSITORY https://github.com/glfw/glfw
      GIT_TAG        3.4
      GIT_PROGRESS   TRUE
    )
    FetchContent_MakeAvailable(glfw)
    add_library(glfw::glfw ALIAS glfw)
else()
    add_library(__0 INTERFACE)
    add_library(__1 INTERFACE)
    add_library(glad::glad ALIAS __0)
    add_library(glfw::glfw ALIAS __1)
    add_definitions(-D__EMSCRIPTEN__)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s USE_GLFW=3 -s FULL_ES3=1 -s USE_WEBGL2=1 -s ALLOW_MEMORY_GROWTH=1 -s WASM=1")
    set(CMAKE_EXECUTABLE_SUFFIX ".html")
endif()

# GLM dependency
FetchContent_Declare(
	glm
	GIT_REPOSITORY	https://github.com/g-truc/glm.git
	GIT_TAG 	    master
)
FetchContent_MakeAvailable(glm)

