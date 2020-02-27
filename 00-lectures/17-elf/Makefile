CC = gcc
CFLAGS = -g -Wall -Werror -std=gnu11

all : 01-static 02-main libsum-32.so 03-main libsum-32-pic.so 04-main libsum-64-pic.so

# статическая компоновка: и main, и func, и A, B, C находятся сразу в одном исполняемом файле
01-static : main.c sum-32.S
	gcc -m32 $(CFLAGS) $^ -o$@

# файл 02-main будет требовать для выполнения динамической библиотеки libsum-32
02-main : main.c libsum-32.so
	gcc -m32 $(CFLAGS) main.c -o02-main -L. -Wl,--rpath,. -lsum-32

# динамическая библиотека (но в ней неперемещаемый код - см. sum-32.S)
libsum-32.so : sum-32.S
	gcc -m32 -shared $(CFLAGS) sum-32.S -o$@ -nostdlib

# файл 03-main будет требовать для выполнения динамической библиотеки libsum-32-pic
03-main : main.c libsum-32-pic.so
	gcc -m32 $(CFLAGS) main.c -o03-main -L. -Wl,--rpath,. -lsum-32-pic

# динамическая библиотека с перемещаемым кодом
libsum-32-pic.so : sum-32-pic.S
	gcc -m32 -shared $(CFLAGS) sum-32-pic.S -o$@ -nostdlib

# пример для x86_64
04-main : main.c libsum-64-pic.so
	gcc $(CFLAGS) main.c -o04-main -L. -Wl,--rpath,. -lsum-64-pic

libsum-64-pic.so : sum-64-pic.S
	gcc -shared $(CFLAGS) sum-64-pic.S -o$@ -nostdlib

clean :
	-rm -f 01-static 02-main libsum-32.so 03-main libsum-32-pic.so 04-main libsum-64-pic.so
