# a15-vendor.mk - Complete vendor makefile
# Copyright (C) 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from standard LineageOS products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Lineage common stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device-specific
$(call inherit-product, device/samsung/a15/device.mk)

PRODUCT_DEVICE := a15
PRODUCT_NAME := lineage_a15
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A155F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

# Build fingerprint override
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a15nsxx-user 15 AP3A.240905.015.A2 A155FXXU6CYE6 release-keys"

BUILD_FINGERPRINT := samsung/a15nsxx/a15:15/AP3A.240905.015.A2/A155FXXU6CYE6:user/release-keys

# Include proprietary files recursively from vendor
PRODUCT_COPY_FILES += \
    $(shell find vendor/samsung/a15/proprietary -type f -printf "%p:system/%p\n")

