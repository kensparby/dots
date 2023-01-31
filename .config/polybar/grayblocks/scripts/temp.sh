#!/usr/bin/env sh

NOW="$(curl -A 'snaek' \
           -s 'https://api.met.no/weatherapi/nowcast/2.0/complete?altitude=120&lat=60.1127&lon=11.4752')"

# NEXT="$(curl -A 'snaek' \
#            -s 'https://api.met.no/weatherapi/locationforecast/2.0/complete?altitude=120&lat=60.1127&lon=11.4752')"

NOW=$(echo $NOW | jq '.properties.timeseries[0].data.instant.details.air_temperature')
# LOW=$(echo $NEXT | jq '.properties.timeseries[0].data.next_6_hours.details.air_temperature_min')
# HIGH=$(echo $NEXT | jq '.properties.timeseries[0].data.next_6_hours.details.air_temperature_max')

# WEATHER=$(echo $NEXT | jq '.properties.timeseries[0].data.next_6_hours.summary.symbol_code')
# WEATHER="sun"

# case $WEATHER in
#     "sun") ICON= ;;
#     "lightcloud") ICON=🌤 ;;
#     "partlycloudy") ICON=🌤 ;;
#     "cloudy") ICON=☁ ;;
#     "rainshowers") ICON=🌦 ;;
#     "rainshowersandthunder") ICON=
# esac

echo "$NOW C°"
