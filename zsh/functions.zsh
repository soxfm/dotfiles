#

# call sublime
s() {
  if [ $# -eq 0 ]; then
    subl .
  else
    subl "${1:-.}"
  fi
}

# find empty directories and files
findEmptyDirsAndFiles(){
  find . -type f -exec bash -c 'if [ `cat "{}" |wc -w` -eq 0 ]; then echo "file - {}";fi' \; -or -empty -exec bash -c "echo dir - {}" \;
}

# Search aliases/functions
falias() {
    CMD=$(
        (
            (alias)
            (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
        ) | fzf | cut -d '=' -f1
    );

    eval $CMD
}

# Show $PATH
path(){
  echo -e ${PATH//:/\\n}
}

# Lowercase every file in current dir
lowerCaseDirFiles(){
  for i in *; do mv $i ${(L)i}; done
}

# retrieve from cheat.sh. h <cmd>
retch(){
  curl cheat.sh/${@:-cheat}
  # curl cheat.sh/$@
}

# move to trash
trashIT() {
  mv -iv "$@" ~/.Trash
}
