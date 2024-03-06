LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

VPU_OUT := $(TARGET_OUT_INTERMEDIATES)/VPU_OBJ
MEMALLOC_KO = $(VPU_OUT)/ko/memalloc.ko
MEMALLOC_DIR := $(LOCAL_PATH)

$(MEMALLOC_KO):
	$(MAKE_TOOL) -C $(MEMALLOC_DIR) KDIR=$(KERNEL_DIR) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH); \
	cp $(MEMALLOC_DIR)/memalloc.ko $(MEMALLOC_KO)

LOCAL_PREBUILT_MODULE_FILE := \
    $(MEMALLOC_KO)

LOCAL_GENERATED_SOURCES += \
    $(MEMALLOC_KO)

LOCAL_MODULE_RELATIVE_PATH := modules

LOCAL_MODULE        := memalloc
LOCAL_MODULE_SUFFIX := .ko
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
LOCAL_STRIP_MODULE  := false

include $(BUILD_PREBUILT)