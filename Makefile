# Cooking Grilled Chicken

BASEDIR := $(shell pwd)
SRC_DIR := $(BASEDIR)/src
UNAME_S := $(shell uname -s)

CHICKEN_REPOSITORY:= $(BASEDIR)/eggs
VENDOR_DIR:= $(BASEDIR)/vendor
DEPS := anaphora clojurian continuations format nrepl mini-kanren

run: all
	bin/foo-exe

all: clean grilling
	mv foo-exe bin

grilling:
	csc -static -deploy src/*.scm -optimize-level 3 -output-file foo-exe

deps:
	@mkdir -p $(VENDOR_DIR)
	@cd $(VENDOR_DIR); chicken-install -r $(DEPS)
	@mkdir -p $(CHICKEN_REPOSITORY)/lib/chicken/8
	chicken-install -init $(CHICKEN_REPOSITORY)/lib/chicken/8
	chicken-install -p $(CHICKEN_REPOSITORY) $(DEPS)

file-check:
ifeq ($(UNAME_S), Linux)
file-check: _file-check-linux
endif
ifeq ($(UNAME_S), Darwin)
file-check: _file-check-osx
endif

_file-check-linux:
	du -h bin/foo-exe
	file bin/foo-exe
	objdump -f bin/foo-exe
	ldd bin/foo-exe

_file-check-osx:
	du -h bin/foo-exe
	file bin/foo-exe
	otool -L bin/foo-exe

clean:
	@rm -rf $(VENDOR_DIR)
	@rm -rf $(CHICKEN_REPOSITORY)
	@rm -rf foo-exe bin src/*.o

