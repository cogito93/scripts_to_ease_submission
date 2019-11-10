#! /bin/sh

# the number of jobs simultaneously runs: $1
# the number of job to start with: $2

l=$(($1+$2))

for ((i = $2; i < $l; i++))
do
./sub_single.sh $i
done

m=$(($1-1))

while [ $i -le 91 ]
do
n=`condor_q | awk 'NR==5 {print $8}'`
if [ $n -lt $((500*$m)) ]
then
./sub_single.sh $i
((i+=1))
else
sleep 5m
fi
done
