#! /bin/bash

#######################################
# REGRAS FW
# by
# epgielow@gmail.com
#######################################


# Disable forwarding
echo 0 > /proc/sys/net/ipv4/ip_forward

################################################
#FLUSH nas tabelas
################################################
iptables -t nat -F POSTROUTING
iptables -t nat -F PREROUTING
iptables -t nat -F OUTPUT
iptables -F
################################################
#DROPA TUDO POR DEFAULT
iptables -P INPUT DROP
iptables -P FORWARD DROP
################################################
# FW pode tudo
iptables -P OUTPUT ACCEPT
################################################
#Cria novas Chains
#################################################
iptables -X 
iptables -N DROPSSH
iptables -N ACCEPTSSH
################################################

echo " Inicializado Firewall ... "


#############################################################################
# LOGS especificos das chains
#############################################################################

iptables -A DROPSSH -j LOG --log-prefix " DROP_SSH:" --log-level 5
iptables -A DROPSSH -j DROP

############################################################################
# REGRAS DE ACESSO AO FW
############################################################################

#Libera ssh
iptables -A INPUT -p tcp -s 200.x.x.x(external ip)  --dport 2269 -j ACCEPT

#Drop no ping
iptables -A INPUT -s 0/0 -p icmp --icmp-type echo-request -j DROP
#iptables -A INPUT -i dsl0 -tcp --dport 80 -j ACCEPT


######################################################################
# Regras para rotear LAN para internet
#####################################################################

iptables -A FORWARD -i eth0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i dsl0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o dsl0 -j MASQUERADE

#iptables -t nat -A PREROUTING -i dsl0 -p tcp --dport 80 -j DNAT --to 192.168.0.59:80
#iptables -A FORWARD -d 192.168.0.59 -p tcp --dport 80 -j ACCEPT


###########################################################
# Regras para permitir tudo atraves da interface loopbak
# E manter as conexoes saidas da maquina localhost(FW).
###########################################################

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#############################################################
# Regra Default:
# Dropa tudo que tiver entrando no FW.
#############################################################
iptables -A INPUT -j DROP
iptables -A INPUT -j LOG --log-prefix "DROP:" --log-level 5
#############################################################
#enable forwarding
echo 1 >/proc/sys/net/ipv4/ip_forward

