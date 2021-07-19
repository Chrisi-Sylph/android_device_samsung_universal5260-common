LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE            := fstab.universal5260
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := etc/fstab.universal5260
LOCAL_MODULE_PATH       := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.ramdisk
LOCAL_MODULE_STEM  := fstab.universal5260
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.universal5260
LOCAL_MODULE_PATH  := $(TARGET_RAMDISK_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= init.samsung.rc
LOCAL_MODULE_TAGS	:= optional
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= etc/init.samsung.rc
LOCAL_MODULE_PATH	:= $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= init.universal5260.rc
LOCAL_MODULE_TAGS	:= optional
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= etc/init.universal5260.rc
LOCAL_MODULE_PATH	:= $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := init.recovery.universal5260.rc
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := etc/init.recovery.universal5260.rc
LOCAL_MODULE_PATH   := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= init.universal5260.usb.rc
LOCAL_MODULE_TAGS	:= optional
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= etc/init.universal5260.usb.rc
LOCAL_MODULE_PATH	:= $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= init.universal5260.wifi.rc
LOCAL_MODULE_TAGS	:= optional
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= etc/init.universal5260.wifi.rc
LOCAL_MODULE_PATH	:= $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= ueventd.universal5260.rc
LOCAL_MODULE_STEM   := ueventd.rc
LOCAL_MODULE_TAGS	:= optional
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= etc/ueventd.universal5260.rc
LOCAL_MODULE_PATH	:= $(TARGET_OUT_VENDOR)
include $(BUILD_PREBUILT)
