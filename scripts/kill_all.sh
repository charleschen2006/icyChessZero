ps -ef | grep selfplay | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep validate | grep -v grep | awk '{print $2}' | xargs kill -9