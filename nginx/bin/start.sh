#!/bin/bash
#这个是nginx的启动脚本， 
oldPath=$(pwd)
binPath=$(dirname $0)
cd $binPath
path=$(pwd)
appPath=$(dirname $path)
confPath=$appPath/conf
confFile=$confPath/nginx.conf
logPath=$appPath/log
pidPath=$appPath/status
sbinPath=$appPath/sbin
daemon=$sbinPath/nginx
mkdir -p $confPath
mkdir -p $logPath
#mkdir -p $pidPath
pidFile=$(awk -F '[\t;]+ ' '/[^#]pid/ {print $2}' $confFile)
echo $pidFile
if [ -z $pidFile ];then
	pidFile=$pidPath/nginx.pid
fi

if [ ! -f $confFile ];then
	echo Conf File does not exists.
fi

test -f $confFile || exit 1
[ -f $confFile ] || exit 1

function help() {
	cat <<EOF
	Usage: $0 [command]
	Available Command are as follow:
	start: start the server normally.
	stop: stop the server normally.
	restart: restart the server normally.
EOF
}
echo $confFile
retVal=0
function start() {
	#start-stop-daemon --start --quiet --pidfile $pidFile --exec $daemon -- -c $confFile > /dev/null || return 1
	$daemon -c $confFile > /dev/null || return 1
	retVal=$?
	if [ $retVal -eq 0 ];then
		echo OK
	else 
		echo Failed
	fi
	return $retVal
} 
function stop() {
	echo Stop Server....
	start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $pidFile --name nginx
	retVal="$?"
	sleep 1
	if [ $retVal -eq 0 ];then
		echo Success.
	else
		echo Fail.
	fi
	return $retVal
}

#主流程控制语句。
case $1 in 
start)
	start
	;;
stop)
	stop
	;;
restart) 
	stop
	sleep 2
	start
	;;
*)
	if [ -z $1 ];then
		echo Please input command
	else
		echo Invalid command [$1]
	fi
	help
	exit 1
	;;
esac
