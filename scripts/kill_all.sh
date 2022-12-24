ps -aux | grep selfplay | grep -v grep | cut -c 12-18 | xargs kill -s 9
ps -aux | grep validate | grep -v grep | cut -c 12-18 | xargs kill -s 9