# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dfx-rick/ctrl_ws

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dfx-rick/ctrl_ws/build/ctrl_ws

# Include any dependencies generated for this target.
include CMakeFiles/lqr_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lqr_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lqr_test.dir/flags.make

CMakeFiles/lqr_test.dir/src/example.cpp.o: CMakeFiles/lqr_test.dir/flags.make
CMakeFiles/lqr_test.dir/src/example.cpp.o: ../../src/example.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dfx-rick/ctrl_ws/build/ctrl_ws/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/lqr_test.dir/src/example.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lqr_test.dir/src/example.cpp.o -c /home/dfx-rick/ctrl_ws/src/example.cpp

CMakeFiles/lqr_test.dir/src/example.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lqr_test.dir/src/example.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dfx-rick/ctrl_ws/src/example.cpp > CMakeFiles/lqr_test.dir/src/example.cpp.i

CMakeFiles/lqr_test.dir/src/example.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lqr_test.dir/src/example.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dfx-rick/ctrl_ws/src/example.cpp -o CMakeFiles/lqr_test.dir/src/example.cpp.s

# Object files for target lqr_test
lqr_test_OBJECTS = \
"CMakeFiles/lqr_test.dir/src/example.cpp.o"

# External object files for target lqr_test
lqr_test_EXTERNAL_OBJECTS =

liblqr_test.so: CMakeFiles/lqr_test.dir/src/example.cpp.o
liblqr_test.so: CMakeFiles/lqr_test.dir/build.make
liblqr_test.so: CMakeFiles/lqr_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dfx-rick/ctrl_ws/build/ctrl_ws/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library liblqr_test.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lqr_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lqr_test.dir/build: liblqr_test.so

.PHONY : CMakeFiles/lqr_test.dir/build

CMakeFiles/lqr_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lqr_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lqr_test.dir/clean

CMakeFiles/lqr_test.dir/depend:
	cd /home/dfx-rick/ctrl_ws/build/ctrl_ws && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dfx-rick/ctrl_ws /home/dfx-rick/ctrl_ws /home/dfx-rick/ctrl_ws/build/ctrl_ws /home/dfx-rick/ctrl_ws/build/ctrl_ws /home/dfx-rick/ctrl_ws/build/ctrl_ws/CMakeFiles/lqr_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lqr_test.dir/depend

