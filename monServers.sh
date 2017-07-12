##########################################################
# Script para verificar estado UP/DOWN dos servidores/switchs
# do predio da barbosa lima.
# by epg@cesar.org.br
# 02/08/05
##########################################################

# Para reuso, esse script roda numa maquina Linux.
# verificar os paths dos binarios, modificar paths dos arquivos de 
# log e de entrada. Arquivo de entrada com o nome( se estiverem no hosts da maquina) ou 
# os ips. Tudo bem simples. blz!
# Aeeee .
########################################################################################

#!/bin/bash

path_file_lock=/scripts/scriptPath/
while read Linha
do
#echo "Testando $Linha"
isAlive=`/usr/local/sbin/fping $Linha |cut -d" " -f3`

if [ $isAlive != "alive" ] && [ ! -f /scripts/scriptPath/$Linha.lock ]
then
#echo "$Linha esta DOWN "
/bin/touch /scripts/scriptPath/$Linha.lock
echo " $Linha caiu em `date` " >> /scripts/scriptPath/LOG
#echo "rodou aqui 1" > /scripts/scriptPath/log2
################################################
/bin/mail -s "Atencao: $Linha esta  DOWN" suporte-mot@cesar.org.br <<END 
mensagem de alerta.
$Linha  esta DOWN, favor verificar. 
END
#################################################
fi




if [ $isAlive = "alive" ] && [ -f /scripts/scriptPath/$Linha.lock ]
then 
#echo " $Linha esta UP "
/bin/rm -f  /scripts/scriptPath/$Linha.lock
echo "$Linha subiu em `date`" >> /scripts/scriptPath/LOG
#echo "rodou aqui 2" > /scripts/scriptPath/log2
#################################################
/bin/mail -s "Relaxa! $Linha esta  UP" suporte-mot@cesar.org.br << END
Mensagem de alerta.
$Linha esta UP.
Relaxa ! 
END
#################################################
fi

done < /scripts/scriptPath/ips

#echo "Rodou ..." >> /scripts/scriptPath/runLog
