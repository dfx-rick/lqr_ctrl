cmake_minimum_required(VERSION 3.5)

project(ctrl_ws)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

include_directories(${EIGEN3_INCLUDE_DIRS})
include_directories(include)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(Eigen3 REQUIRED)

add_library(lqr_base SHARED src/lqr.cpp)
ament_target_dependencies(lqr_base Eigen3)
target_include_directories(lqr_base PUBLIC include)

add_executable(lqr_implement src/ctrl_node.cpp)
ament_target_dependencies(lqr_implement Eigen3 rclcpp)
target_include_directories(lqr_implement PUBLIC include)
target_link_libraries(lqr_implement lqr_base)


install(DIRECTORY include/
    DESTINATION include
)

install(DIRECTORY script
    DESTINATION share/${PROJECT_NAME}
)

install(TARGETS lqr_base lqr_implement
  DESTINATION lib/${PROJECT_NAME}
)

install(TARGETS lqr_base
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
)





if(BUILD_TESTING)

    find_package(ament_lint_auto REQUIRED)
    ament_lint_auto_find_test_dependencies()

endif()

set(INCLUDE_DIRS
    ${EIGEN3_INCLUDE_DIRS}
    include
)

set(dependencies
    rclcpp
    Eigen3)

ament_export_include_directories(${INCLUDE_DIRS})
ament_export_libraries(lqr_base)
ament_export_dependencies(${dependencies})
ament_export_dependencies(eigen3_cmake_module)
ament_export_dependencies(Eigen3)
ament_package()