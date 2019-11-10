#! /bin/sh

# counts the total number of rows
ROWS=`awk 'END{print NR}' calibtheta.txt`

# tower number
i=$1
j=$(($i+1))

if [ $j -le ${ROWS} ]
then
# read 3rd field in the i th row of calibtheta.txt
theta[j]=`awk 'NR=='$j'{print $3}' calibtheta.txt`

sed -i "7s/\-.*/\-${theta[j]}/" run_ele.mac
sed -i "3s/=.*/= $i/" condor_sub.sub

# make directory for i th job
mkdir -p $i/log
mkdir $i/output

# submit
condor_submit condor_sub.sub
fi
