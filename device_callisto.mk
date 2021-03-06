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



## Build the ath6kl-compat driver
BOARD_WLAN_DEVICE := ath6kl_compat

## SAMSUNG_BOOTLOADER is the product model changed into appropriate string parsed by init.
## Example: -GT-I5500 becomes gt-i5500board, -GT-S5830 becomes gt-s5830board, and so on.
SAMSUNG_BOOTLOADER := $(shell echo $(PRODUCT_VERSION_DEVICE_SPECIFIC)board | tr '[A-Z]' '[a-z]' | cut -c 2-)

## Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27

ifdef BOARD_HAVE_BLUETOOTH_BLUEZ
## BlueZ support
## BlueZ: binaries
PRODUCT_PACKAGES += \
    bluetoothd \
    brcm_patchram_plus \
    libbluetoothd \
    hcitool \
    hciconfig \
    hciattach

## BlueZ: configs
PRODUCT_COPY_FILES += \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
    system/bluetooth/data/network.conf:system/etc/bluetooth/network.conf
#    system/bluetooth/data/stack.conf:system/etc/bluetooth/stack.conf

## BlueZ: javax.btobex is required by Bluetooth_msm
PRODUCT_PACKAGES += \
    javax.btobex

## BlueZ: properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.bluetooth.stack=bluez \
    ro.qualcomm.bluetooth.dun=true \
    ro.qualcomm.bluetooth.ftp=true \
    ro.qualcomm.bluetooth.hfp=true \
    ro.qualcomm.bluetooth.hsp=true \
    ro.qualcomm.bluetooth.map=true \
    ro.qualcomm.bluetooth.nap=true \
    ro.qualcomm.bluetooth.opp=true \
    ro.qualcomm.bluetooth.pbap=true \
    ro.qualcomm.bluetooth.sap=true

endif

## FM Radio
PRODUCT_PACKAGES += \
    Effem \
    libfmradio.bcm2049

## FM Radio permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

## Camera
PRODUCT_PACKAGES += \
    camera.msm7x27 \
    libcamera

## GalaxyParts
PRODUCT_PACKAGES += \
    GalaxyParts

## GalaxyParts support files
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/bin/galaxyparts:system/bin/galaxyparts

## GPS
PRODUCT_PACKAGES += \
    gps.msm7x27 \
    librpc

## Other
PRODUCT_PACKAGES += \
    lights.msm7x27 \
    power.msm7x27 \
    make_ext4fs \
    brcm_patchram_plus \
    setup_fs

## Ramdisk
PRODUCT_PACKAGES += \
	fstab.$(SAMSUNG_BOOTLOADER) \
	init.$(SAMSUNG_BOOTLOADER).rc \
	init.$(SAMSUNG_BOOTLOADER).parts.rc \
	init.$(SAMSUNG_BOOTLOADER).usb.rc \
	init.recovery.$(SAMSUNG_BOOTLOADER).rc \
	ueventd.$(SAMSUNG_BOOTLOADER).rc \
	CALLISTO.rle

## Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Wi-Fi & networking
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/callisto/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/callisto/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

## Media
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/callisto/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/callisto/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/callisto/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

## Media Profiles
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

## Keymap
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/callisto/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl

## Keychar
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/usr/keylayout/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/callisto/prebuilt/usr/keylayout/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/callisto/prebuilt/usr/keylayout/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/callisto/prebuilt/usr/keylayout/Generic.kcm:system/usr/keylayout/Generic.kcm

## Keychars
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/usr/keychars/sec_keypad.kcm:system/usr/keychars/sec_keypad.kcm

## Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/usr/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# GPS conf
PRODUCT_COPY_FILES += \
    device/samsung/callisto/prebuilt/etc/gps.conf:system/etc/gps.conf

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/callisto/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts

### BEGIN: Common properties

## Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=0 \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y

## Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=1 \
    ro.secure=1 \
    ro.allow.mock.location=0

## Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.no_hw_vsync=0 \
    persist.sys.force_highendgfx=1

## Loop ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.delay=3000 \
    ro.telephony.call_ring.multiple=false

## Other
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    dev.sfbootcomplete=0 \
    ro.config.play.bootsound=0 \
    ro.setupwizard.enable_bypass=1

## RIL, telephony
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,gprs,ppp0 \
    rild.libargs=-d/dev/smd0 \
    rild.libpath=/system/lib/libsec-ril.so \
    ro.telephony.default_network=0 \
    ro.telephony.ril_class=SamsungMSMRIL

## SELinux - we're not ready for enforcing mode yet
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=permissive

## USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

## WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

## WiFi AP
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.ap.interface=wlan0

# Backport of extra_free_kbytes
# Note: KitKat's system server sets this; we just set it manually
PRODUCT_PROPERTY_OVERRIDES += \
    sys.sysctl.extra_free_kbytes=3072

# zRAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.default=26

### END: Common properties

# Inherit
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)
# callisto blobs > samsung common(device/vendor) > other blobs
$(call inherit-product, vendor/samsung/callisto/vendor_blobs.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Common assets
PRODUCT_AAPT_CONFIG := ldpi mdpi normal
PRODUCT_LOCALES := en_US fr_FR it_IT es_ES de_DE nl_NL cs_CZ \
    pl_PL ja_JP zh_TW zh_CN ru_RU ko_KR nb_NO es_US da_DK el_GR \
    tr_TR pt_PT pt_BR rm_CH sv_SE bg_BG ca_ES en_GB fi_FI hr_HR \
    hu_HU in_ID lv_LV ro_RO sk_SK sl_SI sr_RS vi_VN tl_PH sw_TZ \
    ms_MY af_ZA zu_ZA ug_CN en_XA ar_XB fr_CA et_EE ku_IQ

# Samsung callisto overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/callisto/overlay

## LDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
$(call inherit-product, device/ldpi-common/ldpi.mk)

# Half-res bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
