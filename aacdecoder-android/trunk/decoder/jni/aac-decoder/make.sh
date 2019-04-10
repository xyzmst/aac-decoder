#!/bin/bash
export NDK_PATH="/Users/mst/android-ndk-r17c"
export CC="$NDK_PATH/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-gcc"
export CFLAGS="--sysroot=$NDK_PATH/platforms/android-26/arch-arm  \
 -isysroot  $NDK_PATH/sysroot  \
 -isystem $NDK_PATH/sysroot/usr/include/arm-linux-androideabi \
 -llog  \
 -L/Users/mst/AndroidStudioProjects/8.0/aac-decoder/aacdecoder-android/trunk/decoder/jni/aac-decoder \
  -ldecoder-opencore-aacdec -ldecoder-opencore-mp3dec -lpv_aac_dec -lpv_mp3_dec -lstdc++ \
 -shared -fPIC \
 -c aac-decoder.c -o libaacdecoder.so

 "

 $CC $CFLAGS

