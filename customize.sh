chmod +x $MODPATH/smartdns

if [ ! -f /data/smartdns.conf ]; then
	mv $MODPATH/smartdns.conf /data/smartdns.conf
fi

ui_print "smartdns配置文件: /data/smartdns.conf"
