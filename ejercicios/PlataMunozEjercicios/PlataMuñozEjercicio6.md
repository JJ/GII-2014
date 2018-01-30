####1. Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Lo primero que hacemos es comprobar si podemos usar o no virtualización, mediante la orden:

kvm-ok

En nuestro caso es posible, por tanto pasamos a instalar los paquetes necesarios para kvm:

sudo apt-get install qemu-kvm qemu-system libvirt-bin virtinst virt-manager

####2. 

####2.1 Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Primero activamos el módulo del kernek kvm con:

sudo modprobe kvm-intel

Descargamos la máquina virtual de SliTaz y la instalamos.


qemu-img create -f raw SliTar-hdd.img 100M
qemu-system-x86_64 -hda ./SliTar-hdd.img -cdrom Descargas/slitaz-4.0.iso 


[](http://imageshack.com/i/p8OeUFgip)


[](http://imageshack.com/i/p12nSquUp)

Ya tenemos slitax funcionando.

Ahora vamos a probar con Damn Small Linux:

Simplemente hacemos:

wget ftp://distro.ibiblio.org/pub/linux/distributions/damnsmall/current/dsl-4.4.10.iso
qemu-img create -f qcow2 dsl_imagen.img 500M
qemu-system-x86_64 -hda /home/ariacus/Escritorio/dsl_imagen.img -cdrom /home/ariacus/Escritorio/dsl-4.4.10.iso



![](http://i.imgur.com/mYkctJH.png)


####2.2 Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Para este ejercicio usaré VirtualBox que ya lo tengo instalado e instalaremos UbuntuServer:

![](http://i.imgur.com/XSM6vqI.png)


####3. Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con:

qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img

Haciendo un tanteo acerca de los tiempos tomados con virtualización y sin virtualización, he comprobado que es mas rapido con virtualización, aunque los tiempos no varian demasiado.


####4. Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.


Para este ejercicio he elegido Lubuntu:

qemu-img create -f qcow2 Lubuntu-hdd.img 8G qemu-system-x86_64 -hda ~/qemu/lubuntu-hdd.img -cdrom ~/qemu/lubuntu-13.10-desktop-i386.iso -m 512M

Instalamos el SO y ahora hacemos con ssh lo siguiente:

qemu-system-x86_64 -boot order=c -drive file=Lubuntu-hdd.img,if=virtio -m 512M -name lubuntu -redir tcp:2222::22

-Conectamos por ssh al localhost por el puerto 2222.
-Ahora tenemos que instalar en el anfitrión el cliente VNC, nos conectamos a la máquina virtual por VNC, para ello necesitamos la IP de la NAT de la máquina.
-A continuación podemos arrancar y conectar de la siguiente manera:


Ahora para conectarnos correctamente a la máquina usando VNC debemos de instalar en la máquina anfitriona el cliente VNC como se muestra a continuación:

qemu-system-x86_64 -boot order=c -drive file=Lubuntu-hdd.img,if=virtio -m 512M -vnc :1 vinagre 192.168.122.1:5901

####5. Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Para ello voy a usar vb




-Primero importamos la clave del repositorio:

        cd /tmp/
        wget http://nginx.org/keys/nginx_signing.key
        apt-key add /tmp/nginx_signing.key
        rm -f /tmp/nginx_signing.key

-Añadimos el repositorio en /etc/apt/sources.list 
-sudo apt-get install nginx (update previamente)

Editamos el fichero de configuración añadiendo:

upstream apaches {
            server 192.168.246.128
            server 192.168.246.130
        }

        server{
            listen 80;
            server_name miservidor;
            access_log /var/log/nginx/miservidor.access.log;
            error_log /var/log/nginx/miservidor.error.log;
            root /var/www/;

            location /{ 
                proxy_pass http://apaches;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_http_version 1.1;
                proxy_set_header Connection "";
            }
        }

Una vez hecho esto nos basta con relanzar nginx:

`service nginx restart`

Finalmente abrimos nuestro navegador añadiendo la ip de nuestra página y nos saldrá el index por defecto indicando que nginx está activo.



####7. Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Como algunos compañeros he tenido problemas con Linux Mint, por tanto he intentado hacerlo con Ubuntu 12.04


Primero instalamos los siguientes paquetes:

`sudo apt-get install ubuntu-vm-builder kvm virt-manager`


`sudo vmbuilder vmw6 ubuntu --suite precise --flavour server --arch i386 -o --dest /home/ariacus/Escritorio/ubuntu --hostname ubuntu --domain ubutu1`


Ahora entramos en VirtualBox, creamos una nueva máquina virtual y cuando nos de la opción de introducir un disco duro virtual, le damos a "Usar un archivo de dd virtual existente", que va a ser el que hemos creado en el escritorio llamado ubuntu.


Arrancamos y comprabaremos que funciona perfectamente con usuario y contraseña ubuntu.


































