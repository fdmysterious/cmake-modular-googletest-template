cmake_minimum_required(VERSION 3.17)
project(component::boo)

include_directories(
	${COMPONENTS_PATH}
)

string(REPLACE "::" "-" TARGET_LIB ${PROJECT_NAME})
add_library(${TARGET_LIB} STATIC boo.c)
add_library(${PROJECT_NAME} ALIAS ${TARGET_LIB})

#target_link_libraries(
#	${TARGET_LIB}
#	INTERFACE component::foo
#)

# Following doesn't work with Multi config generators
# like Ninja Multi-Config. But it's the only found way for now.

if(CMAKE_BUILD_TYPE STREQUAL "ComponentTesting")
	add_subdirectory(tests)
endif()

