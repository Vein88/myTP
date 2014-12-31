#!/bin/bash

function help()
{
	cat << EOF
Usage:	bash $0 [command] [app]
Available commands are:
	start		Starts an app normally.
	stop		Stops an app normally.
	reload		Reload children.
	restart		Restarts an app normally.
	force-stop	Kill an app.
	force-restart	Kill and restart an app.
	test		Run test suits.
	test-cov	Run test suit and export coverage.
EOF
}

if [ "$1" = "help" ];then
	help
	exit 0
fi


oldPath=$(pwd)
dir=$(dirname $0)
cd $dir
dir=$(pwd)
export EXEC_PATH=$dir
export NODE_PATH=$dir/node_modules

cd $oldPath
App='app.js'
if [ ! -f $App ];then
	echo $App is not present.
	exit 1
fi

logDir=log
mkdir -p $logDir
pidFile=.pid

function start() 
{
	if [ -f $pidFile ];then
		if [ -d /proc/`cat $pidFile` ];then
			echo [$App] Error: Server already started.
			exit 1
		fi
		rm $pidFile
	fi
	NODE=./bin/node
	$NODE -v >>/dev/null 2>>/dev/null || NODE=node
	echo Starting server....
	#$NODE $App >>$logDir/stdout.log 2>>$logDir/stderr.log &
	$NODE $App &
	nodePid=$!
	for((i=1; i<8; i++))
	do
		if [ -d /proc/$nodePid ]
		then
			echo Server started! PID=$nodePid
			echo $nodePid >$pidFile	
			return 0
		else 
			echo $i
			sleep 1
		fi
	done
	echo Start Time Out~~~
	return 1
}

function stop () {
	if [ -f $pidFile ]
	then
		nodePid=$(cat $pidFile)
		echo Stop server, pid=$nodePid
		kill -HUP $nodePid
		for ((i=1; i<8;  i++));do
			if [ -d /proc/$nodePid ];then
				echo $i
				sleep 1
			else 
				echo Killed node, pid:$nodePid
				rm -rf $pidFile
				return 0
			fi
		done
		echo "Kill Time Out~~~"
		return 1
	else
		echo $pidFile not found! Please run [start] command.
		return 0
	fi
}

case $1 in 
start)
	start;;
stop) 
	stop;;
restart) 
	stop
	sleep
	start
	;;
*)
	help
	;;
esac
