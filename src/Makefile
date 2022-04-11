include ../common.mk

LDFLAGS = 	$(LDFLAGS_LCMTYPES) \
			$(LDFLAGS_LCM) \

LIBDEPS = $(call libdeps, $(LDFLAGS))
BIN_LCM_SIMPLE = $(BIN_PATH)/lcm_simple
ALL = $(BIN_LCM_SIMPLE)

all: $(ALL)

$(BIN_LCM_SIMPLE): lcm_simple.o $(LIBDEPS)
	@echo "    $@"
	@$(CC) -o $@ $^ $(LDFLAGS) $(CFLAGS)

clean:
	@rm -f *.o *~ *.a
	@rm -f $(ALL)
