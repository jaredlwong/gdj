Goddamn J
=========
This project is a cleaned up version of the open source J compiler provided by
the original creators Ken Iverson and Roger Hui.

J is a great language for problem solving, but it lacks developer support. This
project is a reimagined view of the J compiler; the basis from which the J
environment is built. Hopefully, by bringing it into the 21st century, I can
keep the spirit of J alive.

The name was inspired by a the naming of the god particle.

Building
--------

	make build
	make install

`make build` builds a binary called `gdj` in the directory `build`. And `make
install` moves `gdj` to the minimal j environment provided in `jenv`.

Testing
-------

	make test -j4

`make test` tests all of the unit tests found in `test/unit`.

