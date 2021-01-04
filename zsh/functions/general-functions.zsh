# Download videos using youtube-dl into iCloud Drive
ydd() {
  if [ $# -eq 0 ]; then
	echo "No arguments supplied"
	return 1
  fi
  cd icloud ; pwd
  youtube-dl $1
}

# sym all files within current dir

lnfiles() {
  if [ $# -eq 0 ]; then
    echo "No target directory specified"
    return 1
  fi

  if [ ! -d "$1" ] ; then 
    echo "Creating $1"
    mkdir "$1" ; 
  fi

  for file in *; do 
      ln -sv "$(pwd)/$file" "$1/$file"
  done
}

# Removes empty dirs
rmempty() {
  find . -depth  -type d  -empty -exec rmdir {} \;
}
