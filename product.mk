# Default ADB shell prompt
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
endif

# iperf3
PRODUCT_PACKAGES += iperf3
