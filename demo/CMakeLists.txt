cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

file(GLOB demo_src_files
    "*.h"
    "*.cpp"
)

add_executable(demo 
	${demo_src_files}
)

target_link_libraries(demo LINK_PUBLIC
   easyexif 
)

set_target_properties (demo PROPERTIES
    FOLDER easyexif 
)

