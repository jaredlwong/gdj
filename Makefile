.PHONY: build install test

build:
	mkdir -p build
	cd build && cmake ..
	cd build && make -j4 jlang
	cd build && make tsdll

install:
	cp build/jlang j/bin
	cp build/libtsdll.so .

test:
	j/bin/jlang < test-runner.ijs
