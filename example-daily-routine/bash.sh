#!/bin/bash

# print greeting
time=$(date +"%H")
afternoon=15
if [ $time -gt $afternoon ]
 then
    echo "Good Afternoon/Evening $USER"
else 
    echo "Good Morning $USER"
fi   

# print date information
date=$(date "+%A the %m.%d.%Y - %H:%M")
echo "It's $date"

# print weather information 
URL='http://api.openweathermap.org/data/2.5/weather?q=Zurich&appid=a98b12db9d2e7a5bf4c42f264289e7f3&units=metric'

declare -a icons=( ["Clouds"]="☁️ " ["Thunderstorm"]="⚡ " ["Drizzle"]="⛆ " ["Rain"]="☔ " ["Snow"]="❄️ ️" ["Mist"]="🌫️ " ["Fog"]="🌫️ ️" ["Clear"]="☀️ " )

data=$(curl -s $URL)

degrees=$(echo $data | jq '.main.temp')
weather=$(echo $data | jq -r '.weather[0].main')
description=$(echo $data | jq -r '.weather[0].description')

weatherIcon=${icons[$weather]}
echo "Todays weather is $description $weatherIcon with a temperature of ${degrees}°C"

# launch programms
if [ $time -le $afternoon ]
  then 
    chrome-cli open "" > /dev/null 2>&1
else 
    chrome-cli open "https://netflix.com" > /dev/null 2>&1
    chrome-cli open "https://youtube.com" > /dev/null 2>&1
fi
