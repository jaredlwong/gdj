cmake_minimum_required (VERSION 2.8.7)
project (J C)

set (CMAKE_BUILD_TYPE Debug)

include_directories(src)

set (CMAKE_C_FLAGS_RELEASE "-fPIC -O3 -fno-strict-aliasing -DNOASM -D_UNIX64")
set (CMAKE_C_FLAGS_DEBUG "-fPIC -O0 -g3 -ggdb -fno-strict-aliasing -DNOASM -D_UNIX64")

file(GLOB SOURCES src/*.c)
file(GLOB HEADERS src/*.h)

add_executable (jlang ${SOURCES} ${HEADERS})
target_link_libraries (jlang m dl)

# add_library (j SHARED ${LIBJ_SOURCES} ${LIBJ_HEADERS})
# target_link_libraries (j m dl)
# 
# file(GLOB JCONSOLE_SOURCES jconsole/*.c)
# add_executable (jconsole ${JCONSOLE_SOURCES} ${LIBJ_HEADERS})
# target_link_libraries (jconsole dl)
 
add_library (tsdll SHARED test/tsdll.c)
