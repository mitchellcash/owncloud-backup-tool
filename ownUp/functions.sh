function check_installation {
  # This function will check whether the given application exists on the
  # host system and abort if no installation can be found.
  hash $1 &> /dev/null
  if [ $? -eq 1 ]
  then
      echo >&2 "Error: Could not find an installation for $1. Please see README for installation instructions."
      exit 1
  fi
}
