#!/bin/bash

#这里我们将开启服务。
#首先请求到达lighttpd， 然后转发本地的node. 
#对于异步的提交请求。 直接在这里进行分流， 直接传递给后台服务器进行处理。 然后进行json数据的返回。。。。

#在bin目录之外执行该脚本
binPath=$(dirname $0)
#echo $binPath
cd $binPath
currentPath=$(pwd)
#echo $currentPath
appPath=$(dirname $currentPath)
#lib目录
libPath=$appPath/lib
#配置文件路径
confPath=$appPath/conf
#日志路径
logPath=$appPath/log
#pid 目录
pidPath=$appPath/status
pidFile=$pidPath/lighttpd.pid
daemon=$currentPath/lighttpd
mkdir -p $logPath
mkdir -p $pidPath

#export lighttpd 执行所需的环境
#这个好像没有什么用。。。
docRoot=/home/vein/graduate/estin/CodeIgniter
phpSocket=/var/run/php5-fpm.sock
export DOC_ROOT=$docRoot
export PHP_SOCKET_PATH=$phpSocket
export LIG_CONF_PATH=$confPath
export LIG_LOG_PATH=$logPath
export LIG_PID_PATH=$pidPath
function help() {
cat <<EOF
Usage: $0 [command]
Available commands are as follow:
	1.start: start lighttpd server
	2.stop: stop lighttpd server
	3.restart: restart lighttpd server
EOF
}

if [ ! -f $confPath/lighttpd.conf ]
then
	echo Sorry, no $confFile exists.
	exit 1
fi

if [ ! -x $currentPath/lighttpd ]
then
	echo Lighttpd is not exists.
	exit 1
fi

if [ ! -d $libPath ]
then
	echo Lib path is not exists.
	exit 1
fi

function start() {
	if [ -f $pidFile ]
	then
		pid=$(cat $pidFile)
		if [ -d /proc/$pid ]
		then
			echo Sorry, the server is running... please stop it ahead.
			exit 1
		else
			rm $pidFile
		fi
	fi
	echo Starting server now.....
	#$appPath/lighttpd -f $confFile -m $libPath  & 
	$currentPath/lighttpd -f $confPath/lighttpd.conf -m $libPath & 
	for((i=1; i<8; i++)) 
	do
		if [ ! -f $pidFile ] 
		then
			echo $i
			sleep 1
		else 
			echo Success! pid=$(cat $pidFile)	
			return 0
		fi
	done
	echo Start timeout.
	return 1	
}

function stop() {
	if [ -f $pidFile ]
	then
		echo Kill server now.......
		#pid=$(cat $pidFile)
		#if echo $pid | egrep -q '[0-9]+$'
		#then
		#	echo $pid
		#	echo Here...
		#	kill $pid
		#else 
		#	rm $pidFile
		#	exit 0
		#fi
		pid=$(cat $pidFile)
		start-stop-daemon --stop --retry 30 --oknodo --quiet --pidfile $pidFile --exec $daemon
		for((i=1; i<8; i++))
		do
			if [ -d /proc/$pid ]
			then
				echo $i
				sleep 1
			else
				echo Kill server success! pid=$pid			
				return 0
			fi
		done
		echo Stop Timeout
		return 1
	else
		echo $pidFile lost, please try command [start], or you can kill the process manually.
		return 1
	fi
}

case $1 in
help) 
	help
	exit 0;;
start) 
	start
	;;
stop) 
	stop
	;;
restart) 
	stop
	start	
	;;
*) 
	echo Invalid [command] $1
	help
	exit 1
	;;
esac
