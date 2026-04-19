EXTRA_PATH := vendor/extra

# ADB
ifneq (,$(wildcard $(EXTRA_PATH)/adbkey.pub))
PRODUCT_ADB_KEYS := $(EXTRA_PATH)/adbkey.pub
PRODUCT_COPY_FILES += $(PRODUCT_ADB_KEYS):$(TARGET_COPY_OUT_RECOVERY)/root/$(TARGET_COPY_OUT_PRODUCT)/etc/security/adb_keys
endif

# Bellis
ifneq (,$(wildcard packages/apps/Bellis))
PRODUCT_PACKAGES += Bellis
endif

# Default ADB shell prompt
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
endif

# ih8sn
ifneq (,$(wildcard vendor/ih8sn))
$(call inherit-product-if-exists, $(EXTRA_PATH)/ih8sn/ih8sn.mk)
endif

# iperf3
PRODUCT_PACKAGES += iperf3

# Overlays
PRODUCT_PACKAGE_OVERLAYS += $(EXTRA_PATH)/overlay-lineage

# Rescue party
ifeq ($(WITH_RESCUE_PARTY), false)
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.sys.disable_rescue=true
endif

# SUW
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.setupwizard.ignore_sim_locale=true

# tinymix
PRODUCT_PACKAGES += tinymix

# USB serial
#   modprobe cdc-acm
#   putty -serial /dev/ttyACM0 -sercfg 115200
#   or
#   while true; do test -e /dev/ttyACM0 && sleep 0.1 && cat /dev/ttyACM0 | grep -vE "^\s?\n$"; done
ifeq ($(WITH_USB_SERIAL), true)
PRODUCT_COPY_FILES += $(EXTRA_PATH)/usbserial.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/usbserial.rc
endif
