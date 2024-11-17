# C++ CMake GLFW Template
This is a simple and lightweight C++ template project that uses CMake and GLFW. It supports both local compilation and cross-compilation using the Emscripten toolchain. This template is ideal for creating C++ applications that need to run natively or as WebAssembly in a browser.

## Features
- ***Local Compilation***: Compile and run the project natively on the host.
- ***Emscripten Cross-compilation***: Generate WebAssembly files to run the project in a browser.
- ***GLFW***: Includes setup for creating OpenGL contexts and handling input events.

## Prerequisites
- C++ Compiler
- CMake version 3.10 or higher.
- Emscripten SDK

## Getting Started

Clone this repository and set up the project as per the steps below.

### Local Build

To compile and run the project locally:

```bash
# Create and navigate to the build directory
mkdir build
cd build

# Run CMake to generate build files
cmake ../src

# Compile the project
make

# Run the generated executable
./example
```

### Emscripten Cross-compilation

To compile the project for WebAssembly using the Emscripten toolchain:

```bash
# Create and navigate to the build directory
mkdir build
cd build

# Run CMake with the Emscripten toolchain
cmake -DCMAKE_TOOLCHAIN_FILE=/usr/lib/emscripten/cmake/Modules/Platform/Emscripten.cmake ../src/

# Compile the project
make

# Run the output using emrun
emrun --no-browser .
```
