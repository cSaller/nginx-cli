#!/bin/ash

mkdir -p /run/nginx/
rm -rf /run/nginx/nginx.pid

if [ ${#} -eq 0 ]; then

  sed \
    -e "s^:DESTINATION_URL:^$DESTINATION_URL^g" \
    /code/nginx.conf.templ > /etc/nginx/http.d/default.conf

  echo "Starting nginx..."
  exec nginx -g 'daemon off;'
else
  exec "${@}"
fi
