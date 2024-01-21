chmod +x $MODPATH/smartdns

if [ ! -f /data/smartdns.conf ]; then
    mv $MODPATH/smartdns.conf /data/smartdns.conf
fi
