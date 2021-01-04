from datetime import datetime
import getpass
import requests
import subprocess

# print greeting
DATE_TIME_NOW = datetime.now()
USER_NAME = getpass.getuser();

if int(DATE_TIME_NOW.strftime("%H")) < 15 :  
    print('Good morning {}'.format(USER_NAME))
else:
    print('Good evening {}'.format(USER_NAME))

# print date information
print('It\'s {}'.format(DATE_TIME_NOW.strftime('%A the %d.%m.%Y - %H:%M')))

# print weather information
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

r = requests.get(BASE_API_URL, params = {'appid': API_TOKEN, 'q': LOCATION, 'units': UNTIS})
data = r.json()
print('Todays weather is {} {}  with a temperature of {}°C'.format(data['weather'][0]['description'], WEATHER_ICONS.get(data['weather'][0]['main'], ''), data['main']['temp']))

# launch programms
if int(DATE_TIME_NOW.strftime("%H")) < 15 :  
    subprocess.call('chrome-cli open ""', shell=True, stdout=subprocess.DEVNULL)
else:
    subprocess.call('chrome-cli open "https://netflix.com"', shell=True, stdout=subprocess.DEVNULL)
    subprocess.call('chrome-cli open "https://youtube.com"', shell=True, stdout=subprocess.DEVNULL)