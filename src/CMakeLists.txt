cmake_minimum_required(VERSION 3.17)
project(TestComponents)

set(COMPONENTS_PATH ${PROJECT_SOURCE_DIR}/components)

include(CTest)

add_subdirectory(components/foo)
add_subdirectory(components/boo)

include_directories(${COMPONENTS_PATH})

# If testing enabled, set toolchain and import googletest
if(BUILD_TESTING)
	# Set toolchain to compile for host
	set(CMAKE_TOOLCHAIN_FILE "../cmake/toolchain_host.cmake")

	# Include google tests
	set(CMAKE_CXX_STANDARD 14)

	include(FetchContent)
	FetchContent_Declare(
		googletest
		GIT_REPOSITORY https://github.com/google/googletest.git
		GIT_TAG release-1.12.1
	)
	set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
	FetchContent_MakeAvailable(googletest)
else()
	# Set toolchain for target
	set(CMAKE_TOOLCHAIN_FILE "../cmake/toolchain_target.cmake")
endif()

add_executable(
	bar
	bar.c
)

target_link_libraries(
	bar
	PRIVATE 
	component-foo
	component-boo
)
