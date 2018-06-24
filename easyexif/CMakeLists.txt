cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

file(GLOB easyexif_src_files
    "*.h"
    "*.cpp"
)

add_library(easyexif STATIC ${easyexif_src_files})

set_target_properties (easyexif PROPERTIES
    FOLDER easyexif
)

