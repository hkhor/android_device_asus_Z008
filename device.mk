#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

#Prebuilt kernel
#TARGET_PREBUILT_KERNEL := device/asus/mofd-common/kernel
#PRODUCT_COPY_FILES += \
#	$(TARGET_PREBUILT_KERNEL):kernel

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Boot image Signature
PRODUCT_COPY_FILES += \
    device/asus/Z008/keys/boot_z008.sig:install/bin/boot.sig

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/Z008/overlay

$(call inherit-product-if-exists, vendor/asus/Z008/Z008-vendor.mk)

# Inherit from mofd-common
$(call inherit-product, device/asus/mofd-common/mofd.mk)
