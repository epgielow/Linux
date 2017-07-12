################################################
# By epgielow@gmail.com
# 01/04/05
# modificado 13/05/05 v. SUSE9.0
# modificado 21/08/2006 - refeito  v. SUSE 9.2
# modificado 23/09/2006 - merge v. Ubuntu 6.06
# modificado 25/04/2007 - merge v. Ubuntu 7.04
#  add script monitor de rede.
################################################
# Modificacoes Historico:
# 13/05/2005 V-0.1-alpha
# 21/08/2006 V-0.3-alpha
# 23/10/2006 V-0.4-gama
################################################
if [ "$1" == "" ]
then
clear
echo "############################################"
echo "# Digite H para ver o Help com as opcoes...#"
echo "############################################"
echo
else

HOME2=/home/epg
ROOT_ID=0
PIRATA=$HOME2/backup/incoming
LOG_FW=/var/log/messages
MMC_CARD=sdc1
MMC_PWD=/mnt/mmc
CX_BIN=$HOME2/cxoffice/bin
CX_PROG=.cxoffice/win2000/drive_c/Program\ Files
CX_OFFICE=$CX_PROG/Microsoft\ Office/OFFICE11
CX_DVD=$CX_PROG/DVD\ Shrink
                
case "$1" in
        FWL) echo FIREWALL SCRIPT ...
        		echo L para ver o log.
        		if [ "$UID" -gt "$ROOT_ID" ]
        		then 
        		echo Voce precisa ser root para rodar esse comando ...
        		echo Depois execute novamente o script ./mdScript.sh FW
        		su
        		else
        		$HOME2/FW/iptablesFW.sh
        		case "$2" in
        			L) echo Habilitando LOG Firewall !!
        				tail -f $LOG_FW
        			;;
        		esac
        		fi
         ;;
             
        G)  echo Executando GAIM IM ...
        		gaim&
                ;;
	
	FWB) echo Firewall Builder Granizo ...
			
				BASE_DIR="$HOME/fwbuilder"
				MOUNTG="/home/epg"
				KEYS="D614C44A 245450A2 6AA64EB4";

				#	    TRATAMENTO DE ERROS	  	  #

				if [ ! -e $BASE_DIR ]; then
  				echo "$0: $BASE_DIR not exist.";
  				exit 1;
				fi
				#--------
				case $2 in
						M) echo montando share samba em tsunami ...
							if [ "$UID" -eq "$ROOT_ID" ] 
        		 			then 
        		 	 		echo Eu sou ROOT ... montando...
        		 	 		smbmount //tsunami/fbuild $MOUNTG/fwbuilder -o username=epg,uid=epg
        		 	 		else
        		 	 		echo Preciso de Root ...
        		 	 		
        		 	 		sudo smbmount //tsunami/fbuild /home/epg/fwbuilder -o username=epg,uid=epg
        		 	 		fi
        		 	 		;;
        		 	 
        		 	 	
        		 	   D) echo Desmontando share em tsunami
							if [ "$UID" -eq "$ROOT_ID" ]
							then
							echo I am ROOT ... Desmontando ...        		 	   	
        		 	   	smbumount $MOUNTG/fwbuilder
        		 	   	else
        		 	   	echo preciso de ROOT ...
        		 	   	su
        		 	   	fi
        		 	   ;;
        		   esac				
				
				#--------
				FILE_NAME="$BASE_DIR/granizo.fwb.gpg";

				if [ ! -e $FILE_NAME ]; then
  				echo "$0: $BASE_DIR not mounted";
  				exit 1;
				fi

				# 	    ALGUNS BINARIOS	         #

				FWBUILD="/usr/local/bin/fwbuilder21";
				#########################################
				#	INICIO DA GAMBIARRA :)		#
				#########################################
				cd $BASE_DIR;
				if [ -e fw.lock ]; then
  				echo "O usuário `cat fw.lock` esta utilizando o fwbuilder neste momento"; 
				else
  				echo `whoami` > fw.lock;
 
  				gpg  -o $FILE_NAME.tmp -d $FILE_NAME;
  				#if [ $? -eq 0 ]; then
    			MOD=`ls --full-time $FILE_NAME.tmp | awk '{print $6$7}'| cut -d. -f1`;
    			$FWBUILD $FILE_NAME.tmp;
    			for i in $KEYS; do
      		OPTION="-r $i $OPTION ";
    			done
    			MOD1=`ls --full-time $FILE_NAME.tmp | awk '{print $6$7}'| cut -d. -f1`;
    			if [ "$MOD" != "$MOD1" ]; then
      	#	rm $FILE_NAME
      		gpg -o $FILE_NAME $OPTION -e $FILE_NAME.tmp;
  	   		rm $FILE_NAME.tmp   
    			fi
  				#fi
  				rm fw.lock $FILE_NAME.tmp iptables.regras;
				fi
	
				;;
	kf) echo  matando firefox ...
		sudo ps -ef |grep firefox |awk  '{print $2}'|xargs kill -9
		;;
        S)	echo Executando SKYPE ...
        		skype&
                ;;
		  M)  echo Executando XMAME EMULATOR ...
		  		xmame.x11 -scale 2 -ef 2 $HOME2/roms/romsMame/$2
					 ;;
		  roms)	echo Listando ROMS ...
		  		ls $HOME2/roms/romsMame/
		  			;;
		  X)  echo Abrir aterm colorido ...
		  		aterm -tr -sh 50 -fg $2
		 		  	;;
		  NS) echo checando portas abertas ...
		  		netstat -na |grep LISTEN
		  			;;
		  CHECK) echo Verificando status do sistema ...
		  			echo ""
		  			echo "#######################################################################################"
		  			free
		  			echo "---------------------------------------------------------------------------------------"
		  			uptime
		  			echo "---------------------------------------------------------------------------------------"
		  			df -k
		  			echo "---------------------------------------------------------------------------------------"
		  			who
		  			echo "#######################################################################################"
		  			;;					  	
		  CX) echo CrossOffice ...
		  		
		  			case "$2" in
		  				W) echo Iniciando Word ...
		  					$CX_BIN/wine $CX_OFFICE/WINWORD.EXE &
		  					;;
		  				E) echo Iniciando Excel ...
		  				   $CX_BIN/wine $CX_OFFICE/EXCEL.EXE &
		  				   ;;
		  				P) echo Iniciando PowerPoint ...
		  					$CX_BIN/wine $CX_OFFICE/POWERPNT.EXE &
		  					;;
		  			esac					
		  			;;
		  DVD) echo DVD SHRINK RIPPER ...
		  		 $CX_BIN/wine $CX_DVD/DVD Shrink 3.2.exe &
		  		   ;;
		  SYN) echo synergy server ...
			/usr/bin/synergys -f --config /home/epg/synergy.conf > /dev/null 2>&1
					;;
		  MMC) echo Realizar operacoes no Cartao MMC :
		       echo para montar digite M
		  		 echo para desmontar digite D
		  		 MMC_DEV=`fdisk -l |grep sdc1 | cut -d" " -f1 |cut -d"/" -f3`
		  		 if [ "$UID" -eq "$ROOT_ID" ] && [ "$MMC_CARD" == "$MMC_DEV" ]
        		 then 
        		 	 echo MMC STATUS OK !!!
        		 	 case $2 in
        		 	 	M) echo Montando mmc em $MMC_PWD ... 
        		 	 	mount /dev/$MMC_CARD $MMC_PWD
        		 	   ;;
        		 	   D) echo Desmontando mmc em $MMC_PWD
        		 	   umount $MMC_PWD
        		 	   ;;
        		    esac	    
		  		 else
		  		 	 echo "#############################################"
		  		 	 echo "# Precisa de root ou o MMC nao esta plugado!#"
		  		 	 echo "#############################################"
		  		 	 
		  		 	
		  		 fi
		  			
		  			;;
		  #### MERGE erikScript ##############################################
   1)  echo Firewall 
		ssh 172.27.0.1 -lepg -i /home/epg/.ssh/epg-dsa
	 ;;
	2) banner TS 1000
		ssh ts -lepg  -i /home/epg/.ssh/epg-dsa
	 ;;
	3)  echo TORNADO
		ssh tornado -lepg
		;;
	5) echo VENTANIA
		ssh ventania -lepg
		;;
	6) echo TUFAO
		ssh tufao -lepg
		;;
	7) echo Furacao
		ssh furacao -lepg
		;;
	8)  echo Toroh
		ssh toroh -lepg
		;;
	9)  echo Gielow
		ssh gielow.homelinux.org -lmasterdomme -p2269 -i  .keys/id_dsa
		;;
	10) echo srv backup - Ciclone
		ssh ciclone -lepg -X
		;;
	11) echo Enchente
		ssh enchente -lroot
		;;
	12) echo Tempestade
		ssh tempestade -lepg -1 -i .ssh/epg-rsa1
		;;
	13) echo Tsunami
		ssh tsunami -lepg -i /home/epg/.ssh/epg-dsa
		;;
	14) echo Jitui
		ssh jitui -lroot
		;;
	15) echo Caribe -dns Srv
		ssh caribe -lepg
		;;
	16) echo Jamuri
		ssh jamuri -lroot
		;;
	17) echo Jurubeba
		ssh jurubeba -lroot
		;;
	18) echo FW Granizo
		ssh granizo -lepg -i .ssh/epg-dsa
		;;
	19) echo  PROXY 
		ssh 172.27.13.2 -lepg -i .ssh/epg-dsa
		;;
	FW) echo " Iniciando FW CheckPoint..." 
		cd  /home/epg/.wine/drive_c/Program\ Files/SmartConsole/R60/PROGRAM/ ;
		wine FwPolicy.exe &
		;;
	T) clear

