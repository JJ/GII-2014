##Tema 6:

###Ejercicio 1:

Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Ya lo instale en el primer tema compruebo que tengo alguna maquina instalada:

````
sudo virsh list --all
````

<img src="http://i61.tinypic.com/2pr7lsn.jpg"/>

###Ejercicio 2:

Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

COREOS:

Primero creo el espacio virtual para la imagen por ejemplo con 1GB:

````
qemu-img create -f qcow2 imagen1.qcow2 1000M
````

<img src="http://i59.tinypic.com/sfulc5.jpg"/>


Ahora llamamos a la maquina y a la iso para que la cargue:

````
qemu-system-x86_64 -hda imagen1.qcow2 -cdrom coreos_production_iso_image.iso
````

<img src="http://i59.tinypic.com/t80lec.jpg"/>

Y aqui lo tenemos funcionando:

<img src="http://i59.tinypic.com/15ceybq.jpg"/>

SLITAZ:

<img src="http://i60.tinypic.com/29yrx8k.jpg"/>

````
qemu-img create -f qcow2 imagen2.qcow2 1000M
qemu-system-x86_64 -hda imagen1.qcow2 -cdrom slitaz-4.0.iso
````

<img src="http://i61.tinypic.com/25oxbx1.jpg"/>


Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Actualmente uso muchisimo VirtualBox para las distintas asignaturas (Windows) FR clonar es la que uso en IV ya que haciendo pruebas en esta asignatura se ralentiza mucho la maquina:

<img src="http://i57.tinypic.com/95ztki.jpg"/>

Asi que vamos a proceder a hacer una prueba con otro linux como por ejemplo TTYLINUX en VirtualBox:

Primero creamos la maquina virtual, poniendo que es de tipo linux y otro linux de 32 bits:

<img src="http://i60.tinypic.com/t6wduo.jpg"/>

Ahora seleccionamos la ram, el disco duro y diversas opciones:

<img src="http://i62.tinypic.com/aau6x1.jpg"/>

Ya tenemos la maquina creada:

<img src="http://i58.tinypic.com/ft98x.jpg"/>

Ahora tenemos que decirle en configuración que cargue la maquina que queremos desde una ISO como si fuese un CDROM al igual que haciamos con QEMU:

<img src="http://i62.tinypic.com/20gfevn.jpg"/>

Y finalmente tenemos la maquina funcionando:

<img src="http://i58.tinypic.com/23h3n0w.jpg"/>


###Ejercicio 3:

Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con:

````
qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img
````

Para los test de entrada salida voy a utilizar sysbench he tenido que usar una maquina linux ubuntu:

Tutorial: http://www.elmundoenbits.com/2013/04/benchmark-I.html#.VMpxc2i-_5E

````
sudo apt-get install sysbench
sysbench --test=fileio --file-total-size=5G prepare
sysbench --test=fileio --file-total-size=5G \
       --file-test-mode=rndrw --init-rng=on \
       --max-time=300 --max-requests=0 run
sysbench --test=fileio --file-total-size=5G cleanup
````

Ahora las hago en los dos sitios:

````
qemu-system-x86_64 -boot order=c -drive file=imagen1.qcow2,if=virtio
````

<img src="http://i58.tinypic.com/19xdmu.jpg"/>

````
qemu-system-x86_64 -hda imagen1.qcow2
````

<img src="http://i62.tinypic.com/28jgshd.jpg"/>

Por lo que podemos ver que es algo mas rapido en los accesos a archivos grandes, pero en la media no se nota mucho.


###Ejercicio 4:

Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Lo primero es elegir un sistema linux con LXDE o que se le pueda instalar, para ello miro en la pagina de http://lxde.org/es/lxde y veo que ubuntu me sirve para este proposito, voy a darle simplemente a la maquina virtual 512 megas.

Lo primero es inicializar la maquina ubuntu y vamos a poner el LXDE, primero instalamos con la terminal:

````
sudo apt-get install lubuntu-desktop
````

Ahora simplemente cerramos sesión y ponemos el modo de escritorio en LXDE. Necesita reiniciarse al parecer. (Al reiniciarse)

<img src="http://i60.tinypic.com/10pvuwm.jpg"/>


<img src="http://i60.tinypic.com/i2sm69.jpg"/>


Ahora vamos a ejecutarlo con 512 megas y con vnc:

````
qemu-system-x86_64 -boot order=c -drive file=ubuntulxde.img,if=virtio -m 512M -name ubuntuldxe -vnc
````
Miramos la ip con ifconfig.

<img src="http://i60.tinypic.com/wv7ewn.jpg"/>

