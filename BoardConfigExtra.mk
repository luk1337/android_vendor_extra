# Google Apps
ifeq ($(WITH_GMS), true)
include vendor/gapps/common/BoardConfigVendor.mk
endif

# Properties
TARGET_SYSTEM_PROP += vendor/extra/system.prop
