#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.sh \

PRODUCT_PACKAGES += \
    fstab.enableswap \
    meta_init.project.rc \
    init.sensor_1_0.rc \
    multi_init.rc \
    init.mt6781.rc \
    init_connectivity.rc \
    factory_init.project.rc \
    factory_init.connectivity.rc \
    init.modem.rc \
    init.project.rc \
    init.ago.rc \
    meta_init.connectivity.common.rc \
    meta_init.modem.rc \
    init.aee.rc \
    meta_init.rc \
    factory_init.connectivity.common.rc \
    meta_init.vendor.rc \
    init.mt6781.usb.rc \
    init.connectivity.common.rc \
    factory_init.rc \
    init.connectivity.rc \
    meta_init.connectivity.rc \
    init.cgroup.rc \
    init.recovery.mt6781.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.enableswap:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.enableswap

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/Infinix/X6827/X6827-vendor.mk)
