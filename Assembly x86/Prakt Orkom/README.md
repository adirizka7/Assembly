# Praktikum Organisasi dan Arsitektur Komputer

Installation :
$ sudo add-apt-repository ppa:geany-dev/ppa
$ sudo apt-get update && sudo apt-get install geany
$ sudo apt-get install gcc g++ gcc-multilib
$ sudo apt-get install yasm nasm

Set Build Command :
yasm %f -f elf32 -g dwarf2 -l %e.lst && gcc -o %e -m32 %e.o