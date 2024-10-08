run=1
type=shutdown
typeNum=1

while [ $run -eq 1 ]; do 
  clear

  echo "Which type of shutdown do you want?"
  echo ""
  echo "Now (1): "
  echo "At a certain time (2): "
  echo "In a given time (3): "

  if [ $typeNum -eq 1 ]; then
    echo "Reboot (4): "
  fi
  
  if [ $typeNum -eq 1 ]; then
    echo "Cancel shutdown (5): "
  
  elif [ $typeNum -eq 0 ]; then
    echo "Cancel shutdown (4): "
  fi
  echo ""

  read shutdown

  if [ $shutdown -eq 1 ]; then
    sudo $type now
    run=0
  fi

  if [ $shutdown -eq 2 ]; then
    echo "which time?"
    read time
    sudo $type $time
    run=0
  fi

  if [ $shutdown -eq 3 ]; then
    echo "minutes till shutdown:"
    read time 
    sudo $type $time
    run=0
  fi

  if [ $shutdown -eq 4 ] && [ $typeNum -eq 1 ]; then
    type="shutdown -r"
    typeNum=0
  fi

  if [ $shutdown -eq 5 ]; then
    sudo $type -c
    run=0
  fi

done
