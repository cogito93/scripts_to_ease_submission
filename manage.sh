#! /bin/sh

read -p "Press (r/t) to run/terminate jobs respectively: " r_or_t
if [[ $r_or_t == "r" ]]
then
read -p "Number of batch jobs you want to run simultaneously: " nb_of_jobs
read -p "Tower number you want to start with: " start_nb
echo Run\(s\) $nb_of_jobs job\(s\), starting with tower number $start_nb
nohup ./sub_multiple.sh $nb_of_jobs $start_nb 2> /dev/null &
elif [[ $r_or_t == "t" ]]
then
echo Terminating jobs ...
pid=`ps -ef | grep 'sub_multiple.sh' | awk 'NR==1 {print $2}'`
kill ${pid}
rm nohup.out
condor_rm {userID}
else
echo Answer again
read -p "Press (r/t) to run/terminate jobs respectively: " r_or_t
fi
