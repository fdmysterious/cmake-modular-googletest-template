cmake_minimum_required(VERSION 3.17)
project(ComponentBoo)

include_directories(
	${COMPONENTS_PATH}
)

add_library(component-boo STATIC
	boo.c
)

target_link_libraries(
	component-boo
	PRIVATE component-foo
)

# Following is a bad pattern as it doesn't work with Multi config generators
# like Ninja Multi-Config. But it's the only found way for now.

if(CMAKE_BUILD_TYPE STREQUAL "ComponentTesting")
	add_subdirectory(tests)
endif()
