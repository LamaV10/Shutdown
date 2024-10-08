echo "which type of shutdown do you want?"
echo "Now (1)"
echo "At a certain time (2)"
echo "In a given time (3)"

read shutdown

if [ $shutdown -eq 1 ]; then
  sudo shutdown now
fi

if [ $shutdown -eq 2 ]; then
  echo "which time?"
  read time
  sudo shutdown $time
fi

if [ $shutdown -eq 3 ]; then
  echo "minutes till shutdown:"
  read time 
  sudo shutdown $time
fi
