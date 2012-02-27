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
# Inherit Vendor Files
$(call inherit-product-if-exists, vendor/twisted/twisted-vendor.mk)
$(call inherit-product-if-exists, vendor/twisted/google-neon.mk)
$(call inherit-product-if-exists, vendor/twisted/google-vendor.mk)

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

# Inherit Language Files
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := htc_supersonic
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := HTC Evo 4G
PRODUCT_MANUFACTURER := HTC

# Set up the product codename, build version & MOTD.
#PRODUCT_CODENAME := evo
#PRODUCT_VERSION_DEVICE_SPECIFIC := alpha9

#PRODUCT_MOTD :="Welcome to ics-deck"

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/root/init.supersonic.rc:root/init.supersonic.rc \
    device/htc/supersonic/prebuilt/root/init.supersonic.usb.rc:root/init.supersonic.usb.rc \
    device/htc/supersonic/prebuilt/root/ueventd.supersonic.rc:root/ueventd.supersonic.rc 

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

#
# Packages needed for Supersonic
#
# Sensors and stuff
PRODUCT_PACKAGES := \
    com.android.future.usb.accessory \
    gps.supersonic \
    lights.supersonic \
    sensors.supersonic \
    librs_jni

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k

# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.default \
    hwcomposer.qsd8k \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libQcomUI
# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    libOmxVdec \
    libstagefrighthw

# Camera
PRODUCT_PACKAGES += \
    camera.qsd8k \
    Camera

# Applications
PRODUCT_PACKAGES += \
    Development \
    FileManager \
    Stk \
    VoiceDialer \
    SpareParts \
    Torch

# CyanogenMod Packages
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Live Wallpapers
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    PhaseBeam \
    LiveWallpapers \
    VisualizationWallpapers

# Applications
PRODUCT_PACKAGES += \
    Mms \
    Superuser \
    su

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Google Applications
PRODUCT_COPY_FILES += \
    vendor/twisted/google/app/ChromeBookmarksSyncAdapter.apk:system/app/ChromeBookmarksSyncAdapter.apk \
    vendor/twisted/google/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    vendor/twisted/google/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    vendor/twisted/google/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    vendor/twisted/google/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    vendor/twisted/google/app/GoogleLoginService.apk:system/app/GoogleLoginService.apk \
    vendor/twisted/google/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    vendor/twisted/google/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    vendor/twisted/google/app/MarketUpdater.apk:system/app/MarketUpdater.apk \
    vendor/twisted/google/app/MediaUploader.apk:system/app/MediaUploader.apk \
    vendor/twisted/google/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
    vendor/twisted/google/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    vendor/twisted/google/app/SetupWizard.apk:system/app/SetupWizard.apk \
    vendor/twisted/google/app/Talk.apk:system/app/Talk.apk \
    vendor/twisted/google/app/Vending.apk:system/app/Vending.apk

# Google Permissions
PRODUCT_COPY_FILES += \
    vendor/twisted/google/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/twisted/google/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    vendor/twisted/google/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    vendor/twisted/google/etc/permissions/features.xml:system/etc/permissions/features.xml 

# Google Frameworks
PRODUCT_COPY_FILES += \
    vendor/twisted/google/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    vendor/twisted/google/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    vendor/twisted/google/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar

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

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/usr/keylayout/supersonic-keypad.kl:system/usr/keylayout/supersonic-keypad.kl \
    device/htc/supersonic/prebuilt/usr/keychars/supersonic-keypad.kcm.bin:system/usr/keychars/supersonic-keypad.kcm.bin \
    device/htc/supersonic/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/supersonic/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/supersonic/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd

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

# media profiles and capabilities spec
$(call inherit-product, device/htc/supersonic/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := htc_supersonic
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := Full Android on Supersonic
