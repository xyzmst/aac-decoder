LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOGLEVELS =

# Loglevels
ifeq ($(LOGLEVEL),error)
	LOGLEVELS	+= ERROR
endif
ifeq ($(LOGLEVEL),warn)
	LOGLEVELS	+= ERROR WARN
endif
ifeq ($(LOGLEVEL),info)
	LOGLEVELS	+= ERROR WARN INFO
endif
ifeq ($(LOGLEVEL),debug)
	LOGLEVELS	+= ERROR WARN INFO DEBUG
endif
ifeq ($(LOGLEVEL),trace)
	LOGLEVELS	+= ERROR WARN INFO DEBUG TRACE
endif

cflags_loglevels	:= $(foreach ll,$(LOGLEVELS),-DAACD_LOGLEVEL_$(ll))


# Final library:
LOCAL_MODULE 			:= aacdecoder
LOCAL_SRC_FILES 		:= aac-decoder.c
LOCAL_CFLAGS 			:= $(cflags_loglevels)
LOCAL_LDLIBS 			:= -llog


LOCAL_STATIC_LIBRARIES 	:= decoder-opencore-aacdec decoder-opencore-mp3dec libpv_aac_dec libpv_mp3_dec
#添加本地链接库
#LOCAL_LDFLAGS 	:=  $(LOCAL_PATH)/libdecoder-opencore-aacdec.a  $(LOCAL_PATH)/libdecoder-opencore-mp3dec.a $(LOCAL_PATH)/libpv_aac_dec.a $(LOCAL_PATH)/libpv_mp3_dec.a

LOCAL_DISABLE_FATAL_LINKER_WARNINGS=true
#LOCAL_LDLIBS += -Wl,--no-warn-shared-textrel
#LOCAL_CFLAGS += -v -fPIC
#LOCAL_CFLAGS += -fPIC
LOCAL_LDFLAGS += -fPIC
include $(BUILD_SHARED_LIBRARY)


# Build components:
include $(LOCAL_PATH)/decoder-opencore-aacdec.mk
include $(LOCAL_PATH)/decoder-opencore-mp3dec.mk


$(warning "LOCAL_CFLAGS ======= $(LOCAL_CFLAGS)")
$(warning "LOCAL_LDFLAGS ======= $(LOCAL_LDFLAGS)")
