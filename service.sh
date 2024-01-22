MODDIR=${0%/*}

killall smartdns
sleep 1s
$MODDIR/smartdns -c /data/smartdns.conf -p -

settings put global private_dns_mode off
iptables -t nat -D OUTPUT -p tcp --dport 53 -j DNAT --to-destination 127.0.0.1:53 || true
iptables -t nat -D OUTPUT -p udp --dport 53 -j DNAT --to-destination 127.0.0.1:53 || true
iptables -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 127.0.0.1:53

ip6tables -t filter -D OUTPUT -p tcp --dport 53 -j DROP
ip6tables -t filter -D OUTPUT -p udp --dport 53 -j DROP
ip6tables -t filter -D OUTPUT -p tcp --dport 53 -j REJECT
ip6tables -t filter -D OUTPUT -p udp --dport 53 -j REJECT
ip6tables -t filter -A OUTPUT -p tcp --dport 53 -j REJECT
ip6tables -t filter -A OUTPUT -p udp --dport 53 -j REJECT
