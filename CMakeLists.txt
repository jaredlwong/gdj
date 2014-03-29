cmake_minimum_required (VERSION 2.8.7)
project (J C)

include_directories(src)

set (CMAKE_C_FLAGS "-fPIC -O3 -fno-strict-aliasing -DNOASM -D_UNIX64")

file(GLOB LIBJ_SOURCES src/*.c)
file(GLOB LIBJ_HEADERS src/*.h)

add_library (j SHARED ${LIBJ_SOURCES} ${LIBJ_HEADERS})
target_link_libraries (j m dl)

file(GLOB JCONSOLE_SOURCES jconsole/*.c)
add_executable (jconsole ${JCONSOLE_SOURCES} ${LIBJ_HEADERS})
target_link_libraries (jconsole dl)
