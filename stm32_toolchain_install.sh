#!/bin/sh

DIR=$PWD
mkdir -p ~/stm32_workspace

#STM on Qemu
cd ~/stm32_workspace
git clone https://github.com/beckus/qemu_stm32.git

cd qemu_stm32
git reset --hard b36b2626c361ddeb5b78df37feff42a83bc7da24
git submodule update --init dtc || sudo apt-get install -y libfdt-dev
./configure --disable-werror --enable-debug \
    --target-list="arm-softmmu" \
    --extra-cflags=-DSTM32_UART_NO_BAUD_DELAY \
    --extra-cflags=-DSTM32_UART_ENABLE_OVERRUN \
    --disable-gtk
# Debug version
#
###./configure --disable-werror --enable-debug \
###       --target-list="arm-softmmu" \
###       --extra-cflags=-DDEBUG_CLKTREE \
###       --extra-cflags=-DDEBUG_STM32_RCC \
###       --extra-cflags=-DDEBUG_STM32_UART \
###       --extra-cflags=-DSTM32_UART_NO_BAUD_DELAY \
###       --extra-cflags=-DSTM32_UART_ENABLE_OVERRUN --python=python2
make -j4

echo "" >> ~/.bashrc
echo "#STM32 Qemu" >> ~/.bashrc
echo "PATH=~/stm32_workspace/qemu_stm32/arm-softmmu:$PATH" >> ~/.bashrc

#ST-LINK install
cd ~/stm32_workspace
sudo apt-get install -y automake* libtool libusb-1.0-0-dev
git clone http://github.com/texane/stlink.git
cd stlink
cmake -DCMAKE_INSTALL_PREFIX=/usr .
make -j4
sudo make install -j4
sudo cp etc/udev/rules.d/49-stlinkv2.rules /etc/udev/rules.d/49-stlinkv2.rules

##OpenOCD
cd ~/stm32_workspace
sudo apt-get install -y texi2html texinfo
git clone git://git.code.sf.net/p/openocd/code openocd
cd openocd
./bootstrap
./configure --prefix=/usr --enable-stlink
make -j4
sudo make install -j4

cd $DIR
