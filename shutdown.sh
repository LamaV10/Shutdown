# run for the while loop
run=1
# type (shutdown or reboot)
type=shutdown
# same thing as int for if statements (1=shutdown, 0=reboot)
typeNum=1

while [ $run -eq 1 ]; do 
  # clear a the beginning for a cleaner look
  clear

  # displayed in every mode 
  echo "What type of shutdown is desired?"
  echo "Current type: $type"
  echo ""
  echo "Now (1): "
  echo "At a certain time (2): "
  echo "In a given time (3): "

  # things displayed in shutdown mode
  if [ $typeNum -eq 1 ]; then
    echo "Reboot (4): "  
    echo "Cancel shutdown (5): "
  # things displayed in reboot mode
  elif [ $typeNum -eq 0 ]; then
    echo "Go back to shutdown (4)"
    echo "Cancel reboot (5): "
  fi

  # space between printed and user input
  echo ""

  # type of shutdown (now; at a time; in a given time)
  read shutdown

  # shutdown or reboot now 
  if [ $shutdown -eq 1 ]; then
    sudo $type now
    run=0
  # shutdown or reboot at a given time 
  elif [ $shutdown -eq 2 ]; then
    echo "which time?"
    read time
    sudo $type $time
    run=0
  # shutdown or reboot in a given amount of minutes
  elif [ $shutdown -eq 3 ]; then
    echo "minutes till shutdown:"
    read time 
    sudo $type $time
    run=0
  # switches into reboot mode
  elif [ $shutdown -eq 4 ] && [ $typeNum -eq 1 ]; then
    type="shutdown -r"
    typeNum=0
  # goes back to shutdown mode
  elif [ $shutdown -eq 4 ] && [ $typeNum -eq 0 ]; then
    typeNum=1
    type="shutdown"
  # cancels shutdown or reboot
  elif [ $shutdown -eq 5 ]; then
    sudo $type -c
    run=0
  fi

done
