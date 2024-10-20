# run for while loop
run=1
# type (shutdown or reboot)
type=shutdown
# same thing as int for if statements
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
    echo "Cancel shutdown (5): "
  
  elif [ $typeNum -eq 0 ]; then
    echo "Go back to shutdown (4)"
    echo "Cancel reboot (5): "
  fi

  echo ""

  # type of shutdown (now; at a time; in a given time)
  read shutdown

  # shutdown or reboot now 
  if [ $shutdown -eq 1 ]; then
    sudo $type now
    run=0
  fi

  # shutdown or reboot at a given time 
  if [ $shutdown -eq 2 ]; then
    echo "which time?"
    read time
    sudo $type $time
    run=0
  fi

  # shutdown or reboot in a given amount of minutes
  if [ $shutdown -eq 3 ]; then
    echo "minutes till shutdown:"
    read time 
    sudo $type $time
    run=0
  fi


  # switches into reboot mode
  if [ $shutdown -eq 4 ] && [ $typeNum -eq 1 ]; then
    type="shutdown -r"
    typeNum=0
  fi
  
  # goes back to shutdown mode
  if [ $shutdown -eq 4 ] && [ $typeNum -eq 0 ]; then
    typeNum=0
  fi
  
  # cancels shutdown or reboot
  if [ $shutdown -eq 5 ]; then
    sudo $type -c
    run=0
  fi
 

done
