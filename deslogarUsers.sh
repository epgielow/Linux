########Inicio_do_Script#########
#!/bin/bash
wall a sess�o ser� desligada em 30 segundo !!!
sleep 30
kill -9 `ps -aux |egrep -v '(usuario1|usuario2)'|grep bash |awk '{print $2}'`
########Fim_do_Script########## 
