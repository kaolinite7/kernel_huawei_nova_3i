#!/bin/bash
set -e

which python2.7 1>/dev/null
which gcc-9 1>/dev/null

cd $(dirname ${0})

curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -s v0.9.5

binaries=(cpp-9 gcc-9 gcc-ar-9 gcc-nm-9 gcc-ranlib-9 gcov-9 gcov-dump-9 gcov-tool-9 x86_64-linux-gnu-cpp-9 x86_64-linux-gnu-gcc-9 x86_64-linux-gnu-gcc-ar-9 x86_64-linux-gnu-gcc-nm-9 x86_64-linux-gnu-gcc-ranlib-9 x86_64-linux-gnu-gcov-9 x86_64-linux-gnu-gcov-dump-9 x86_64-linux-gnu-gcov-tool-9)
for i in ${binaries[@]};do
	ln -sf $( which $i ) aarch64-linux-android-4.9/bin/${i/-9/}
done

ln -sf $(which python2.7) aarch64-linux-android-4.9/bin/python

export ARCH=arm64 PATH="$(pwd)/aarch64-linux-android-4.9/bin:$PATH" CROSS_COMPILE=aarch64-linux-android-

make ARCH=arm64 O=out merge_kirin710_defconfig
make ARCH=arm64 O=out -j$(nproc)

cp out/arch/arm64/boot/Image.gz tools
cd tools
sed -i 's/--kernel kernel/--kernel Image.gz/' pack_kernerimage_cmd.sh
./pack_kernerimage_cmd.sh
mv kernel.img ..
