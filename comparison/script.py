import re

while True:
  yn = input("Rockt Sysad die Hütte? ")

  if (re.match(r'^[jJ].*', yn)):
    print("Du sagst es! :-)")
    break
  elif (re.match(r'^[nN].*', yn)):
    print("Quatsch, glaub ich nicht...")
  else:
    print("Wie jetzt, ja oder nein?")

  print()
