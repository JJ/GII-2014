
Virtualización completa: uso de máquinas virtuales
====================================================================

Ejercicio 1
-----------

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Como no me funciona kvm en el portatil, voy a realizar estos ejercicios en el sobremesa usando ubuntu 14.10:
```bash
# Instalo kvm
sudo apt-get install cpu-checker

# compruebo que esta disponible.
kvm-ok
```
![1_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/1_1.png)


Ejercicio 2
-----------

**1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

Para este ejercicio voy a usar varias imágenes, una de ellas será [slitaz](http://www.slitaz.org/en/)

Me descargo la imagen de slitaz desde su web.
Creo un disco virtual usando:
```bash
qemu-img create -f qcow2 disco1.qcow2 2000M
```
Arranco la imagen para instalarla en el disco1:
```bash
qemu-system-x86_64 -hda disco1.qcow2 -cdrom slitaz-4.0.iso
```
![2_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_2.png)
![2_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_1.png)

Ademas de crear una máquina virtual con slitaz, voy a crear otra con [ttylinux](http://ttylinux.net/Download/)

Me descargo la imagen de ttylinux desde su web.
Creo un disco virtual usando:
```bash
qemu-img create -f qcow2 disco2.qcow2 2000M
```
Arranco la imagen para instalarla en el disco2:
```bash
qemu-system-x86_64 -hda disco2.qcow2 -cdrom ttylinux-pc_x86_64-2015.01.iso 
```
![2_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_3.png)
![2_4.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_4.png)

**2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

Para este apartado voy a usar el hipervisor VirtualBox, una vez que lo tengo instalado, voy a crear una máquina nueva.
![2_5.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_5.png)

La primera que voy a instalar en este hipervisor va a ser slitaz que ya tengo descargada su imagen.
Lo primero que tengo que hacer en VirtualBox es especificar el nombre y sistema operativo.
![2_6.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_6.png)
Tras indicar el nombre del sistema y el sistema, se arranca la máquina y se le indica la imagen del sistema para arrancar. En la siguiente captura de pantalla muestro el sistema slitaz inciado.
![2_7.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_7.png)

Ahora voy a crear otra máquina virtual con VirtualBox, ahora una máquina con ttylinux. Para crearla, hay que volver a repetir los pasos anteriores. En la siguiente captura de pantalla muestro el sistema ttylinux iniciado con VirtualBox.
![2_8.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_8.png)


Ejercicio 3
-----------

**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img**

He usado lo siguiente:
```bash
qemu-system-x86_64 -boot order=c -drive file=disco1.qcow2,if=virtio
qemu-system-x86_64 -hda disco1.qcow2 
```

|               | Sin Virtu (s) | Con Virtu (s)  |
| ------------- | ------------- | -------------  |
|        Test 1 | 9.222         | 10.473         |
|        Test 2 | 9.849         | 9.424          |
|        Test 3 | 11.559        | 9.506          |
|        Test 4 | 9.582         | 9.995          |
|        Media: | 10.053        | 9.849          |


Ejercicio 4
-----------

**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

Voy a crear una máquina virtual Linux de [Fedora LXDE Spin](http://download.fedoraproject.org/pub/fedora/linux/releases/20/Live/i386/Fedora-Live-LXDE-i686-20-1.iso), la descargo con 
```bash 
wget http://download.fedoraproject.org/pub/fedora/linux/releases/20/Live/i386/Fedora-Live-LXDE-i686-20-1.iso
```

Lo primero que voy a hacer es crear un disco:
```bash
qemu-img create -f qcow2 lxde.img 10G
```
![4_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/4_1.png)

Tras crear el disco paso a instalar Fedora LXDE Spin:
```bash
qemu-system-x86_64 -hda lxde.img -cdrom Fedora-Live-LXDE-i686-20-1.iso -m 512M
```
![4_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/4_2.png)

Despues de instalar salgo de la máquina y la arranco ejecutando:
```bash
qemu-system-x86_64 -boot order=c -drive file=lxde.img,if=virtio -m 512M -name fedora -vnc :1
```
Esto no abre ninguna ventana ni nada:
![4_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/4_3.png)

Ahora abro otro terminal y compruebo la ip a la que tengo que conectarme, uso el comando 
```bash 
ifconfig
```
Como se muestra en la siguiente captura, me tengo que conectar a la ip 192.168.122.1:
![4_4.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/4_4.png)

Ahora para conectarme uso 
```bash 
vinagre 192.168.122.1
```


Ejercicio 5
-----------

**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

Compruebo la lista de imagenes que hay en Azure con el comando:
```bash
azure vm image list
```
Escojo una imagen de ubuntu:
```bash
azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-trusty-14_04_1-LTS-amd64-server-20150127-en-us-30GB 
```
![5_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/5_1.png)
Ahora creo la máquina con:
```bash
azure vm create santiagoIV b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-trusty-14_04_1-LTS-amd64-server-20150127-en-us-30GB santiago Password1! --location "West Europe" --ssh
```
![5_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/5_2.png)
Con esto ya tengo una máquina con Ubuntu server creada y con un usuario "santiago" con password Password!1.

Ahora paso a comprobar que se ha creado la máquina y iniciarla:
```bash
azure vm list
azure vm start 
```
![5_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/5_3.png)
Una vez iniciada, me voy a conectar por ssh para instalar nginx, para ello:
```bash
ssh santiago@137.117.144.34
```
Actualizo, instalo nginx e inicio nginx:
```bash
sudo apt-get update
sudo apt-get install nginx
sudo service nginx start
```
![5_4.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/5_4.png)
Ahora paso a abrir el puerto 80 en Azure, ya que por defecto solo abre el puerto 22 de SSH.
Tras abrir el puerto, si accedo a la dirección http://santiagoiv.cloudapp.net/ podré ver la página de inicio de nginx respondiendo desde mi servidor.
![5_6.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/5_6.png)


Ejercicio 6
-----------

**Usar juju para hacer el ejercicio anterior.**

Para este ejercicio he seguido el manual para configurar [juju en azure](https://juju.ubuntu.com/docs/config-azure.html).

```bash
# Creo un certificado en mi máquina.
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout azure.pem -out azure.pem
openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
chmod 600 azure.pem
```
Tras crear el certificado, lo voy a subir a azure, para ello, accedo a la interfaz web de azure.
Pincho sobre servicios y pincho en la máquina a la que le voy a añadir el certificado y accedo a certificados y lo subo.
![6_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/6_1.png)
```bash
# Genero el fichero de config.
juju generate-config
```
Tras esto voy a editar el fichero *environments.yaml*
![6_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/6_3.png)

Ahora indico el switch "azure" y hago bootstrap.
```bash
sudo juju switch azure
sudo juju bootstrap
sudo juju deploy --to 0 juju-gui
sudo juju expose juju-gui
```

Con esto ya podemos acceder al panel en el que indicamos que queremos instalar nginx.


Ejercicio 7
-----------

**Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.**

Descargo la ISO de linux mint desde su [web](http://www.linuxmint.com/download.php), en mi caso he descargado linux mint 17.1 cinnamon de 32 bits.

Para la instalación voy a seguir los mismos pasos que en el ejercicio 2.

Creo una máquina virtual en virtual box.
![7_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/7_1.png)

Le indico el iso que debe de cargar para instalarlo, en mi caso linuxmint-17.1-xfce-32bit.iso.
Una vez que se a iniciado con la imagen, mint nos va a ir pidiendo en su menú de instalación datos de usuario, donde deseamos instalar, etc.
