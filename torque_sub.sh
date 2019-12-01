#! /bin/sh

for i in {1..500}
do
    qsub -q large -o path/to/log -e path/to/log -F "$i" torque_exe.sh
    echo job $i submitted
done
