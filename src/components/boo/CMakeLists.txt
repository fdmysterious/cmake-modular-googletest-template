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


if(BUILD_TESITNG)
	add_executable(
		component-boo-test-basic
		tests/boo_tests.cc
	)

	target_link_libraries(
		component-boo-test-basic
		PRIVATE component-boo
		PRIVATE component-foo
		GTest::gtest_main
	)

	include(GoogleTest)
	gtest_discover_tests(component-boo-test-basic)
endif()
