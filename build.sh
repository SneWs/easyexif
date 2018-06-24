#!/bin/sh

# Simple Linux build script

old_cwd=`pwd`
this_script="$0"
buildType="$1"
workingdir=`dirname "$this_script"`
buildDir="$workingdir/Build"

cd "$workingdir"

mkdir -p "$buildDir"

cd "$buildDir"

if [ "$buildType" = "" ]; then
    buildType=Release
fi

# Execute CMake command
cmake -DCMAKE_C_COMPILER_ID=clang -DCMAKE_CXX_COMPILER_ID=clang++ -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_LINKER=/usr/bin/llvm-ld -DCMAKE_BUILD_TYPE="$buildType" ../

# Build it
cores=`nproc --all`
make "-j$cores"

# Go back to initial folder where we started this script from...
cd "$old_cwd"

