#!/bin/bash

#Praggnya Kanungo
#ufx9hn

#this is the command we were already given in the lab doc
curl -s "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40,-90,45,-85" > aviation.json

#Here is am going to parsing the receipt times
receiptTimesHere=$(jq '.[] | .receiptTime' aviation.json | head -6)
echo "$receiptTimesHere"

#Here I am parsing the temperatures and calculating average temperature
temperatures=$(jq '.[] | .temp' aviation.json)
averageTemperatureHere=$(echo "$temperatures" | awk '{sum+=$1; count++} END {print sum/count}')
echo "Average Temperature: $averageTemperatureHere"

#heres the cloudiness
totalHere=$(echo "$temperatures" | wc -l)
clearCountHere=$(jq '.[] | select(.clouds[].cover=="CLR") | .temp' aviation.json | wc -l)
mostly_cloudy=false
if [ "$((totalHere - clearCountHere))" -gt "$((totalHere / 2))" ]; then
    mostly_cloudy=true
fi
echo "Mostly Cloudy: $mostly_cloudy"

