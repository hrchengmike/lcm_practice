include ../common.mk

LCM = lcm-gen
LCMTYPES_NAMES := $(shell ls *.lcm)

# Construct the pathnames to the C types
LCMTYPES_C := $(LCMTYPES_NAMES:%.lcm=%.c)
LCMTYPES_O = $(LCMTYPES_C:%.c=%.o)
LDFLAGS = $(LDFLAGS_STD) $(LDFLAGS_LCM)
LIBDEPS = $(call libdeps, $(LDFLAGS))

LIB_LCMTYPES = $(LIB_PATH)/liblcmtypes.a
ALL = $(LIB_LCMTYPES)

all: $(ALL)

$(LIB_LCMTYPES): $(LCMTYPES_O) $(LIBDEPS)
	@echo "    $@"
	@ar rc $@ $(LCMTYPES_O)

%.c: %.lcm
	$(LCM) -c --c-typeinfo $<
	$(LCM) -x $<

clean:
	@rm -f *.c *.h *.o *.cpp *.hpp *~
	@rm -f $(ALL)
