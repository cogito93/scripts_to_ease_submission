#! /bin/sh

# the number of batch jobs simultaneously runs: $1
# the number of batch job to start with: $2

l=$(($1+$2))

for ((i = $2; i < $l; i++))
do
./sub_single.sh $i
done

m=$(($1-1))

while [ $i -le 91 ]
do
n=`condor_q | grep 'condor_ex' | awk '{print $8}'`
if [ $n -lt $((500*$m+10)) ]
then
./sub_single.sh $i
((i+=1))
sleep 10s
else
sleep 1m
fi
done
