#!/bin/bash
# by epg@cesar.org.br
#script para monitorar mudanca de firewall clusterxl
# rodar na crontab.

source /etc/profile

Initial_State=`/opt/CPsuite-R60/fw1/bin/cphaprob state |/bin/grep active  |/bin/awk '{print $1}'`
Temp_State=`/bin/cat /home/admin/scripts/finalState.log`



if [ $Initial_State != $Temp_State ]
then 
/opt/CPsuite-R60/fw1/bin/sendmail -t 172.27.240.120 -f firewall-bl@cesar.org.br ccadm@cesar.org.br << END
Subject: Cluster Alert
From: firewall-bl@cesar.org.br
Date: `/sbin/clock |/bin/awk '{print $1", "$3" "$2" "$5" "$4" -0300"}'`

Atencao: Mudanca de Firewall automatica...

`/opt/CPsuite-R60/fw1/bin/cphaprob state`

END
fi

#Atualiza a variavel de estado para proxima comparacao com o estado atual.
Final_State=`/opt/CPsuite-R60/fw1/bin/cphaprob state |/bin/grep active  |/bin/awk '{print $1}'` 

Valor1=1
Valor2=2

if [ $Final_State != $Valor1 ]
then
/bin/cp -f /home/admin/scripts/Valor2 /home/admin/scripts/finalState.log 
else
/bin/cp -f /home/admin/scripts/Valor1 /home/admin/scripts/finalState.log
fi

