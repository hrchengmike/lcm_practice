#ROOT_PATH    := $(shell pwd)
ROOT_PATH	 :=/home/hrcheng/winter_2022/lcm_practice
SRC_PATH     := $(ROOT_PATH)/src
BIN_PATH     := $(ROOT_PATH)/bin
LIB_PATH     := $(ROOT_PATH)/lib

# LDFLAGS
LDFLAGS_STD  := -lm -lpthread
LDFLAGS_LCM := `pkg-config --libs lcm`
LDFLAGS_LCMTYPES := -L$(LIB_PATH) -llcmtypes $(LDFLAGS_LCM)

CC = gcc
CFLAGS = -g `pkg-config --cflags lcm`

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@
