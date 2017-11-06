#!/bin/sh

echo Hello

sudo apt-get update

sudo apt-get install -y\
	vim	build-essential	linux-tools-common linux-tools-generic \
	astyle	colordiff	gnuplot	graphviz	imagemagick\
	doxygen	apache2-utils 	check	gcc-arm-linux-gnueabihf \
	g++-arm-linux-gnueabihf	git	git-core	qemu-user\
	qemu-system-arm		shutter	zlib1g-dev libsdl1.2-dev \
	libglib2.0-dev 	automake 	autoconf libtool libpixman-1-dev\
	lib32gcc1 	lib32ncurses5	gcc-arm-none-eabi libnewlib-arm-none-eabi\
	libtool		htop	minicom	wget	libusb-1.0-0-dev gdb gdb-arm-none-eabi\
	cloc    minicon manpages-posix  manpages-posix-dev  pdfshuffler \
    ctags cscope exuberant-ctags libssl-dev tmux texmaker

# Denpendace Package of Compiling Linux Kernel
## Reference: https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=350806
sudo apt-get install -y\
	 fakeroot build-essential ncurses-dev xz-utils kernel-package\

# Install Repo
mkdir ~/bin
echo ""
echo "#Repo tool"
echo "PATH=~/bin:$PATH"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
sudo chmod a+x ~/bin/repo
