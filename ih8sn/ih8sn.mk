IH8SN_PATH := $(EXTRA_PATH)/ih8sn

ifneq (,$(wildcard $(IH8SN_PATH)/ih8sn.conf.$(TARGET_PRODUCT)))
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += system/bin/ih8sn system/etc/ih8sn.conf system/etc/init/ih8sn.rc
PRODUCT_COPY_FILES += $(IH8SN_PATH)/ih8sn.conf.$(TARGET_PRODUCT):$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf
PRODUCT_PACKAGES += ih8sn
endif
