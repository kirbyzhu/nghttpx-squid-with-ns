ETH=$(eval "ifconfig | grep 'eth0'| wc -l")
if [ "$ETH"  ==  '1' ] ; then
	nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1 &
fi
if [ "$ETH"  ==  '0' ] ; then
    nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &
fi

echo -e "$SERVER_CRT" > /config/server.crt
echo -e "$SERVER_KEY" > /config/server.key
squid -s -f /config/squid.conf
nghttpx --conf /config/nghttpx.conf
