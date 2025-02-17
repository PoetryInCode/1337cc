1337CC=./1337cc.pl

all: build

./primes.c: ./pr1m35.c1337
	$(1337CC) <$< >$@

./main.c: ./m41n.c1337
	$(1337CC) <$< >$@

./primes: ./primes.c
./main: ./main.c

build: ./main ./primes
