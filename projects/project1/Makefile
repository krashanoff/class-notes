CC=gcc
CFLAGS=-Wall -Wextra -std=c11 -O3

default: http-get

http-get: main.o
	$(CC) $(CFLAGS) -o $@ $^

debug: main.d.o
	$(CC) $(CFLAGS) -O0 -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

%.d.o: %.c
	$(CC) $(CFLAGS) -O0 -g -c -o $@ $^

.PHONY: bundle clean
bundle: main.c README Makefile
	tar -czf http-get.tar.gz $^

clean:
	rm -rf *.o *.tar.gz http-get debug
