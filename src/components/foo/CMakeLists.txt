cmake_minimum_required(VERSION 3.17)
project(component::foo)

string(REPLACE "::" "-" TARGET_LIB ${PROJECT_NAME})
add_library(${TARGET_LIB} STATIC foo.c )
add_library(${PROJECT_NAME} ALIAS ${TARGET_LIB})