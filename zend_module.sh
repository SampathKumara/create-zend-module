#!/bin/sh

#title           :zend_module.sh
#description     :This script will create stucture of zend 3 module.
#author		 :Sampath K Abeysinghe
#date            :28-Feb-2019
#version         :0.1
#usage		 :bash zend_module.sh <Module Name>
#notes           :Cannot execute from directory where scipt is located.
#===================================================================

base_dir=`pwd`
src_dir=`dirname $0`
source "$src_dir/base_func.sh"

function show_help {
	echo -e "Usage:\n zend_module.sh <Module>"
  	exit_func
}

echo " _____                  __   __  ___          __      __    "
echo "/__  /  ___  ____  ____/ /  /  |/  /___  ____/ /_  __/ /__  "
echo "  / /  / _ \/ __ \/ __  /  / /|_/ / __ \/ __  / / / / / _ \ "
echo " / /__/  __/ / / / /_/ /  / /  / / /_/ / /_/ / /_/ / /  __/ "
echo "/____/\___/_/ /_/\__,_/  /_/  /_/\____/\__,_/\__,_/_/\___/  "
echo ""
echo "Created By: Sampath K Abeysinghe"
echo "Created On: 28-Feb-2019"
echo "Copyright © 2019"
echo ""
echo "Creates Zend 3 Module Structure and creates Controller, Config Files"
echo "------------------------------------------------------------"
echo ""
echo ""

if [ $src_dir = '.' ]; then
	show_error "Cannot execute from the directory where script is located"
elif [ $src_dir = '..' ]; then
	src_dir=`readlink -f $src_dir`
fi

if [ $# -ne 1 ]; then
	echo "Please Provide a name for Module"
	show_help
elif [ $1 = "-h" ] || [ $1 = '--help' ]; then
	show_help
fi

create_dir $base_dir $1
cd $1
create_dir `pwd` config src view
############## Copy and modify Module.php
cd "$base_dir/$1/config"
copy_file "$src_dir/module.config.php"
sed -i "<Module>" $1 module.config.php
cd ../src/
create_dir . Controller Form Model
############## Copy and modify module.config.php
#cp $base_dir/Module.php .
#cd ../view
#sed -i "<Module>" $1 Module.php
#dir_name=`echo $1 | tr '[:upper:]' '[:lower:]'`
#echo $dir_name
#mkdir $dir_name
#cd $dir_name
#mkdir index

exit_func
