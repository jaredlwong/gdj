cmake_minimum_required (VERSION 2.8.7)
project (J C)

add_executable (jconsole jconsole.c jeload.c)

target_link_libraries (jconsole "-ldl")
set (CMAKE_C_FLAGS "-fPIC -O3 -fno-strict-aliasing -DNOASM -D_UNIX64")

file(GLOB LIBJ_SOURCES *.c)
list(REMOVE_ITEM LIBJ_SOURCES jconsole.c jeload.c tsdll.c)
add_library (j SHARED ${LIBJ_SOURCES})
target_link_libraries (j m dl)
