#
# Copyright (C) Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile
$(call inherit-product, device/realme/RMX2001/device.mk)

# Call proprietary blob setup
$(call inherit-product, vendor/realme/RMX2001/RMX2001-vendor.mk)

# Inherit some common Palladium stuff.
$(call inherit-product, vendor/palladium/config/common_full_phone.mk)

# Palladium stuff
PALLADIUM_BUILD_TYPE := OFFICIAL
TARGET_BOOT_ANIMATION_RES := 1080

# Build with GApps
ifeq ($(with_gapps), yes)
TARGET_GAPPS_ARCH := arm64
PALLADIUM_BUILD_VARIANT := GAPPS
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false 
endif

# True - OnePlus Launcher as default launcher
# Remove - Lawnchair as default launcher
# WITH_OPAPPS=true

# Palladium props
# PRODUCT_PRODUCT_PROPERTIES += \
        ro.palladiumdevice.maintainer=officialputuid \
        ro.palladiumdevice.cpu=MediaTek Helio G90T \
        ro.palladiumdevice.display=6.5 \
        ro.palladiumdevice.displaytype=IPS LCD \
        ro.palladiumdevice.battery=4300mAh \
        ro.palladiumdevice.camera=64MP+8MP+2MP+2MP

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := palladium_RMX2001
PRODUCT_DEVICE := RMX2001
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme G90T Series
PRODUCT_MANUFACTURER := realme

# Build info
BUILD_FINGERPRINT := "google/redfin/redfin:12/SPB5.210812.002/7671067:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=RMX2001 \
    PRODUCT_NAME=RMX2001 \
    PRIVATE_BUILD_DESC="redfin-user 12 SPB5.210812.002 7671067 release-key"

PRODUCT_GMS_CLIENTID_BASE := android-oppo
