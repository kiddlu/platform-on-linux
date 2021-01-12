export PLATFORM_DIR=$(shell pwd)
SHELL=/bin/bash

all: build cp2rootdir 

clean:build_clean

.PHONY:build
build:
	pushd $(PLATFORM_DIR)/adbd/;make;popd
	pushd $(PLATFORM_DIR)/init/;make;popd
	pushd $(PLATFORM_DIR)/logcat/;make;popd

.PHONY:cp2rootdir
cp2rootdir:
	cp $(PLATFORM_DIR)/adbd/build/adbd         $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/init         $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/getprop      $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/setprop      $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/service      $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/init/build/libprop.a    $(PLATFORM_DIR)/rootdir/platform/lib/
	cp -rf $(PLATFORM_DIR)/init/init/rootdir/* $(PLATFORM_DIR)/rootdir/platform/
	cp $(PLATFORM_DIR)/logcat/build/logwrapper $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/logcat/build/logcat     $(PLATFORM_DIR)/rootdir/platform/bin/
	cp $(PLATFORM_DIR)/logcat/build/liblog.a   $(PLATFORM_DIR)/rootdir/platform/lib/
	chmod a+x $(PLATFORM_DIR)/rootdir/platform/bin/

.PHONY:build_clean
build_clean:
	pushd $(PLATFORM_DIR)/adbd/;make rm;popd
	pushd $(PLATFORM_DIR)/init/;make rm;popd
	pushd $(PLATFORM_DIR)/logcat/;make rm;popd
