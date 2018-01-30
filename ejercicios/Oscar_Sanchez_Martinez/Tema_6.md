
# Ejercicios de Óscar Sánchez Martínez #
 
**Ejercicio 1 Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**


[imagen](http://i.imgur.com/yw19Mfj.jpg)
Como se ve en esta imagen al usar un sistema ya virtualizado para realizar la asignatura, no me permite usar las extensiones de KVM y su aceleracion no esta soportada.

Para instalar los paquetes necesarios en el caso de que no nos diera este error seria:

sudo apt-get install qemu-kvm libvirt-bin bridge-utils


**Ejercicio 2.1 Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

- Creamos el disco donde alojaremos los sistemas que instalaremos:

qemu-img create -f qcow2 fichero-cow.qcow2 500M

[imagen](http://i.imgur.com/EEfwzn4.jpg)
- Procedemos a instalar los sistemas con las ordenes:
	*Para slitaz:
	qemu-system-x86_64 -hda img.qcow2 -cdrom slitaz-4.0.iso -boot once=d 

[imagen](http://i.imgur.com/2sDngDZ.jpg)
**Ejercicio 2.2 Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

Para ello hemos usado virtualbox que tengo instalado en la máquina anfitriona y es bastante simple :

- Creamos un disco donde alojar el sistema (le hemos dado un 1GB de RAM y 8 GB de memoria). Una vez Hecho esto nos vamos a configuración -> almacenamiento y le pasamos la iso. Con esto, esta lista para lanzarse. Una vez instalada el resultado es :

[imagen](http://i.imgur.com/ddNQbBg.jpg)

**Ejercicio 3 Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img**


**Ejercicio 4 Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**



**Ejercicio 5 Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

Voy a montar un servidor nginx en una maquina virtual para acceder mediante web dentro de la red en la que está conectada la máquina virtual del server. Para ello :

- Instalamos una máquina virtual con ubuntu.La installación se hace de la misma forma que he descrito en el apartado 2 del ejercicio dos aunque deberemos configurar la red para poder comunicarnos con la máquina virtual desde el anfitrión, por ese motivo:
	*descargamos la iso.
	*Creamos un disco para alojar el sistema
	*En el apartado red, elejimos la opción "adaptador solo-anfitrión" para poder conectarnos a la máquina virtual.

[imagen](http://i.imgur.com/mkacyz6.jpg)

	*le pasamos la iso de la imagen y lo lanzamos.


- Una vez instalado el sistema operativo, instalamos nginx con el comando:

sudo apt-get instal nginx

- Cuando se complete la instalación, abrimos el fichero default de  /etc/nginx/sites-available para configurar el server, por ejemplo , con gedit:

sudo gedit /etc/nginx/sites-available/default 

[imagen](http://i.imgur.com/dYAI7H3.jpg)

- Descomentamos esas dos lineas para que el servidor escuche en ese puerto y guardamos los cambios. Después de esto, lanzamos el servidor nginx con el comando:

service nginx start

- Ya podemos comprobar que el server escucha y sirve la página de nginx

[imagen](http://i.imgur.com/L0huy91.jpg)

**Ejercicio 6 Usar juju para hacer el ejercicio anterior.**


**Ejercicio 7 Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.**

Para este ejercicio utilizaremos virtualBox, como he explicado en el apartado 2 del ejercicio dos, es básicamente seguir los mismos pasos:

-Primero, creamos el disco donde alojaremos el sistema linux mint.


[imagen](http://i.imgur.com/d2sWbyu.jpg)

-Una vez creado, procedemos a pasarle la iso en configuración -> almacenamiento.

[imagen](http://i.imgur.com/WvghpXd.jpg)

Y ya esta listo para lanzarse e instalarse.

[imagen](http://i.imgur.com/kY3fRu4.jpg)

