# Praktikum Organisasi dan Arsitektur Komputer

Source code for OAK Praktikum 1617 'contest' on http://lx.apps.cs.ipb.ac.id.
Source code's name has been sorted in ascending order starting from "Hello x86".

## Getting Started

These instructions will get you what you need to compile and run the asm source code above. 

### Installing Geany
```
$ sudo add-apt-repository ppa:geany-dev/ppa
$ sudo apt-get update && sudo apt-get install geany
```
### Installing Prerequisites
```
$ sudo apt-get install gcc g++ gcc-multilib
$ sudo apt-get install yasm nasm
```

### Set Build Command (Geany Build Command) :
```
yasm %f -f elf32 -g dwarf2 -l %e.lst && gcc -o %e -m32 %e.o
```
