#!/bin/bash

# Escrito por Leandro Santiago da Silva
# e-mail: leandrosansilva@gmail.com
# Críticas, sugestões, enviarem para esse e-mail.

# Programa que verifica se você tem um mesmo arquivo em vários diretórios
# A checagem é feita via md5sum, o que faz com que mesmo que arquivos diferentes tenham o mesmo nome, serem ainda sim considerados diferentes
# É possível jogar a lista dos arquivos repetidos num arquivo de log.




      
for ARQUIVO in * ; do
   TESTE=$( ls -ld "$ARQUIVO" | grep '^-' )
   if [ $? = 0 ] && [ -e   "$1"/"$ARQUIVO"  ] ; then
      if [ $( md5sum "$ARQUIVO" | cut -f1 -d' ') = $( md5sum "$1"/"$ARQUIVO"  | cut -f1 -d' ' ) ]; then
         echos $ARQUIVO
         if [ ! -z $2 ]; then
            echo $ARQUIVO >> $2
         fi
      fi
   fi
done 
