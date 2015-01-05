#!/bin/bash
arg=$1
str=${1:2}
echo $str
exit
if [ "$1" == "-h" ] || [ "$1" == "--help" ];then
	cat << EOF
Usage:	$0 [options] [paths]
Options are:
	--suffix <suffix>    Filename suffix, default is ".min.js"
EOF
	exit
fi

DIR=$(dirname $0)
DIR=$(dirname $DIR)
echo $DIR
OPTNAME=""
FILES=""

for ARG in $*
do
	if [ $OPTNAME ];then
		#export opt_$OPTNAME=$ARG
		OPTNAME=""
	elif [[ $ARG = --* ]]; then
		OPTNAME=${ARG:3}
		echo $OPTNAME
	else
		FILES="$FILES $ARG"
	fi
	#echo $ARG
	#echo $FILES
done

NODE=node
#${NODE} -v >>/dev/null 2>>/dev/null || NODE=$DIR/node

#$NODE $DIR/uglify.js $FILES
