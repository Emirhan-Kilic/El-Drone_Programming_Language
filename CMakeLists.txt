# Minimum CMake version required
cmake_minimum_required(VERSION 3.10)

# Set the project name
project(FlexLexerProject)

# Find the Flex tool manually
find_program(FLEX_EXECUTABLE flex)

# Check if Flex is found
if (NOT FLEX_EXECUTABLE)
    message(FATAL_ERROR "Flex not found. Please make sure Flex is installed and available in your PATH.")
endif()

# Specify the lexer file
set(LEXER_FILE src/lexer.l)

# Run Flex to generate lex.yy.c
add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c
        COMMAND ${FLEX_EXECUTABLE} -o ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c ${CMAKE_CURRENT_SOURCE_DIR}/${LEXER_FILE}
        DEPENDS ${LEXER_FILE}
        COMMENT "Running Flex to generate lexer"
)

# Add the generated lex.yy.c file as a source for the executable
add_executable(lexer ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c)

# Optionally link against the Flex library
# target_link_libraries(lexer ${FLEX_LIBRARIES})
