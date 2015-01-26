
#Alberto Mesa Navarro
##Virtualización completa: uso de máquinas virtuales
##Ejercicios del Tema 6

###Ejercicio 1
####Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

El comando para comprobar si podmeos usar KVM es `kvm-ok`. Se comprobará si existe /dev/kvm si nos devolverá un mensaje indicando si podemos usar o no la aceleración KVM:

![1](http://s17.postimg.org/a1rqj81hb/KVM.png)


###Ejercicio 2
####2.1 Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Lo primero que necesitamos para crear una MV es crear un HDD virtual para cada uno:

`qemu-img create -f qcow2 HDD1GB.qcow2 1024M`

`qemu-img create -f qcow2 HDD500MB.qcow2 500M`

Para iniciar la instalación tendremos que arrancar las máquinas desde la ISO respectivas, en este caso usamos [SliTaz](http://www.slitaz.org/es/) y [DSL](http://www.damnsmalllinux.org/index_es.html). En caso de tener **problemas con el ratón** utilizar el especificador de opciones -show-cursor:

`qemu-system-x86_64 -hda HDD1GB.qcow2 -cdrom Escritorio/slitaz-4.0.iso &`

![2](http://s27.postimg.org/hj7vu5zlf/sli.png)


`qemu-system-x86_64 -hda HDD500MB.qcow2 -cdrom Escritorio/dsl-4.11.rc1.iso -show-cursor &`

![3](http://s23.postimg.org/rt0f2vwcr/DSL.png)


Podemos ver ambos sistemas funcionando:

![4](http://s8.postimg.org/9021sa4vp/Sos.png)


####2.2 Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Vamos a instalar [DSL](http://www.damnsmalllinux.org/index_es.html) usando [Virtual Box](https://www.virtualbox.org/)

`sudo apt-get install virtualbox`

A continuación se recomienda instalar el VirtualBox Extension Pack:

`wget -c http://download.virtualbox.org/virtualbox/4.3.10/Oracle_VM_VirtualBox_Extension_Pack-4.3.10-93012.vbox-extpack`

Seleccionaremos "Nueva" para crear una nueva máquina virtual y le daremos un nombre:

![22](http://s13.postimg.org/uzrvzem8n/image.png)

Ajustamos la cantidad de memoria ram y, si queremos, nos fijamos en la cantidad de espacio en el disco duro recomendado:

![23](http://s12.postimg.org/ryb2fd8a5/image.png)


Elegiremos el formato VDI para el disco duro, lo que nos dará facilidades a la hora de portabilidad. En mi caso, reservo el espacio dinámicamente.

Elegimos el fichero ISO en la pestaña "almacenamiento", "Atributos de Unidad CD DVD":

![24](http://s7.postimg.org/yr9tm1dm3/DSL.png)


Iniciamos la máquina y seguimos los pasos del asistente de instalación de DSL:

![25](http://s4.postimg.org/fclpatkdp/VB2.png)


###Ejercicio 4
####Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Volveremos a necesitar un HDD y la imagen ISO del SO a instalar, en ese caso [LUbuntu](http://cdimage.ubuntu.com/lubuntu/releases/14.10/release/)

`qemu-img create -f qcow2 LUbuntu.qcow2 8096M`

La instalación la volvemos a hacer de manera simlar, pero especificamos la cantidad de RAM que queremos:

`qemu-system-x86_64 -hda LUbuntu.qcow2 -cdrom Escritorio/lubuntu-14.10-desktop-i386.iso -m 512M`

![5](http://s27.postimg.org/w7yuzcgvn/lubuntu.png)


Una vez instalada la arrancamos con los especificadores que necesitamos:

`qemu-system-x86_64 -boot order=c -drive file=LUbuntu.qcow2,if=virtio -m 512M -name debian -vnc :1`

La máquina comienza a ejecutarse pero no vemos ningún entorno: es justo lo que deseamos. A continuación observamos su ip con `ifconfig`:

![6](http://s13.postimg.org/dhcgor4t3/image.png)

Vamos a realizar un acceso remoto con vinagre, que es la opción más común:


![18](http://s21.postimg.org/54ts8dp0n/image.png)


###Ejercicio 5
####Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Listamos las máquinas virtuales disponibles:

`azure vm image list `

Elegimos la que nos interesa y procedemos (la clave debe ser mínimo de 8 caracteres, con núm, minúsc, mayúsc y algún caracter especial). No olvidar añadir el parámetro **--ssh**:

`azure vm create albertomesa b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-12_04_2-LTS-amd64-server-20121218-en-us-30GB albertomesa [clave] --location "West Europe" --ssh` 

![7](http://s14.postimg.org/nbjwdpna9/azure_create.png)

Una vez creada la arrancamos:

`azure vm start albertomesa` 

Consultamos la IP en el Panel de MV de Azure y hacemos ssh:

`ssh albertomesa@104.40.199.58` 

![8](http://s13.postimg.org/6v1nk86jb/ssh1.png)

Una vez estamos dentro podemos instalar lo que deseemos:

`sudo apt-get update`,
`sudo apt-get install -y nginx && sudo service nginx start && sudo service nginx status`

![9](http://s9.postimg.org/ejq6k962n/nginx.png)

Para el último paso necesitamos hacer logout de la máquina para configurar un extremo accesible mediante protocolo HTTP, ya que queremos usar el navegador. Como **el puerto por defecto es el 80 en nginx**, abriremos ese (el valor público y el privado deben ser el mismo, o sea que podremos 80 80 y lo llamaremos, por ejemplo, http0):

`azure vm endpoint create -n http0 albertomesa 80 80`

![10](http://s18.postimg.org/hvwkfpdjd/8080.png)

Y ahora ya podemos acceder desde nuestro navegador:

![11](http://s7.postimg.org/m8lbp0ror/welcome.png)



###Ejercicio 6
####Usar juju para hacer el ejercicio anterior.

Seguimos el [tutorial de juju](https://juju.ubuntu.com/docs/config-azure.html):

`openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem` 

`openssl x509 -inform pem -in azure.pem -outform der -out azure.cer` 

`chmod 600 azure.pem`

Ahora tenemos que cargarlo en Azure. La manera más sencilla es hacerlo mediante la interfaz del gestor web de Azure. Para ello click en "Configuración, Certificados de Administración y Cargar", donde elegiremos nuestro **azure.cer**:

![12](http://s27.postimg.org/bpv4euiur/cert.png)

![13](http://s7.postimg.org/bqxm5og17/certificado.png)

Con `juju generate-config` se habrá creado un fichero **environments.yaml** que tendremos que editar para ajustarlo a nuestros parámetros:

![14](http://s18.postimg.org/mspyzw2q1/environment.png)

Seleccionamos azure en juju y hacemos bootstrap:

`sudo juju switch azure`,
`sudo juju bootstrap`

![17](http://s27.postimg.org/6y01yx2pf/starting.png)

Una vez lanzada la instancia, podemos desplegar. Especificaremos que queremos interfaz gráfica en juju con **juju-gui**:

`sudo juju deploy --to 0 juju-gui`

**Si obtenemos el siguiente error:**

`ERROR cannot assign unit "juju-gui/0" to machine 0: unit placement is not supported with availability-sets-enabled`

Lo solucionaremos añadiendo en environments.yaml la línea **availability-sets-enabled: false**:

![15](http://s9.postimg.org/s8j1od88v/false.png)

Como último paso para resolver el error destruimos el entorno creado previamente: `sudo juju destroy-environment azure` y volvemos a ejecutar los pasos.

Finalmente: `sudo juju expose juju-gui && sudo juju status`

Si todo ha ido bien nos devolverá una dirección "public adress". Si nos dirigimos a ella en el navegador vemos una solicitud de credenciales. Cogeremos la clave de nuestro fichero en `/home/alberto/environments/azure.jenv` y accedemos.

![16](http://s11.postimg.org/5y7rn7p8j/juju.png)

Una vez dentro, desde el panel izquierdo sólo hay que instalar nginx y listo.

###Ejercicio 7
####Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Descargaremos la ISO de [Linux Mint](http://www.linuxmint.com/download.php). Esta vez usaremos un gestor de máquinas virtuales más intuitivo:

`sudo apt-get install virt-manager`

`virt-manager lvm2 qemu-system`

![19](http://s29.postimg.org/5bsha6gk7/image.png)

![20](http://s24.postimg.org/e4qhck41h/ISO.png)

![21](http://s12.postimg.org/eyh8iiyb1/Mint.png)










