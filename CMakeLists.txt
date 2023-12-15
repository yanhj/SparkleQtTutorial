cmake_minimum_required(VERSION 3.26)
set(APP_NAME SparkleQtTutorial)
project(${APP_NAME})

# 指定要查找的 Qt 版本
set(Qt5_VERSION_MIN "5.15.13")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${QT_PATH}" )
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "${QT_PATH}" )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

include(./3rd-party/cmake-modules/sparkle.cmake)
include_directories(${libSparkle_INCLUDE_DIRS})
find_package(Qt5 COMPONENTS
        Core
        Gui
        Widgets
        REQUIRED)

FILE(GLOB_RECURSE SOURCE_FILES
        ${CMAKE_CURRENT_LIST_DIR}/Src/*.cpp
        ${CMAKE_CURRENT_LIST_DIR}/Src/*.h
        ${CMAKE_CURRENT_LIST_DIR}/Src/*.ui
        ${CMAKE_CURRENT_LIST_DIR}/Src/*.mm
)

add_executable(${APP_NAME} MACOSX_BUNDLE ${SOURCE_FILES})
target_link_libraries(${APP_NAME}
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
        ${libSparkle_LIBS}
)
target_link_libraries(${APP_NAME}  "-framework Foundation")

message(STATUS "libSparkle_FRAMEWORKS: ${libSparkle_FRAMEWORKS}")

INSTALL( DIRECTORY
        ${libSparkle_FRAMEWORKS}
        DESTINATION "$<TARGET_BUNDLE_CONTENT_DIR:${APP_NAME}>/Frameworks"
)
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/assets/Info.plist
        DESTINATION "$<TARGET_BUNDLE_CONTENT_DIR:${APP_NAME}>")