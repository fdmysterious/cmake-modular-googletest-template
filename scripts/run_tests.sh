#!/bin/ash

set -e          # Exit on error
set -o pipefail # Return code from a pipe is set to the last non-zero status

dir_build="$(pwd)/build-tests"
dir_logs="$(pwd)/logs"

copylogs() {
    # Copy tests logs into logs output folder if they exist
    mkdir -p "${dir_build}/GTest_Output"
    [ -d "${dir_build}/Testing/Temporary" ] &&  cp -a "${dir_build}/Testing/Temporary/." "${dir_logs}/GTest_Output"
}

trap copylogs EXIT


export TIDY_LOGS="${dir_logs}/clang-tidy.log"
export BUILD_PWD="$(pwd)"

touch "${dir_logs}/clang-tidy.log"
cmake -GNinja -DCMAKE_BUILD_TYPE="ComponentTesting" --log-level DEBUG -B "${dir_build}" ./src | tee "${dir_logs}/build.log"
cd "${dir_build}"
ninja 2>&1 | tee -a "${dir_logs}/build.log"
ctest | tee "${dir_logs}/tests.log"


