#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic supersonic,
# not specialized for any geography.
#

# Set up the product codename, build version & MOTD.
#PRODUCT_CODENAME := evo
#PRODUCT_VERSION_DEVICE_SPECIFIC := alpha9

#PRODUCT_MOTD :="Welcome to ics-deck"

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/root/init.supersonic.rc:root/init.supersonic.rc \
    device/htc/supersonic/prebuilt/root/ueventd.supersonic.rc:root/ueventd.supersonic.rc 

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/supersonic/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/firmware/default.acdb:/system/etc/firmware/default.acdb

# Sensors and stuff
PRODUCT_PACKAGES := \
    gps.supersonic \
    lights.supersonic \
    sensors.supersonic

# Temporary hack
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/usr/keylayout/supersonic-keypad.kl:system/usr/keylayout/supersonic-keypad.kl \
    device/htc/supersonic/prebuilt/usr/keychars/supersonic-keypad.kcm.bin:system/usr/keychars/supersonic-keypad.kcm.bin \
    device/htc/supersonic/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/supersonic/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

# Enable gpu composition 0 => cpu composition, 1 => gpu composition
# Note: composition.type overrides this so i probably don't even need it.
PRODUCT_PROPERTY_OVERRIDES += debug.sf.hw=1

# Enable copybit composition
PRODUCT_PROPERTY_OVERRIDES += debug.composition.type=mdp

# Force 2 buffers - gralloc defaults to 3 and we only have 2
PRODUCT_PROPERTY_OVERRIDES += debug.gr.numframebuffers=2

# HardwareRenderer properties
# dirty_regions: "false" to disable partial invalidates, override if enabletr=true
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    hwui.print_config=choice \
    debug.enabletr=false

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# High-density art, but English locale
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/supersonic/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# sysctl
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# Kernel Modules
PRODUCT_COPY_FILES += $(shell \
    find device/htc/supersonic/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/lib/libcryp98.so:system/lib/libcryp98.so

# Temporary camera blob replacement
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
    device/htc/supersonic/prebuilt/lib/libcamera.so:system/lib/libcamera.so

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/htc/supersonic/prebuilt/root/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Script to signal boot completion for init.d
PRODUCT_COPY_FILES += \
    device/htc/speedy/prebuilt/system/etc/init.d/100complete:system/etc/init.d/100complete

# common qsd8k configs
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/supersonic/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := htc_supersonic
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := HTC Evo 4G
PRODUCT_MANUFACTURER := HTC

# USB
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage
