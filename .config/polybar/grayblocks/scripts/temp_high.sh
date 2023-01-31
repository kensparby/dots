
#!/usr/bin/env sh

NEXT="$(curl -A 'snaek' \
           -s 'https://api.met.no/weatherapi/locationforecast/2.0/complete?altitude=120&lat=60.1127&lon=11.4752')"

HIGH=$(echo $NEXT | jq '.properties.timeseries[0].data.next_6_hours.details.air_temperature_max')

echo "$HIGH"
