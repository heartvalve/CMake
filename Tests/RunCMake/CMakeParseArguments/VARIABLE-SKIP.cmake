# CMAKE_MINIMUM_REQUIRED_VERSION             2.8.12
# CMAKE_PARSE_ARGUMENTS_DEFAULT_SKIP_EMPTY   1
# CMAKE_PARSE_ARGUMENTS_(KEEP|SKIP)_EMPTY    UNSET
#     => SKIP

cmake_minimum_required(VERSION 2.8.12)

include(CMakeParseArguments)

set(CMAKE_PARSE_ARGUMENTS_DEFAULT_SKIP_EMPTY 1)

macro(MY_INSTALL)
    set(options OPTIONAL FAST)
    set(oneValueArgs DESTINATION RENAME)
    set(multiValueArgs TARGETS CONFIGURATIONS)
    cmake_parse_arguments(MY_INSTALL "${options}" "${oneValueArgs}" "${multiValueArgs}" "${ARGN}")
endmacro()

my_install(DESTINATION "" TARGETS foo "" bar)

if(DEFINED MY_INSTALL_DESTINATION)
    message(FATAL_ERROR "DEFINED MY_INSTALL_DESTINATION")
endif()

if(NOT "${MY_INSTALL_TARGETS}" STREQUAL "foo;bar")
    message(FATAL_ERROR "NOT \"\${MY_INSTALL_TARGETS}\" STREQUAL \"foo;bar\"")
endif()