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
	if [ `basename $PWD` != 'module' ]; then
		show_error "Parent Directory Should be 'module'"
	fi
	src_dir=`readlink -f $src_dir`
fi

if [ $# -ne 1 ]; then
	echo "Please Provide a name for Module"
	show_help
elif [ $1 = "-h" ] || [ $1 = '--help' ]; then
	show_help
fi

module_name=`uc_first $1`
directory_name=`echo $1 | tr '[:upper:]' '[:lower:]'`
create_dir $base_dir $module_name
cd $module_name
create_dir `pwd` config src view/$directory_name/$directory_name
############## Copy and modify Module.php
cd "$base_dir/$module_name/config"
copy_file "$src_dir/module.config.php"
replace_text "Mod-name" $module_name module.config.php
cd ../src/
create_dir . Controller Form Model
############## Copy and modify Module.php
copy_file $src_dir/Module.php .
replace_text "Mod-name" $module_name Module.php

exit_func
