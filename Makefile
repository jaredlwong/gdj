.PHONY: build install test

# Loads test script utilities, runs the file w/ 0!:3, and reports whether it
# was successful or not.
TESTSCRIPT:=(({&('fail|',:'pass|'))@>@{. , >@{:) (<@(0!:3)@<,<@]) 'FILE' [load 'tsu.ijs'
TESTS:=$(patsubst test/%,test-%,$(wildcard test/*))

build:
	mkdir -p build
	cd build && cmake ..
	cd build && make -j4 jlang

install:
	cp build/jlang j/bin

test: $(TESTS)

test-%.ijs: test/%.ijs
	@echo "$(subst FILE,$<,$(TESTSCRIPT))" | j/bin/jlang | sed 's/^ \+//'
