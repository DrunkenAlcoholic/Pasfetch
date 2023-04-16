# Pasfetch

A simple fetch program writen in pascal, a work in progress but initial upload to github.


## Screenshot
### Arch Linux
![alt text](https://github.com/DrunkenAlcoholic/Pasfetch/blob/main/img/Screenshot%20from%202023-04-16%2001-25-00.png "Arch")

### Fedora
![alt text](https://github.com/DrunkenAlcoholic/Pasfetch/blob/main/img/Screenshot%20from%202023-04-16%2001-50-58.png "Fedora")


## Installation
install a nerd font for the icons.

You can compile Pasfetch with the free an open source "Free Pascal Compiler" just search your distro's packages for "fpc" and install, then to compile you do the following


### Compile
use fpc to compile with these optimized options for x86_64, see cleanup.sh for more details on flag options
```bash
$ fpc -Px86_64 -CpCOREAVX2 -CfAVX2 -OpCOREAVX2 -O3 -Mobjfpc -CX -B -XXs -v pasfetch.pas
```

or run the included bash script to compile and cleanup
```bash
$ ./build.sh
```
if you get an error on "ld" not found, install "binutils" package for your distribution

### Install
 Copy the compiled binary to your path folder e.g /$HOME/bin 
 
 then make it executable
 ```bash
 $ chmod +x pasfetch
 ```


## Usage
Either call the program by using pasfetch in a shell or add to your .bashrc 

```bash
$ pasfetch
```


