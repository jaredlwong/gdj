cmake_minimum_required (VERSION 2.8.7)
project (J C)

include_directories(src)

set (CMAKE_C_FLAGS "-fPIC -O3 -fno-strict-aliasing -DNOASM -D_UNIX64 -std=c99")

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
# 
# add_library (tsdll SHARED tsdll.c)
