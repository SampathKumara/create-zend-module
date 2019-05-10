#title           :base_func.sh
#description     :This script contains helper functions.
#author		 :Sampath K Abeysinghe
#date            :25-Apr-2019
#version         :0.1
#usage		 :
#notes           :Not executable
#===================================================================

function exit_func {
  	echo "Exitting...[0m"
	if [ $# -eq 1 ] && [ $1 -eq 1 ]; then
		exit $1
	fi
	exit 0
}

function show_error {
	echo "[36;40m"
	echo $1
	exit_func 1
}

function show_message {
	echo "[33;40m"
	echo $1
	echo  "[0m"
}

function create_dir {
	cd $1
  	if [ $# -lt 2 ]; then
		show_error "Plese provide the base directory and at-lest one new directory name"
	elif [ -d  $2 ]; then
		show_error "Directoroy $2 already exists in the distination path $1"
	fi
	count=0
	for dir in $@
	do
		count=$((count+1))
		[ $count -eq 1 ] && continue			
		mkdir $dir
		show_message "Directory $dir created in `pwd`"
	done
}

function copy_file {
	dst_dir='.'
	if [ $# -eq 0 ] || [ $# -gt 2 ]; then
		show_error "Invalid number of arguments"	
	elif [ $# -eq 2 ]; then
		dst_dir=$2
		if [ $2 = '.' ] || [ $2 = '..' ]; then
			dst_dir=`readlink -f $dst_dir`
			echo $dst_dir
		fi
	elif [ ! -f $1 ]; then
		show_error "Source file does not exists"
	fi
	cp $1 $dst_dir
	show_message "File $1 copied to $dst_dir"
}

function uc_first {
	text=`echo $1 | tr '[:upper:]' '[:lower:]'`
	echo $(tr '[:lower:]' '[:upper:]' <<< ${text:0:1})${text:1}
}

function replace_text {
        if [ $# -ne 3 ]; then
                show_error "Old text, New text and file should be provided"
        fi
        sed -i "s/$1/$2/g" $3
        show_message "File $3 updated by replacing $1 -> $2"
}

