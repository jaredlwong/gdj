cmake:
	mkdir -p build
	cd build && cmake ../src && make -j4 j && make -j4 jconsole
