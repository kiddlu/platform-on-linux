export PLATFORM_DIR=$(shell pwd)
SHELL=/bin/bash

all: build

clean:build_clean

.PHONY:build
build:
	pushd $(PLATFORM_DIR)/adbd/;make;popd
	cp $(PLATFORM_DIR)/adbd/build/adbd         $(PLATFORM_DIR)/rootdir/platform/bin/

	pushd $(PLATFORM_DIR)/init/;make;popd
	cp $(PLATFORM_DIR)/init/build/init         $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/libprop.a    $(PLATFORM_DIR)/rootdir/platform/lib/
	cp $(PLATFORM_DIR)/init/build/getprop      $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/setprop      $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/service      $(PLATFORM_DIR)/rootdir/platform/bin/
	cp -rf $(PLATFORM_DIR)/init/init/rootdir/* $(PLATFORM_DIR)/rootdir/platform/

	pushd $(PLATFORM_DIR)/logcat/;make;popd
	cp $(PLATFORM_DIR)/logcat/build/liblog.a   $(PLATFORM_DIR)/rootdir/platform/lib/
	cp $(PLATFORM_DIR)/logcat/build/logwrapper $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/logcat/build/logcat     $(PLATFORM_DIR)/rootdir/platform/bin/

	pushd $(PLATFORM_DIR)/cbinder/;make;popd
	cp $(PLATFORM_DIR)/cbinder/build/libcbinder.a   $(PLATFORM_DIR)/rootdir/platform/lib/
	cp $(PLATFORM_DIR)/cbinder/build/binderd        $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/cbinder/build/fd_service     $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/cbinder/build/fd_client      $(PLATFORM_DIR)/rootdir/platform/bin/

	chmod a+x $(PLATFORM_DIR)/rootdir/platform/bin/

.PHONY:build_clean
build_clean:
	pushd $(PLATFORM_DIR)/adbd/;make rm;popd
	pushd $(PLATFORM_DIR)/init/;make rm;popd
	pushd $(PLATFORM_DIR)/logcat/;make rm;popd
