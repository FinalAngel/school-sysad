# -*- coding: utf-8 -*-
from datetime import datetime
import getpass
import requests
import subprocess

DATE_TIME_NOW = datetime.now()
BASE_API_URL = 'http://api.openweathermap.org/data/2.5/weather'
API_TOKEN = 'a98b12db9d2e7a5bf4c42f264289e7f3'
LOCATION = 'zurich'
UNTIS = 'metric'
WEATHER_ICONS = {
    'Clouds': '☁️',
    'Thunderstorm': '⚡',
    'Drizzle': '⛆',
    'Rain': '☔',
    'Snow': '❄️',
    'Mist': '🌫️',
    'Fog': '🌫️',
    'Clear': '☀️',
}

# print greeting
if int(DATE_TIME_NOW.strftime("%H")) < 15 :  
    print('Good morning {}'.format(getpass.getuser()))
else:
    print('Good evening {}'.format(getpass.getuser()))

# print date information
print('It\'s {}'.format(datetime.now().strftime('%A the %d.%m.%Y - %H:%M')))

# print weather information
payload = {'appid': API_TOKEN, 'q': LOCATION, 'units': UNTIS}
r = requests.get(BASE_API_URL, params = payload)
data = r.json()
print('Todays weather is {}{} with a temperature of {}°C'.format(data['weather'][0]['description'], WEATHER_ICONS.get(data['weather'][0]['main'], ''), data['main']['temp']))

# launch programms
if int(DATE_TIME_NOW.strftime("%H")) < 15 :  
    subprocess.call('firefox', shell=True)
    subprocess.call('thunderbird', shell=True)
else:
    subprocess.call('firefox https://netflix.com https://youtube.com', shell=True)