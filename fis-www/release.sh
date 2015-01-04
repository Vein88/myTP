#!/bin/bash #这个脚本专门用于编译并且发布每个模块。
modules="common blog backend"
#find absolute path of the root dir..
relative_path=$(dirname $0)
cd $relative_path
root_path=$(pwd)
#echo $root_path
#进入到每个模块进行编译操作。
for i in $modules
do
	cd $root_path/$i
	#echo $root_path/$i
	fisp release -d local -D
done
echo Compile Success...
#声明发布目录。
home=/home/vein/myTP_related
static=$home/static
config=$home/config
template=$home/views/template

#检测文件夹是否存在。
test -d $static || mkdir -p $static
test -z $static || rm -rf $static/*
test -d $config || mkdir -p $config
test -z $config || rm -rf $config/*
test -d $template || mkdir -p $template
test -z $template || rm -rf $template/*

cd $root_path/release
mv static/* $static
mv configs/* $config 
mv template/* $template

echo Deploy Success...
rm -rf $root_path/release
echo Delete release success...
