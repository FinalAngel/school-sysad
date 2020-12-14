#!/bin/sh
while [[ true ]]; do
  read -p "Rockt Sysad die Hütte? " yn

  if [[ $yn == [jJ]* ]]; then
    echo "Du sagst es! :-)";
    break;
  elif [[ $yn == [nN]* ]]; then
    echo "Quatsch, glaub ich nicht...";
  else
    echo "Wie jetzt, ja oder nein?";
  fi

  echo "";

done
