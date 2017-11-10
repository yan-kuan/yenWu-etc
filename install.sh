#!/bin/sh

# Common package
COM=
# For different distributions
DEP=
# Essential for building kernel
KER=

# Common package
COM="vim   build-essential python-pip python3-pip python-dev python3-dev
     astyle colordiff   gnuplot graphviz    imagemagick
     doxygen    apache2-utils   check   gcc-arm-linux-gnueabihf
     g++-arm-linux-gnueabihf    git git-core    qemu-user
     qemu-system-arm    shutter zlib1g-dev  libsdl1.2-dev
     libglib2.0-dev automake    autoconf    libtool libpixman-1-dev
     lib32gcc1  lib32ncurses5   gcc-arm-none-eabi   libnewlib-arm-none-eabi
     libtool    htop    minicom wget    libusb-1.0-0-dev    gdb
     gdb-arm-none-eabi  cloc   pdfshuffler  subversion
     ctags cscope exuberant-ctags libssl-dev tmux texmaker curl"

# For different distributions
if [ `lsb_release -i -s` = "Ubuntu" ];then
    DEP="linux-tools-common linux-tools-generic manpages-posix
        manpages-posix-dev"
elif [ `lsb_release -i -s` = "Debian" ];then
    DEP="linux-tools"
else
    DEP=
fi

# Dependences of build kernel
#   Ref: https://kernelnewbies.org/OutreachyfirstpatchSetup
KER="vim gcc make git libncurses5-dev exuberant-ctags libssl-dev"

# Installation
sudo apt-get update

sudo apt-get install -y ${COM}
sudo apt-get install -y ${DEP}
sudo apt-get install -y ${KER}

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
