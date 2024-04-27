---
layout: post
title: C++ Makefile.
categories: 
    - programming
---


source code (sample.c) -> 
preprocessor converts to -> expanded source code (sample.i)
assembler converts to -> assembly code (sample.s)
compiler -> object file (sample.o) [MACHINE DEPENDABLE CODE]
linker -> links object code with libraries to produce a.out file.

preprocessor -> expands the #include & #if def. to convert to expanded source code.

sample.cpp 
    can be converted 
        1. (a.out) binary executable 
        2. (.so) shared object/library (.so) (requires passing of -shared flag)
        3. (.o) object code (requires passing of -c)
        4. (.a) static libary (ar rcs) (One or more .o files (object files inside a )) 

Structure
    libs - dynamic libraries.
    bins - binaries.

Make - a tool
    process' the makefile and executes intructions inside it.

Makefile - 
    automates the build process.
    needs a target

makefile defines a target clean which is not actually present. Hence this is called a phony target.

Makefile may have multiple target.
make file's default target is it first defined target.
Use .DEFAULT_GOAL to override it.

> makefile
```
all: make_dir create_files

make_dir:
        mkdir -p d1 d2 d3

create_files:
        touch f1.c f2.c f3.c

clear:
        -rm *.c
        rm -rf d*
```

