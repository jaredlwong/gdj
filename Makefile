.PHONY: build install test $(wildcard test/*.ijs)

TESTSCRIPT:=(({&('fail|',:'pass|'))@>@{. , >@{:) (<@(0!:3)@<,<@]) 'FILE' [load 'tsu.ijs'
TESTS:=$(patsubst test/%,test-%,$(wildcard test/*))

build:
	mkdir -p build
	cd build && cmake ..
	cd build && make -j4 jlang
	cd build && make tsdll

install:
	cp build/jlang j/bin
	cp build/libtsdll.so .

test: $(TESTS)

test-%.ijs: test/%.ijs
	@echo "$(subst FILE,$<,$(TESTSCRIPT))" | j/bin/jlang | sed 's/^ \+//'
