set -e # Exit on error

cmake -GNinja -DCMAKE_BUILD_TYPE="ComponentTesting" -B /build /src
cd /build
ninja
ctest
