export PRJ_ROOT=$(shell pwd)
export INSTALL_DIR=$(PRJ_ROOT)/__install
export CROSS_COMPILE=aarch64-himix200-linux-
export BUILD_DIR=$(PRJ_ROOT)/build

RM=rm -rf

all:prepare json-c lua-5.1 libubox ubus

prepare:$(PRJ_ROOT) $(BUILD_DIR)

$(PRJ_ROOT):
	mkdir -p $(PRJ_ROOT)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)



json-c:
	mkdir -p $(BUILD_DIR)/json-c/
	cd $(BUILD_DIR)/json-c/ && cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_TOOLCHAIN_FILE=$(PRJ_ROOT)/json-c.cmake ../../json-c && make && make install
	cd ${INSTALL_DIR}/include && rm -rf json && ln -s json-c json


clean_json-c:
	${RM} $(BUILD_DIR)/json-c/

lua-5.1:$(BUILD_DIR)/lua-5.1.5
	cd $(BUILD_DIR)/lua-5.1.5 && make posix CC=$(CROSS_COMPILE)gcc AR="$(CROSS_COMPILE)ar rcu" RANLIB=$(CROSS_COMPILE)ranlib
	cd $(BUILD_DIR)/lua-5.1.5 && make install INSTALL_TOP=${INSTALL_DIR}

$(BUILD_DIR)/lua-5.1.5:lua-5.1.5.tar.gz
	tar -xzf lua-5.1.5.tar.gz -C $(BUILD_DIR)

clean_lua-5.1:
	${RM} $(BUILD_DIR)/lua-5.1.5

libubox:
	mkdir -p $(BUILD_DIR)/libubox/
	cd $(BUILD_DIR)/libubox/ && cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_TOOLCHAIN_FILE=$(PRJ_ROOT)/libubox.cmake ../../libubox && make && make install

clean_libubox:
	${RM} $(BUILD_DIR)/libubox/

ubus:
	mkdir -p $(BUILD_DIR)/ubus/
	cd $(BUILD_DIR)/ubus/ && cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_TOOLCHAIN_FILE=$(PRJ_ROOT)/ubus.cmake ../../ubus && make && make install

clean_ubus:
	${RM} $(BUILD_DIR)/ubus/

.PHONY:json-c lua-5.1 libubox ubus clean

clean: clean_json-c clean_lua-5.1 clean_libubox clean_ubus
	${RM} ${BUILD_DIR} -rf
	${RM} ${INSTALL_DIR} -rf
