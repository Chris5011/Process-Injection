cmake_minimum_required(VERSION 3.23)
project(ShellCode_Testing C)

set(CMAKE_C_STANDARD 17)

add_executable(Run run.c)
add_executable(Exit exit.c)
add_executable(GetWinExecAddr getWinExecAddr.c)
add_executable(Convert convertString.c)
