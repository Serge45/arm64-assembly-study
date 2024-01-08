ASSEMBLER=as
LINKER=ld
OUTPUT_DIR=build
SRCS=$(shell ls **/*.s)
OBJS=$(patsubst %.s, %.o, $(SRCS))
EXECS=$(patsubst %.o, %, $(OBJS))
OUT_OBJS=$(addprefix $(OUTPUT_DIR)/, $(OBJS))
OUT_EXECS=$(addprefix $(OUTPUT_DIR)/, $(EXECS))

all: $(OUT_EXECS)

$(OUT_OBJS): $(SRCS)
	@mkdir -p $(@D)
	$(ASSEMBLER) $< -o $@

$(OUT_EXECS): $(OUT_OBJS)
	$(LINKER) $< -o $@

.phony: clean

clean:
	rm -rf $(OUTPUT_DIR)
