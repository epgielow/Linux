#configurar rede ADHOC
#!/bin/bash
if [ $UID == 0 ]
then
echo " configurando interface para modo ADHOC ..."
ifconfig eth1 up
sleep 3
iwconfig eth1 mode Ad-Hoc
iwconfig eth1 essid xxx
iwconfig eth1 key restricted s:@t1r310p@un0g
sleep 3
ifconfig eth1 172.27.172.1 netmask 255.255.255.0 up
echo  "iniciar roteamento..."
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo " Interface pronta ..."

else
echo " you must be root ..."
echo " run su and script again motherfocker ..."
fi
