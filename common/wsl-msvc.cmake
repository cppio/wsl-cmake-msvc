set(CMAKE_SYSTEM_NAME Windows)

get_filename_component(CMAKE_PROGRAM_PATH "${CMAKE_PARENT_LIST_FILE}" DIRECTORY)

find_program(CMAKE_C_COMPILER cl)
find_program(CMAKE_CXX_COMPILER cl)
