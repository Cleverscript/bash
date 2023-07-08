#!/bin/bash

set -x

# TODO: 
# curl: (60) SSL: no alternative certificate subject name matches target host name 'ipvigilante.com'
# More details here: https://curl.haxx.se/docs/sslcerts.html

# curl failed to verify the legitimacy of the server and therefore could not
# establish a secure connection to it. To learn more about this situation and
# how to fix it, please visit the web page mentioned above.


curl -v -k https://ipvigilante.com/$(curl -s https://ipinfo.io/ip)

exit

city=$(curl -s https://ipvigilante.com/$(curl -s https://ipinfo.io/ip) | jq '.data.city_name')
if [ -z $city ]; then
    echo "..."
else
    curl -s "wttr.in/${city}?format=%t"
fi