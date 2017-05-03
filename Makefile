# Cooking Grilled Chicken

OUTPUT := foo-exe
BASEDIR := $(shell pwd)
SRC_DIR := $(BASEDIR)/src
UNAME_S := $(shell uname -s)

CHICKEN_REPOSITORY:= $(BASEDIR)/eggs
VENDOR_DIR:= $(BASEDIR)/vendor
DEPS := anaphora clojurian continuations format nrepl mini-kanren

run: all
	bin/$(OUTPUT)

all: clean grilling
	@echo "All Done Grilling!!!!"

grilling:
	csc -static -deploy src/*.scm -optimize-level 3 -output-file $(OUTPUT)
	#csc -R $(DEPS) -static -deploy src/*.scm -optimize-level 3 -output-file $(OUTPUT)
	#csc -deploy src/*.scm -optimize-level 3 -output-file $(OUTPUT)
	#chicken-install -deploy -p $(BASEDIR)/$(OUTPUT) $(DEPS)
	mv $(OUTPUT) bin

emacs:
	chicken-install -s apropos chicken-doc
	@cd `csi -p '(chicken-home)'`; curl http://3e8.org/pub/chicken-doc/chicken-doc-repo.tgz | sudo tar zx

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

