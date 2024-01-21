MODDIR=${0%/*}

$MODDIR/smartdns -c /data/smartdns.conf -p -

settings put global private_dns_mode off
iptables -t nat -D OUTPUT -p tcp --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -D OUTPUT -p udp --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 127.0.0.1:53
