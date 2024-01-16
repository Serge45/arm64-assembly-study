ASSEMBLER=as
LINKER=ld
OUTPUT_DIR=build
SRCS=$(wildcard **/*.s)
OBJS=$(patsubst %.s, %.o, $(SRCS))
EXECS=$(patsubst %.o, %, $(OBJS))
OUT_OBJS=$(addprefix $(OUTPUT_DIR)/, $(OBJS))
OUT_EXECS=$(addprefix $(OUTPUT_DIR)/, $(EXECS))

all: $(OUT_EXECS)

$(OUT_OBJS): $(OUTPUT_DIR)/%.o : %.s
	@mkdir -p $(@D)
	$(ASSEMBLER) $< -g -o $@

$(OUT_EXECS): % : %.o
	$(LINKER) $< -o $@

.phony: clean

clean:
	rm -rf $(OUTPUT_DIR)
