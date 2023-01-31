#!/bin/sh
KERNEL=linux-5.13.1
RT=patch-5.13-rt1
cd ${KERNEL}-rt
export CONCURRENCY_LEVEL=4
make clean
sudo time make -j8 deb-pkg
cd ..
