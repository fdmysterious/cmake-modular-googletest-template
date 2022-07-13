cmake_minimum_required(VERSION 3.17)
project(ComponentBoo_Tests)

include_directories(
	${COMPONENTS_PATH}
)

if(BUILD_TESTING)
	add_executable(
		component-boo-test-basic
		boo_tests.cc
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
