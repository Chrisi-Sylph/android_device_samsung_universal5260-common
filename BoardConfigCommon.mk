COMMON_PATH := device/samsung/universal5260-common

# true for full rom - false for recovery only
BUILDING_ROM := false

# true for build twrp - false for lineage recovery
BUILDING_TWRP := true

ifeq ($(BUILDING_TWRP),true)
RECOVERY_VARIANT := twrp
endif

ifeq ($(RECOVERY_VARIANT),twrp)
TW_EXCLUDE_BASH := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_TZDATA := true
TW_INTERNAL_STORAGE_PATH := /data/media
TW_INTERNAL_STORAGE_MOUNT_POINT := sdcard
TW_EXTERNAL_STORAGE_PATH := /external_sd
TW_EXTERNAL_STORAGE_MOUNT_POINT := external_sd
TW_NO_USB_STORAGE := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_HAS_DOWNLOAD_MODE := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_CPU_TEMP := true
TW_NO_REBOOT_BOOTLOADER := true
TW_EXCLUDE_SUPERSU := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/ramdisk/etc/fstab.universal5260
TARGET_KERNEL_CONFIG := lineageos_recovery_defconfig
else
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/ramdisk/etc/fstab.universal5260
TARGET_KERNEL_CONFIG := lineageos_recovery_defconfig
endif

RECOVERY_GRAPHICS_USE_LINELENGTH := true
DEVICE_RESOLUTION := 720x1280
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
LZMA_RAMDISK_TARGETS := recovery
ALLOW_MISSING_DEPENDENCIES=true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
    WITH_DEXPREOPT := true
  endif
endif

# Board
TARGET_BOOTLOADER_BOARD_NAME := universal5260
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_SLSI_VARIANT := bsp
TARGET_SOC := exynos5260
BOARD_VENDOR := samsung

# Backlight
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# Binder
TARGET_USES_64_BIT_BINDER := true

# Filesystems
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
TARGET_USERIMAGES_USE_EXT4 := true

# Graphics
BOARD_USES_EXYNOS5_COMMON_GRALLOC := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000

# (G)SCALER
BOARD_USES_SCALER := true
BOARD_USES_GSC_VIDEO := true
BOARD_USES_ONLY_GSC0_GSC1 := true

# Ignore warnings
BUILD_BROKEN_DUP_RULES := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/samsung/exynos5260
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_CUSTOM_BOOTIMG := true
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_LINUX_KERNEL_VERSION := 3.4

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2401239040
# 12629049344 - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12629032960
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200

# Partitions
BOARD_ROOT_EXTRA_FOLDERS := efs persist

# Power
TARGET_POWERHAL_VARIANT := samsung

# Recovery
BOARD_RECOVERY_SWIPE := true

ifeq ($(BUILDING_ROM),true)

# Audio
TARGET_AUDIOHAL_VARIANT := samsung
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
BOARD_BLUEDROID_VENDOR_CONF := $(COMMON_PATH)/bluetooth/libbt_vndcfg.txt

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# HDMI
BOARD_HDMI_INCAPABLE := true

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true

# Keymaster
BOARD_USES_TRUST_KEYMASTER := true

# Samsung  OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := false
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_TIMESTAMP_REORDER_SUPPORT := false
BOARD_USE_DEINTERLACING_SUPPORT := false
BOARD_USE_VP8ENC_SUPPORT := true
BOARD_USE_HEVCDEC_SUPPORT := true
BOARD_USE_HEVCENC_SUPPORT := true
BOARD_USE_HEVC_HWIP := false
BOARD_USE_VP9DEC_SUPPORT := true
BOARD_USE_VP9ENC_SUPPORT := false
BOARD_USE_CUSTOM_COMPONENT_SUPPORT := true
BOARD_USE_VIDEO_EXT_FOR_WFD_HDCP := false
BOARD_USE_SINGLE_PLANE_IN_DRM := false

# Seccomp filters
BOARD_SECCOMP_POLICY += $(COMMON_PATH)/seccomp

# SELinux
include device/lineage/sepolicy/exynos/sepolicy.mk
BOARD_SEPOLICY_TEE_FLAVOR := mobicore
include device/samsung_slsi/sepolicy/sepolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private

# For legacy HAL1 camera
SELINUX_IGNORE_NEVERALLOWS := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/egl/libGLES_mali.so|/vendor/lib/libgutils.so \
    /vendor/lib/libexynoscamera.so|/vendor/lib/libshim_camera.so

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

include vendor/samsung/hl3g/hl3g-vendor.mk
include vendor/samsung/universal5260-common/universal5260-common-vendor.mk

endif