Para conectarnos al VNC simplemente con el instalamos vinagre

````
sudo apt-get install vinagre 
vinagre 192.168.56.101:5901 &
````

<img src="http://i57.tinypic.com/2hdu1dv.jpg"/>

Ahora vamos a poner el servidor ssh

````
sudo apt-get install openssh-server
sudo service ssh start
````

Y nos conectamos desde la otra maquina.

<img src="http://i59.tinypic.com/kbpsfk.jpg"/>


###Ejercicio 5:

Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Lo primero es ver las imagenes disponibles en azure:

````
azure vm image list
````

Y hago un show de la ultima imagen de ubuntu para eso usamos grep ubuntu:

<img src="http://i58.tinypic.com/2l9jzhd.jpg"/>

<img src="http://i59.tinypic.com/2nrogt2.jpg"/>

Vamos a crear una maquina virtual:

<img src="http://i59.tinypic.com/1124thw.jpg"/>

Pero no se porque desde la linea de comandos no me funciona correctamente, se queda atascado durante horas...

<img src="http://i58.tinypic.com/33wpkid.jpg"/>

Por lo que procedo a crearlo desde la aplicación web, despues el resto de pasos los seguire haciendo desde el terminal. (el usuario es azureuser)

Vemos que la maquina esta correctamente alojada:

<img src="http://i61.tinypic.com/dd0pk3.jpg"/>

Por lo que inicio la maquina:

<img src="http://i58.tinypic.com/2vdr9zn.jpg"/>

Ahora me conecto por ssh con la maquina:

````
ssh azureuser@jantoniomarin.cloudapp.net
````

<img src="http://i60.tinypic.com/688qid.jpg"/>

Ahora simplemente instalo nginx como si estuviera en un terminal de linux

````
sudo apt-get install nginx
````

Inicio el servicio:

````
sudo service nginx start
````

<img src="http://i62.tinypic.com/1z2emiw.jpg"/>

Ahora tenemos que indicarle al dominio para que utilize el puerto 80 del http para que tenga un endpoint de acceso:

<img src="http://i57.tinypic.com/x5y58y.jpg"/>

Ahora miramos el dominio y lo tenemos correctamente instalado:

<img src="http://i60.tinypic.com/k37r5e.jpg"/>


###Ejercicio 6:

Usar juju para hacer el ejercicio anterior.

Dado que borre juju voy a proceder a instalar todas las cosas de nuevo.

````
sudo add-apt-repository ppa:juju/stable
sudo apt-get update
sudo apt.get install juju-core
````

Voy a usar la información de configuración para Azure: https://juju.ubuntu.com/docs/config-azure.html

Vamos a editar el archivo de configuración:

````
sudo gedit /home/alumno/.juju/environments.yaml
````

Y procedemos a poner los datos de la cuenta de azure quitando los corchetes.

Pero antes debemos de generar unos certificados:

````
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout certificado.pem -out certificado.pem
openssl x509 -inform pem -in certificado.pem -outform der -out certificado.cer
chmod 600 certificado.pem
````

Ahora subimos el certificado en configuración:

<img src="http://i60.tinypic.com/nn5cf4.jpg"/>

Entonces el environments.yaml quedaria de la siguiente forma:

<img src="http://i62.tinypic.com/34g5zyt.jpg"/>

Despues utilizamos los siguiente comandos:

````
sudo juju switch azure
sudo juju bootstrap
sudo juju deploy --to 0 juju-gui
sudo juju expose juju-gui
````

<img src="http://i60.tinypic.com/21oo950.jpg"/>

Y hacemos un status de juju:

<img src="http://i62.tinypic.com/smavkl.jpg"/>

Ya solo tenemos que poner la direccion que nos señalaba el status (tarda un rato en activarse) y entramos con la contraseña que tenemos en un fichero que se a creado en la carpeta .juju/environment:

<img src="http://i58.tinypic.com/s4q9p0.jpg"/>

Y mediante la consola de comandos:

````
sudo juju deploy --to 0 cs:~hp-discover/trusty/nginx-4
sudo expose nginx
````

Quedando instalado correctamente:

<img src="http://i62.tinypic.com/qy8qpt.jpg"/>



###Ejercicio 7: 

Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Descargo la imagen de LinuxMint desde: http://www.linuxmint.com/download.php

Voy a instalarla desde VirtualBox:

Ejecuto la imagen:

<img src="http://i59.tinypic.com/11kffgp.jpg"/>

Pero no consigo instalar ninguna de las versiones que me he descargado de 32bits ni de 64 bits:

<img src="http://i60.tinypic.com/5zl2xl.jpg"/>




