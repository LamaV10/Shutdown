echo "Which type of shutdown do you want?"
echo "Now (1): "
echo "At a certain time (2): "
echo "In a given time (3): "
echo "Cancel shutdown (4): "

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

if [ $shutdown -eq 4 ]; then
  sudo shutdown -c
fi
