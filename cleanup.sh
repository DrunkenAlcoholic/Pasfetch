#!/usr/bin/env bash

## compile with fpc + flags
## fpc -O3 -CpCOREAVX2 -OpCOREAVX2 -CfAVX2 -Xs pasfetch.pas

## An update to reduce compiled file size
fpc pasfetch.pas -Px86_64 -Mobjfpc -CX -O3 -XXs -B -v


## Remove object & discriptive files
find . -name "*.o" -type f -delete
find . -name "*.ppu" -type f -delete
