
HI3881_OPENIPC_VERSION = 1.0
HI3881_OPENIPC_SITE = $(BR2_EXTERNAL_GENERAL_PATH)/package/hi3881-openipc
HI3881_OPENIPC_SOURCE = Hi3881V100R001C00SPC021.tgz
HI3881_OPENIPC_SITE_METHOD = file
HI3881_OPENIPC_LICENSE = Proprietary

# 依赖 linux 内核编译
HI3881_OPENIPC_DEPENDENCIES = linux

define HI3881_OPENIPC_BUILD_CMDS
   @echo "================ Building Hi3881 Driver ================"
   mkdir -p $(@D)/build/build_tmp/logs
   $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
       ARCH=arm \
       CROSS_COMPILE=$(TARGET_CROSS) \
       KDIR=$(LINUX_DIR) \
       KCFLAGS="-w" \
       linux_driver
endef

define HI3881_OPENIPC_INSTALL_TARGET_CMDS
   @echo "================ Installing Hi3881 Module ================"
   $(INSTALL) -D -m 644 $(@D)/driver/hi3881.ko \
       $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/hi3881.ko
   $(INSTALL) -D -m 644 $(@D)/firmware/hi3881_fw.bin \
       $(TARGET_DIR)/vendor/firmware/hisilicon/hi3881_fw.bin
   $(INSTALL) -D -m 644 $(@D)/firmware/wifi_cfg/customer1/wifi_cfg \
       $(TARGET_DIR)/vendor/firmware/hisilicon/wifi_cfg
endef

$(eval $(generic-package))
