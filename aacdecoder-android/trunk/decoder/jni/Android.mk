mydir := $(call my-dir)

#
# Include the user's properties:
#
include $(mydir)/../../.ant.properties

PV_TOP 			:=	$(opencore-top.dir)
OPENCORE_DIR 	:=	$(opencore-top.dir)/codecs_v2/audio/aac/dec
OPENCORE_MP3 	:=	$(opencore-top.dir)/codecs_v2/audio/mp3/dec
OSCL_DIR	 	:=	$(opencore-top.dir)/oscl/oscl
LOGLEVEL 		:=	$(jni.loglevel)


include $(mydir)/aac-decoder/Android.mk
#include $(mydir)/opencore-aacdec/Android.mk
#include $(mydir)/opencore-mp3dec/Android.mk

#include $(PV_TOP)/../mp3dec/Android.mk

LOCAL_LDLIBS += -Wl,--no-warn-shared-textrel
LOCAL_LDFLAGS += -fPIC
dump:
	$(warning $(modules-dump-database))
	$(warning $(dump-src-file-tags))
	$(error Dump finished)
$(warning "PV_TOP ========== $(PV_TOP)")