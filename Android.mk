# Copyright (C) 2017 The Google PixelROM Project (AOSP)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ims
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_OWNER := huawei
LOCAL_DEX_PREOPT := false
LOCAL_SRC_FILES := proprietary/app/ims/$(LOCAL_MODULE).apk
LOCAL_PRIVILEGED_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TimeService
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_OWNER := huawei
LOCAL_DEX_PREOPT := false
LOCAL_SRC_FILES := proprietary/app/TimeService/$(LOCAL_MODULE).apk
LOCAL_PRIVILEGED_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := VendorLinks
LOCAL_MODULE_OWNER := huawei
LOCAL_MODULE_TAGS := optional

LOCAL_POST_INSTALL_CMD := \
    test -s vendor/huawei/angler/proprietary/prebuilt/target/product/msm8994/system/etc/izat.conf || { \
    mkdir -p $(PRODUCT_OUT)/system/app/ims/lib/arm64; \
    ln -sf /vendor/app/lib64/libimscamera_jni.so $(PRODUCT_OUT)/system/app/ims/lib64/libimscamera_jni.so; \
    ln -sf /vendor/app/lib64/libimsmedia_jni.so $(PRODUCT_OUT)/system/app/ims/lib64/libimsmedia_jni.so; \
    mkdir -p $(PRODUCT_OUT)/vendor/etc/firmware/wcd9320; \
    ln -sf /data/misc/audio/wcd9320_anc.bin $(PRODUCT_OUT)/vendor/etc/firmware/wcd9320/wcd9320_anc.bin; \
    ln -sf /data/misc/audio/wcd9320_mad_audio.bin $(PRODUCT_OUT)/vendor/etc/firmware/wcd9320/wcd9320_mad_audio.bin; \
    ln -sf /data/misc/audio/wcd9320_mbhc.bin $(PRODUCT_OUT)/vendor/etc/firmware/wcd9320/wcd9320_mbhc.bin; \
    mkdir -p $(PRODUCT_OUT)/vendor/lib64; \
    ln -sf /vendor/lib64/egl/eglSubDriverAndroid.so $(PRODUCT_OUT)/vendor/lib64/eglSubDriverAndroid.so; \
    ln -sf /vendor/lib64/egl/libEGL_adreno.so $(PRODUCT_OUT)/vendor/lib64/libEGL_adreno.so; \
    ln -sf /vendor/lib64/egl/libGLESv1_CM_adreno.so $(PRODUCT_OUT)/vendor/lib64/libGLESv1_CM_adreno.so; \
    ln -sf /vendor/lib64/egl/libGLESv2_adreno.so $(PRODUCT_OUT)/vendor/lib64/libGLESv2_adreno.so }

include $(BUILD_PHONY_PACKAGE)
