cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(easyexif)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

if (WIN32)
	# Enable multi-core compile option
	add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/MP>)
endif ()

if (UNIX)
	add_definitions(-std=c++14)
endif (UNIX)

set(BASEPATH "${CMAKE_SOURCE_DIR}")
INCLUDE_DIRECTORIES("${BASEPATH}")

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Includes
include_directories(${BASEPATH}/)


file(GLOB main_src_files
    "*.h"
    "*.cpp"
)

add_executable(demo 
	${main_src_files} 
)
set_target_properties (demo PROPERTIES
    FOLDER easyexif-demo  
)

