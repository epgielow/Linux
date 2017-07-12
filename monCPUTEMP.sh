####################################################################
# Script para monitorar a temperatura do servidor FURACAO v880
#by epg@cesar.org.br 09/08/05
####################################################################
# Para reuso, soh verificar o numero de processadores na v880,
# e adicionar ou retirar, nesse exemplo temos 6 CPUs.
# logica bem simples, sem mais. Erik.
# VErificar o path do prtdiag, pois no solaris 8 e diferente do 9.
###################################################################


#! /bin/bash

# pega a temperatura!

TEMPCPU0=`/usr/bin/prtdiag -v |grep CPU0 |grep -v FAN |awk '{ print""$2""}'`
TEMPCPU1=`/usr/bin/prtdiag -v |grep CPU1 |grep -v FAN |awk '{ print""$2""}'`
TEMPCPU2=`/usr/bin/prtdiag -v |grep CPU2 |grep -v FAN |awk '{ print""$2""}'`
TEMPCPU3=`/usr/bin/prtdiag -v |grep CPU3 |grep -v FAN |awk '{ print""$2""}'`
TEMPCPU4=`/usr/bin/prtdiag -v |grep CPU4 |grep -v FAN |awk '{ print""$2""}'`
TEMPCPU5=`/usr/bin/prtdiag -v |grep CPU5 |grep -v FAN |awk '{ print""$2""}'`


# Variavel para setar a temperatura de WARNING
HOT=73
##echo $TEMPCPU1
#echo $TEMPCPU2
#echo $TEMPCPU0
#echo $TEMPCPU3
#echo $TEMPCPU4
#echo $TEMPCPU5
#echo $HOT


if [ "$TEMPCPU0" -gt "$HOT" ] || [ "$TEMPCPU1" -gt "$HOT" ] || [ "$TEMPCPU2" -gt "$HOT" ] || [ "$TEMPCPU3" -gt "$HOT" ] || [ "$TEMPCPU4" -gt "$HOT" ] || [ "$TEMPCPU5" -gt "$HOT" ]
then
echo "subject: ATENCAO:TUFAO CPU0 $TEMPCPU0 graus CPU1 $TEMPCPU1 graus CPU2 $TEMPCPU2 graus CPU3 $TEMPCPU3 graus CPU4 $TEMPCPU4 graus CPU5 $TEMPCPU5 graus" | /usr/lib/sendmail -f ccadm@cesar.org.br ccadm@cesar.org.br
fi
