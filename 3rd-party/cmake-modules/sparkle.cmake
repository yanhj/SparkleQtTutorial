# libSparkle 引用规则
# 包含以下可用变量
# libSparkle_INCLUDE_DIRS    头文件目录
# libSparkle_LIBS            LinkTarget

set(_ROOT "${CMAKE_CURRENT_LIST_DIR}/../modules/Sparkle")
if(MSVC)
    # windows
    message(FATAL_ERROR "FATAL: Sparkle not support windows .")
else()
    if(ANDROID)
    elseif(APPLE)
        if(IOS)
            # ios
        else()
            # macos
            set(libSparkle_ROOT "${_ROOT}/mac")
            set(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG "-Wl,-rpath,")

        endif()
        add_library(libSparkle SHARED IMPORTED)
        set(libSparkle_ROOT ${libSparkle_ROOT})
        message(STATUS "libSparkle_ROOT: ${libSparkle_ROOT}")
        set_target_properties(libSparkle PROPERTIES IMPORTED_LOCATION "${libSparkle_ROOT}/Sparkle.framework/Sparkle")
    else()
        # linux
        message(FATAL_ERROR "FATAL: Sparkle not support linux .")
    endif()

    set(libSparkle_LIBS libSparkle)
endif()

if(APPLE)
    set(libSparkle_INCLUDE_DIRS "${libSparkle_ROOT}/Sparkle.framework")
    set(libSparkle_FRAMEWORKS "${libSparkle_ROOT}/Sparkle.framework")
endif()
message(STATUS "libSparkle_INCLUDE_DIRS=${libSparkle_INCLUDE_DIRS}")