echo "#################################### Testando a rede ####################################"
#by thum.

while read linha
 do
  HOST=`echo $linha | cut -d";" -f1`
  COMENTARIO=`echo $linha | cut -d";" -f2`
  LOCALIZACAO=`echo $linha | cut -d";" -f3`

  
  ping -c 1 $HOST >/dev/null

  if [ "$?" -eq 0 ]
   then
    echo -e "$HOST ($COMENTARIO - $LOCALIZACAO) \033[1m  OK \033[0m"
   else
    echo -e "\033[4m$HOST ($COMENTARIO - $LOCALIZACAO)\033[0m \033[5m\033[1mMORTO\033[0m"
  fi

 done<hosts_testa_rede.txt

echo "################################### Fim dos testes #####################################"

;;
		  
		  #####################################################################					 
		  			
		  H)  clear
		  		echo "########################################"
		  		echo "#             HELP MENU                #"
		  		echo "# by: Erik Gielow epgielow@gmail.com   #"
		  		echo "# Versao: 0.3 21/08/2006               #"
		  		echo "########################################"
		  		echo  ""
		  		echo  "Digite:"
		  		echo "----------------------------------------------------------------"
		  		echo   FW - Para startar o Firewall.
		  		echo "----------------------------------------------------------------"
		  		echo	 FW L -Startar o FW e ver o log.
		  		echo "----------------------------------------------------------------"
		  		echo   G - Para startar o gaim.
		  		echo "----------------------------------------------------------------"
		  		echo	 S - Para startar o skype.
		  		echo "----------------------------------------------------------------"
		  		echo   M - Para jogar o emulador Mame.
		  		echo "----------------------------------------------------------------"
		  	   echo 	 roms - Listar as ROMS do Mame.
		  	   echo "----------------------------------------------------------------"
			   echo 	SYN - para startar o server do synergy.
			    echo "----------------------------------------------------------------"
		  	   echo   NS - Executa um netstat.
		  	   echo "----------------------------------------------------------------"
		  	   echo   CHECK - Executa um rapido check no sitema.
		  	   echo "----------------------------------------------------------------"
		  	   echo   DVD - Iniciar o DVD Shrink ripper.
		  	   echo "----------------------------------------------------------------"
		  	   echo   CX - Iniciar CrossOffice.
		  	   echo			W - Word, E - Excel, P - Powerpoint.
		  	   echo "----------------------------------------------------------------"
		  	   echo 	 MMC - Operacoes no Cartao MMC
		  	   echo   		 M - para montar D - para desmontar !
		  	   echo "----------------------------------------------------------------"
				echo "1 - Logar no Firewall"
				echo "----------------------------------------------------------------"		
	   		echo "2 - Logar no servidor de console TS1000"
	   		echo "----------------------------------------------------------------"
	   		echo "3 - Logar em Tornado"
	   		echo "----------------------------------------------------------------" 
	   		echo "4 - Logar em Chuvisco"
	   		echo "----------------------------------------------------------------" 
	   		echo "5 - Logar em Ventania"
	   		echo "----------------------------------------------------------------"
	   		echo "6 - Logar em Tufao"
	   		echo "----------------------------------------------------------------"
	   		echo "7 - Logar em Furacao"
	   		echo "----------------------------------------------------------------"
	   		echo "8 - Logar em Toroh"
	   		echo "----------------------------------------------------------------"
			   echo "9 - Logar em gielow.homelinux"
			   echo "----------------------------------------------------------------"
			   echo "10- Logar em Ciclone - Backup Server"
			   echo "----------------------------------------------------------------"			   
	   		echo "11- Logar em Enchente - Share builds"
	   		echo "----------------------------------------------------------------"
			   echo "12- Logar em Tempestade - shupping server"
			   echo "----------------------------------------------------------------"
	   		echo "13- Logar em Tsunami"
	   		echo "----------------------------------------------------------------"
			   echo "14- Logar em Jitui"
			   echo "----------------------------------------------------------------"
			   echo "15- Logar em CAribe - DNS server"
			   echo "----------------------------------------------------------------"
	   		echo "16- Logar em Jamuri"
	   		echo "----------------------------------------------------------------"
	   		echo "17- Logar em Jurubeba"
	   		echo "----------------------------------------------------------------"
			   echo "18- Logar no FW Granizo"
				echo "----------------------------------------------------------------"			   
			echo " T - executar teste de rede"
			 echo "----------------------------------------------------------------"
	     	   echo   H - This Menu :D 
		  	   echo "----------------------------------------------------------------"
		  			;;
		  		*)  clear 
		  		echo "#######################################" 
		  		echo "# Parametro $1 $2 Inexistente!!       #"
		  		echo "# Digite H para ver o Menu de opcoes! #"
		  		echo "#######################################"
		  			;;	 			
esac

fi
