# Google Apps
ifeq ($(WITH_GMS), true)
-include vendor/gapps/arm64/BoardConfigVendor.mk
endif

# USB serial
#   modprobe cdc-acm
#   putty -serial /dev/ttyACM0 -sercfg 115200
#   or
#   while true; do test -e /dev/ttyACM0 && sleep 0.1 && cat /dev/ttyACM0 | grep -vE "^\s?\n$"; done
ifeq ($(WITH_USB_SERIAL), true)
BOARD_KERNEL_CMDLINE += console=ttyGS0
TARGET_KERNEL_CONFIG_EXT += vendor/extra/usbserial.config
endif
