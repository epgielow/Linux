#!/bin/bash
# Cadastrar maquinas em dominio samba em lote.


#cria contas das estacoes para que as mesmas possam logar no dominio

UUID=11480;

while read Linha
do
UUID=$((UUID+1));
echo "Cadastrando maquina $Linha"

useradd -u $UUID -g machines -c "Windows 2000 Client" -d /dev/null -s /bin/false $Linha"$" 
/usr/local/samba/bin/smbpasswd -a -m $Linha"$" 


###############################################################################
echo "Maquina $Linha cadastrada ...."

done < maq.txt
