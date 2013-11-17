#
# Copyright (C) 2012 The CyanogenMod Project
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

DEVICE_PACKAGE_OVERLAYS += device/samsung/p6200/overlay

# Include common smdk4210-tab configuration
-include device/samsung/smdk4210-tab/BoardConfigCommon.mk

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6260

TARGET_OTA_ASSERT_DEVICE := p6200,GT-P6200,GT-P6201,GT-P6200L

TARGET_KERNEL_CONFIG := cyanogenmod_p6200_defconfig

TARGET_RECOVERY_FSTAB := device/samsung/smdk4210-tab/fstab.smdk4210
RECOVERY_FSTAB_VERSION := 2 

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/p6200/bluetooth

BOARD_HAS_EARPIECE := true
