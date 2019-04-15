#!/bin/bash



NDK_PATH="/Users/mst/android-ndk-r17c"
CC="$NDK_PATH/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-gcc"


 SYSROOT="$NDK_PATH/platforms/android-26/arch-arm"
 ISYSROOT="$NDK_PATH/sysroot"
 ISYSTEM="$NDK_PATH/sysroot/usr/include/arm-linux-androideabi"




 PV_TOP="/Users/mst/AndroidStudioProjects/8.0/aac-decoder/android-opencore-20120628-patch-stereo"

 LOCAL_PATH="$PV_TOP/codecs_v2/audio/mp3/dec"


 LOCAL_CFLAGS="-DPV_ARM_GCC_V4 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DPV_COMPILER=1 -DPV_CPU_ARCH_VERSION=5 -fvisibility=hidden -fPIC"

 LOCAL_C_INCLUDES="-I$LOCAL_PATH/src $LOCAL_PATH/include \
-I$PV_TOP/oscl/oscl/config/android \
-I$PV_TOP/oscl/oscl/config/shared \
-I$PV_TOP/build_config/opencore_dynamic \
-I$PV_TOP/oscl/oscl/osclbase/src \
-I$PV_TOP/oscl/oscl/osclmemory/src \
-I$PV_TOP/oscl/oscl/osclerror/src
"


 LOCAL_SRC_FILES="$LOCAL_PATH/src/pvmp3_alias_reduction.cpp
$LOCAL_PATH/src/pvmp3_crc.cpp $LOCAL_PATH/src/pvmp3_dct_16.cpp
$LOCAL_PATH/src/pvmp3_dct_6.cpp $LOCAL_PATH/src/pvmp3_dct_9.cpp
$LOCAL_PATH/src/pvmp3_decode_header.cpp
$LOCAL_PATH/src/pvmp3_decode_huff_cw.cpp
$LOCAL_PATH/src/pvmp3_decoder.cpp
$LOCAL_PATH/src/pvmp3_dequantize_sample.cpp
$LOCAL_PATH/src/pvmp3_equalizer.cpp
$LOCAL_PATH/src/pvmp3_framedecoder.cpp
$LOCAL_PATH/src/pvmp3_get_main_data_size.cpp
$LOCAL_PATH/src/pvmp3_get_scale_factors.cpp
$LOCAL_PATH/src/pvmp3_get_side_info.cpp
$LOCAL_PATH/src/pvmp3_getbits.cpp
$LOCAL_PATH/src/pvmp3_huffman_decoding.cpp
$LOCAL_PATH/src/pvmp3_huffman_parsing.cpp
$LOCAL_PATH/src/pvmp3_imdct_synth.cpp
$LOCAL_PATH/src/pvmp3_mdct_18.cpp
$LOCAL_PATH/src/pvmp3_mdct_6.cpp
$LOCAL_PATH/src/pvmp3_mpeg2_get_scale_data.cpp
$LOCAL_PATH/src/pvmp3_mpeg2_get_scale_factors.cpp
$LOCAL_PATH/src/pvmp3_mpeg2_stereo_proc.cpp
$LOCAL_PATH/src/pvmp3_normalize.cpp
$LOCAL_PATH/src/pvmp3_poly_phase_synthesis.cpp
$LOCAL_PATH/src/pvmp3_polyphase_filter_window.cpp
$LOCAL_PATH/src/pvmp3_reorder.cpp
$LOCAL_PATH/src/pvmp3_seek_synch.cpp
$LOCAL_PATH/src/pvmp3_stereo_proc.cpp
$LOCAL_PATH/src/pvmp3_tables.cpp
$LOCAL_PATH/src/asm/pvmp3_dct_16_gcc.s
$LOCAL_PATH/src/asm/pvmp3_dct_9_gcc.s
$LOCAL_PATH/src/asm/pvmp3_mdct_18_gcc.s
$LOCAL_PATH/src/asm/pvmp3_polyphase_filter_window_gcc.s
"

#echo $LOCAL_C_INCLUDES
#echo -e '\n'
#echo $LOCAL_C_INCLUDES

#echo $CC $CFLAGS




CFLAGS="--sysroot=$SYSROOT  -isysroot  $ISYSROOT  -isystem $ISYSTEM $LOCAL_C_INCLUDES -I$LOCAL_PATH/include  -llog  -shared -fPIC  $LOCAL_SRC_FILES  -o libpv_mp3_dec.so"

 $CC $CFLAGS $LOCAL_CFLAGS

 #echo $CFLAGS