cmake_minimum_required(VERSION 3.17)
project(component::boo::tests)

include_directories(
	${COMPONENTS_PATH}
)

if(BUILD_TESTING)
	string(REPLACE "::" "-" TARGET_EXE ${PROJECT_NAME})
	add_executable(
		${TARGET_EXE}
		boo_tests.cc
	)

	target_link_libraries(
		${TARGET_EXE}
		PRIVATE component::boo
		PRIVATE component::foo
		PUBLIC  GTest::gtest_main
	)

	include(GoogleTest)
	gtest_discover_tests(${TARGET_EXE})
endif()
