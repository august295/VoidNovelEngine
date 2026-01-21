# 设置 vcpkg 配置
if(CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")
elseif(CMAKE_HOST_SYSTEM_NAME MATCHES "Linux")
    if(NOT DEFINED VCPKG_ROOT)
        if(DEFINED ENV{VCPKG_ROOT})
            set(VCPKG_ROOT "$ENV{VCPKG_ROOT}")
        else()
            set(VCPKG_ROOT "$ENV{HOME}/vcpkg")
        endif()
    endif()

    # 设置工具链文件
    set(CMAKE_TOOLCHAIN_FILE "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
    set(VCPKG_TARGET_TRIPLET "x64-linux")
    set(PKG_CONFIG_EXECUTABLE "${VCPKG_ROOT}/installed/${VCPKG_TARGET_TRIPLET}/tools/pkgconf/pkgconf")
    set(PKG_CONFIG_PATH "${VCPKG_ROOT}/installed/${VCPKG_TARGET_TRIPLET}/lib/pkgconfig")
    set(CMAKE_PREFIX_PATH "${VCPKG_ROOT}/installed/${VCPKG_TARGET_TRIPLET}")
    message(STATUS "VCPKG_ROOT: ${VCPKG_ROOT}")
    message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")
    message(STATUS "PKG_CONFIG_EXECUTABLE: ${PKG_CONFIG_EXECUTABLE}")
    message(STATUS "PKG_CONFIG_PATH: ${PKG_CONFIG_PATH}")
    message(STATUS "CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
endif()

################################################################################
# 3RDPARTY
################################################################################
macro(VCPKG_LOAD_3RDPARTY)
    message(STATUS "Loading 3rd party libraries from vcpkg...")

    # lua
    find_package(Lua 5.4.7 REQUIRED)
    if(LUA_FOUND)
        message(STATUS "Lua includes: ${LUA_INCLUDE_DIR}")
        message(STATUS "Lua libraries: ${LUA_LIBRARIES}")
    endif()

    # raylib
    find_package(raylib CONFIG REQUIRED)

    # SDL
    find_package(SDL2 CONFIG REQUIRED)
    if(SDL2_FOUND)
        message(STATUS "SDL2 includes: ${SDL2_INCLUDE_DIRS}")
        message(STATUS "SDL2 libraries: ${SDL2_LIBRARIES}")
    endif()
    find_package(sdl2-gfx CONFIG REQUIRED)
    find_package(SDL2_image CONFIG REQUIRED)
    find_package(SDL2_mixer CONFIG REQUIRED)
    find_package(SDL2_net CONFIG REQUIRED)
    find_package(SDL2_ttf CONFIG REQUIRED)
endmacro()
