*-----------------------------------------------------------------*
| Envia los archivos con expect LINUX                             |
*-----------------------------------------------------------------*

--Instalar paquetes
$ sudo apt-get install expect
$ sudo yum install expect

--Shell que le permite enviar por scp con contraseña el archivo a una ruta especifica

vi PMP.exp

#!/usr/bin/expect
set filename [lindex $argv 0]
spawn scp  $filename oracle@10.281.0.216:/home/oracle/PMP_Total

           set pass "Password"
           expect {
           Password: {send "Pa$$w0r\r"; exp_continue}
                     }
                     
                     
--Shell que ejecuta el archivo exp

vi PMP_execute.exp

FECHA=`date '+%Y%m%d_%H%M'`
export FECHA
expect /home/oracle/PMP_Total/PMP.exp *$FECHA*.html
