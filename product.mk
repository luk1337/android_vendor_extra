# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif

# iperf
PRODUCT_PACKAGES += iperf
