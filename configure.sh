#!/bin/sh
#KERNEL=linux-3.18.29
#RT=patch-3.18.29-rt30
#KERNEL_SRC=https://www.kernel.org/pub/linux/kernel/v3.x/${KERNEL}.tar.xz
#RT_PATCH_SRC=https://www.kernel.org/pub/linux/kernel/projects/rt/3.18/${RT}.patch.xz

KERNEL=linux-5.13.1
RT=patch-5.13-rt1
KERNEL_SRC=https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/${KERNEL}.tar.xz
RT_PATCH_SRC=https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.13/${RT}.patch.xz

wget ${KERNEL_SRC}
tar -Jxvf ${KERNEL}.tar.xz
mv ${KERNEL} ${KERNEL}-rt
rm ${KERNEL}.tar.xz
cd ${KERNEL}-rt
mkdir patches
cd patches
wget ${RT_PATCH_SRC}
xz -dk ${RT}.patch.xz
touch series
echo "${RT}.patch" > series
cd ..
quilt push -a
#cp /boot/config-$(uname -r) .config
cd ..
cp config-5.13.0-1008-intel ${KERNEL}-rt/.config

echo The kernel ${KERNEL}-rt is now ready to be compiled.
