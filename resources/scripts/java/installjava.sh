
#!/bin/bash
#colors
w='\033[1;0m'
g='\033[1;32m'                      
r='\033[1;31m'
rt='\033[0m'

error() {
	printf "${r}[!] ${w}${1}${r}\n"
}
prints() {
	printf "${g}[*] ${w}${1}\n${rt}"
}

prints "Installing latest java to termux. \n"
sleep 2
if [ -e $PREFIX/bin/java ]
then
prints "Java is already installed!"
sleep 2
	echo
	exit
else
	case `dpkg --print-architecture` in
	aarch64)
		archname="aarch64" ;;
	arm64)
		archname="aarch64" ;;
	armhf)
		archname="arm" ;;
	armv7l)
		archname="arm" ;;
	arm)
		archname="arm" ;;
	*)
		error "ERROR: Unknown architecture."; echo; exit ;;
	esac
	prints "Downloading JDK-8 (~70Mb) for ${archname}..."
	wget https://archive.org/download/openjdk-9-jre-headless_9.2017.8.20-1_arm/jdk8_${archname}.tar.gz &> /dev/null;
	prints "Moving JDK to system..."
	mv jdk8_${archname}.tar.gz $PREFIX/share
	prints "Extracting JDK..."
	cd $PREFIX/share
	tar -xhf jdk8_${archname}.tar.gz
	prints "Moving Java wrapper scripts to bin..."
	mv bin/* $PREFIX/bin
	prints "Cleaning up temporary files..."
	sleep 2
	rm -rf installjava
	rm -rf $PREFIX/share/jdk8_${archname}.tar.gz
	rm -rf $PREFIX/share/bin
	echo
	prints "Java was successfully installed!"
	sleep 2
	echo
 fi
