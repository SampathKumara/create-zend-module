function exit_func {
  	echo "Exitting...[0m"
	if [ $# -eq 1 ] && [ $1 -eq 1 ]
	then
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

function create_dir(){
  cd $1
  if [ -d  $2 ]
  then
    show_error "Directoroy $2 already exists in the distination path $1"
  fi
  mkdir $2
  show_message "Directory $2 created in $1"
}
