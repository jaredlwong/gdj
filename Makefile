.PHONY: build install test

CWD:=$(shell pwd)
# Loads test script utilities, runs the file w/ 0!:3, and reports whether it
# was successful or not.
TESTSCRIPT:=(({&('fail|',:'pass|'))@>@{. , >@{:) (<@(0!:3)@<,<@]) 'FILE'
TESTSCRIPT+=[testpath=:'$(CWD)/test/unit/'
TESTSCRIPT+=[load '$(CWD)/test/tsu.ijs'

TESTS:=$(patsubst test/unit/%,test-%,$(wildcard test/unit/*))

build:
	mkdir -p build
	cd build && cmake ..
	cd build && make -j4 jlang
	cd build && make tsdll

install:
	cp build/jlang j/bin
	cp build/libtsdll.so test

test: $(TESTS)

test-%.ijs: test/unit/%.ijs
	@echo "$(subst FILE,$<,$(TESTSCRIPT))" | j/bin/jlang | sed 's/^ \+//'
