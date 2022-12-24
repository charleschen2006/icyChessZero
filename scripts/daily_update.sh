cd /home/charles/icyChessZero/scripts

# if 5,000 gameplays has been generated
count=`ls ../data/distributed | wc -l`
echo ${count}
if [ $count -le 10000 ];then
    echo 'less than 10000 exiting'
    exit
fi 

sh kill_all.sh
#sleep 10s
#sh multithread_start.sh -p /usr/local/bin/python3  -g 1 -t 20 -n no
sleep 10s

echo 'executing model_update...'
python model_update.py -g 0 > update_log.txt
sleep 10s

sh kill_all.sh
sleep 10s

echo 'executing model_upweight...'
python upweight.py > uplog.tt
sleep 10s

echo 'executing validate...'
date

sh validate.sh -p python -g 0 -t 14 > validate_log.txt #&
#sh validate.sh -p /usr/local/bin/python3 -g 1 -t 20 > validate_log.txt 
sleep 10s
#/usr/local/bin/python3 check_ifup.py > uplog.tt

sh kill_all.sh
#sleep 10s
#sh multithread_start.sh -p /usr/local/bin/python3  -g 1 -t 20 -n no
sleep 10s
sh multithread_start.sh -p python -g 0 -t 14
