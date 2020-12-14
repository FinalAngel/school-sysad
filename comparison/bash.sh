#!/bin/sh
while [[ true ]]; do
  read -p "Rockt Sysad die Hütte? " yn

  case $yn in
    [jJ]* )
      echo "Du sagst es! :-)";
      break;;
    [nN]* )
      echo "Quatsch, glaub ich nicht...";
      ;;
    * )
      echo "Wie jetzt, ja oder nein?";;
  esac
done
