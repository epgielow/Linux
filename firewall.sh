
# Limpa regras da tabela nat
#iptables -t nat -F
iptables -t filter -F



echo "0" > /proc/sys/net/ipv4/ip_forward

# Nega tudo por padrao
#iptables -t filter -P FORWARD DROP
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# SSH
#iptables -A INPUT -p tcp -s 0/0 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 200.165.138.194 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 22 -j ACCEPT

# Apache
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -s 136.182.0.0/16 --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -s 129.188.0.0/16 --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -s 200.148.204.0/26 --dport 443 -j ACCEPT



# E-mail CESAR Vot/BL
iptables -A INPUT -p tcp -s 200.165.138.194 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 200.165.138.194 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 200.165.138.194 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 200.165.138.194 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 200.165.138.194 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 200.165.138.194 --dport 465 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 465 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 466 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 994 -j ACCEPT
iptables -A INPUT -p tcp -s 200.199.110.105 --dport 996 -j ACCEPT
iptables -A INPUT -p udp -s 200.199.110.105 --dport 996 -j ACCEPT


# E-mail UFSC
#iptables -A INPUT -p tcp -s 150.162.60.5 --dport 110 -j ACCEPT
#iptables -A INPUT -p tcp -s 150.162.60.5 --dport 995 -j ACCEPT
#iptables -A INPUT -p tcp -s 150.162.60.5 --dport 25 -j ACCEPT
#iptables -A INPUT -p tcp -s 150.162.60.5 --dport 993 -j ACCEPT
#iptables -A INPUT -p tcp -s 150.162.60.5 --dport 143 -j ACCEPT
#iptables -A INPUT -p tcp -s 150.162.60.5 --dport 465 -j ACCEPT

iptables -A INPUT -m iprange --src-range 150.162.66.129-150.162.66.157 -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -m iprange --src-range 150.162.66.129-150.162.66.157 -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -m iprange --src-range 150.162.66.129-150.162.66.157 -p tcp --dport 995 -j ACCEPT
iptables -A INPUT -m iprange --src-range 150.162.66.129-150.162.66.157 -p tcp --dport  25 -j ACCEPT
iptables -A INPUT -m iprange --src-range 150.162.66.129-150.162.66.157 -p tcp --dport 993 -j ACCEPT
iptables -A INPUT -m iprange --src-range 150.162.66.129-150.162.66.157 -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -m iprange --src-range 150.162.66.129-150.162.66.157 -p tcp --dport 465 -j ACCEPT


# E-mail Libertville USA
iptables -A INPUT -p tcp -s 208.54.94.97 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.94.97 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.94.97 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.94.97 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.94.97 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.94.97 --dport 465 -j ACCEPT


# t-mobile

iptables -A INPUT -p tcp -s 208.54.14.33 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.14.33 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.14.33 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.14.33 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.14.33 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 208.54.14.33 --dport 465 -j ACCEPT




# E-mail  USA CINGULAR operadora USA
iptables -A INPUT -p tcp -s 150.161.2.199 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 150.161.2.199 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 150.161.2.199 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 150.161.2.199 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 150.161.2.199 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 150.161.2.199 --dport 465 -j ACCEPT



# E-mail Claro
iptables -A INPUT -p tcp -s 200.255.121.21 --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 465 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 466 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 994 -j ACCEPT
iptables -A INPUT -p tcp -s 200.169.112.0/20 --dport 996 -j ACCEPT

# E-mail OI
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 465 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 466 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 994 -j ACCEPT
iptables -A INPUT -p tcp -s 200.222.42.128/25 --dport 996 -j ACCEPT

# E-mail TIM
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 110 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 995 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 993 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 143 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 465 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 466 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 994 -j ACCEPT
iptables -A INPUT -p tcp -s 200.179.66.128/26 --dport 996 -j ACCEPT



# Nega o resto e loga no /etc/log/messages
iptables -t filter -A INPUT -j LOG --log-prefix "DROP "
iptables -t filter -A INPUT -j DROP

# loopback
iptables -I INPUT 1 -s 127.0.0.1/32 -d 127.0.0.1/32 -j ACCEPT
iptables -I OUTPUT 1 -s 127.0.0.1/32 -d 127.0.0.1/32 -j ACCEPT
