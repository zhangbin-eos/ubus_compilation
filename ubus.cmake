set(CMAKE_SYSTEM_NAME Linux)
 
# SET(TOOLCHAIN_DIR "/opt/ssc_toolchains/arm-buildroot-linux-uclibcgnueabihf-4.9.4-uclibc-1.0.31")
set(CMAKE_C_COMPILER $ENV{CROSS_COMPILE}gcc)
set(CMAKE_CXX_COMPILER $ENV{CROSS_COMPILE}g++)

set(INSTALL_PATH $ENV{INSTALL_DIR})
include_directories(${INSTALL_PATH}/include)
 
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
 
set(blob_library     ${INSTALL_PATH}/lib/libblobmsg_json.so)
set(json             ${INSTALL_PATH}/lib/libjson-c.so)
set(ubox_include_dir ${INSTALL_PATH}/include/libubox)
set(ubox_library     ${INSTALL_PATH}/lib/libubox.so)
set(LUAPATH $ENV{INSTALL_DIR}/lib/lua/5.1)
set(LUA_CFLAGS "-I${INSTALL_PATH}/include -L${INSTALL_PATH}/lib")
