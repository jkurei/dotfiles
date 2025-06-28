set -x
time dd if=/dev/random bs=1024k of=tstfile count=1024
dd if=tstfile bs=1024k of=/dev/null count=1024
