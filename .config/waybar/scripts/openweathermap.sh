#!/bin/bash

# --- CONFIGURATION ---
API_KEY="dbc5b741d5dc25883db6da84fa2fd5b2" # Paste your key here  ## https://home.openweathermap.org/api_keys
LAT="33.518589"  # Replace with your Latitude
LON="-86.810356" # Replace with your Longitude
UNITS="imperial" # Use "metric" for Celsius, "imperial" for Fahrenheit
# ---------------------

# Validate configuration
if [ -z "$LAT" ] || [ -z "$LON" ] || [ -z "$UNITS" ] || [ -z "$API_KEY" ]; then
    echo "Config missing"
    exit 1
fi

# Fetch the weather data
RESPONSE=$(curl -s "api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${API_KEY}&units=${UNITS}")

# Check if curl failed to get a response
if [ -z "$RESPONSE" ]; then
    echo "No connection"
    exit 1
fi

# 1. Get the Temperature
# We use jq's built-in 'round' function to avoid ugly decimals (e.g., 71.6°F becomes 72°F)
TEMP=$(echo "$RESPONSE" | jq '.main.temp | round')

# 2. Get the Description (for the tooltip)
DESC=$(echo "$RESPONSE" | jq -r '.weather[0].description')

# 3. Get the Icon Code and map it to an emoji
ICON_CODE=$(echo "$RESPONSE" | jq -r '.weather[0].icon')

case $ICON_CODE in
    "01d") ICON="☀️";;  # Clear sky day
    "01n") ICON="🌙";;  # Clear sky night
    "02d") ICON="⛅";;  # Few clouds day
    "02n") ICON="☁️";;  # Few clouds night
    "03d"|"03n") ICON="☁️";; # Scattered clouds
    "04d"|"04n") ICON="☁️";; # Broken clouds
    "09d"|"09n") ICON="🌧️";; # Shower rain
    "10d") ICON="🌦️";; # Rain day
    "10n") ICON="🌧️";; # Rain night
    "11d"|"11n") ICON="⛈️";; # Thunderstorm
    "13d"|"13n") ICON="❄️";; # Snow
    "50d"|"50n") ICON="🌫️";; # Mist
    *) ICON="❓";;      # Default
esac

# Determine unit label
if [ "$UNITS" = "metric" ]; then
    LABEL="°C"
else
    LABEL="°F"
fi

# Final JSON output for Waybar
echo "{\"text\": \"${ICON} ${TEMP}${LABEL}\", \"tooltip\": \"${DESC}\"}"
