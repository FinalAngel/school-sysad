#!/bin/bash
time=$(date +"%H")
date=$(date '+%A the +%m.%d.%Y - %H:%M"')
afternoon=15
URL='http://api.openweathermap.org/data/2.5/weather?q=Zurich&appid=a98b12db9d2e7a5bf4c42f264289e7f3&units=metric'

#Check if morning or evening
if [ $time -gt $afternoon ]
 then
    echo "Good Afternoon/Evening $USER"
else 
    echo "Good Morning $USER"
fi   

#Output the current weather 
declare -A icons=( ["Clouds"]="☁️ " ["Thunderstorm"]="⚡ " ["Drizzle"]="⛆ " ["Rain"]="☔ " ["Snow"]="❄️ ️" ["Mist"]="🌫️ " ["Fog"]="🌫️ ️" ["Clear"]="☀️ " )

data=$(curl -s $URL)

degrees=$(echo $data | jq '.main.temp')
weather=$(echo $data | jq -r '.weather[0].main')
description=$(echo $data | jq -r '.weather[0].description')

weatherIcon=${icons[$weather]}
echo "Todays weather is $description $weatherIcon with a temperature of $degrees°C"

#launch wanted programms
if [ $time -le $afternoon ]
  then 
    firefox
    thunderbird
else 
    firefox https://netflix.com https://youtube.com
fi


