#/bin/bash

#sudo chown lone-pine game_log.*


#./chroot_and_build.sh &&
./linux.sh && \
  #export LD_PRELOAD="./libOpenGL.so.0" && \
  gdb -q -ex=run --args newcity

