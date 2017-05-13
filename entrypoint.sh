echo -e "$SERVER_CRT" > /config/server.crt
echo -e "$SERVER_KEY" > /config/server.key
squid -f /config/squid.conf
nghttpx --conf /config/nghttpx.conf
