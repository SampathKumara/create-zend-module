#!/bin/sh

base_dir=`pwd`
source $base_dir/base_func.sh

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
if [ $# -ne 1 ]
then
  echo "Please Provide a name for Module"
  show_help
elif [ $1 = "-h" ] || [ $1 = '--help' ]
then
  show_help
fi

create_dir $base_dir $1
#mkdir $1
#cd $1
#mkdir config src view
############## Copy and modify Module.php
#cd config
#cp $base_dir/module.config.php .
#sed -i "<Module>" $1 module.config.php
#cd ../src/
#mkdir Controller Form Model
#cp $base_dir/Module.php .
############## Copy and modify module.config.php
#cd ../view
#sed -i "<Module>" $1 Module.php
#dir_name=`echo $1 | tr '[:upper:]' '[:lower:]'`
#echo $dir_name
#mkdir $dir_name
#cd $dir_name
#mkdir index

exit_func
