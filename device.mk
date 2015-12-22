#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product, device/samsung/smdk4210-tab/device.mk)
$(call inherit-product-if-exists, vendor/samsung/p6200/vendor.mk)

# Set preferred size for assets
PRODUCT_AAPT_PREF_CONFIG := mdpi

# use init.smdk4210.rc for p6200
PRODUCT_COPY_FILES += \
	device/samsung/smdk4210-tab/rootdir/init.smdk4210.rc:root/init.smdk4210.rc

# International variants have proximity sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

# GPS
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
PRODUCT_COPY_FILES += \
    device/samsung/smdk4210-tab/configs/etc/gps.cer:system/etc/gps.cer \
    device/samsung/smdk4210-tab/configs/etc/gps.xml:system/etc/gps.xml

# We need to build the GPS interposition library for the GPS to work, also M removes
# libstlport, but some of our blobs need it, so we add it back in source
PRODUCT_PACKAGES += \
	libdmitry

# Radio
$(call inherit-product, build/target/product/telephony.mk)

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungExynos4RIL \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000

PRODUCT_COPY_FILES += \
    device/samsung/smdk4210-tab/configs/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# extra packages
PRODUCT_PACKAGES += \
    messaging \
    SamsungServiceMode \
    VoiceDialer \
    libsecril-client \
    libsecril-client-sap
