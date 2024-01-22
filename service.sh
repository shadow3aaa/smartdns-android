MODDIR=${0%/*}

$MODDIR/smartdns -c /data/smartdns.conf -p -

settings put global private_dns_mode off
iptables -t nat -N smartdns
iptables -t nat -F smartdns
iptables -t nat -A smartdns -p udp --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -A smartdns -p tcp --dport 53 -j DNAT --to-destination 127.0.0.1:53

ip6tables -t filter -D OUTPUT -p tcp --dport 53 -j DROP
ip6tables -t filter -D OUTPUT -p udp --dport 53 -j DROP
ip6tables -t filter -D OUTPUT -p tcp --dport 53 -j REJECT
ip6tables -t filter -D OUTPUT -p udp --dport 53 -j REJECT
ip6tables -t filter -A OUTPUT -p tcp --dport 53 -j REJECT
ip6tables -t filter -A OUTPUT -p udp --dport 53 -j REJECT
