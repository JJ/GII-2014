#Ejercicio 1#
##Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.##

Para empezar a usar *KVM* es necesario instalarlo, y aunque ya lo hicimos en el primer tema, el comando que se debe ejecutar para su instalación es el siguiente:

<code>sudo apt-get install qemu-kvm libvirt-bin</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-37.png">

Ahora vamos a comprobar si el núcleo instalado en mi ordenador contiene este módulo del kernel usando la orden <code>kvm-ok</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-38.png">

También podemos observar el listado de máquinas virtuales ya instaladas con <code>sudo virsh list --all</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-39.png">

#Ejercicio 2#
##1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).##

EN ESTE EJERCICIO VAMOS A PROCEDER A INSTALAR VARIAS MÁQUINAS VIRTUALES.

Vamos a empezar con **SliTa**:

+ Lo primero que vamos a hacer es descargar la imagen de *SliTaz*.

+ Una vez ya hayamos descargado la imagen, vamos a crear un nuevo disco virtual. Para ello, ejecutaré lo siguiente:

<code>sudo qemu-img create -f qcow2 slita.qcow2 10000M</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-40.png">

+ Ahora vamos a arrancar la máquina virtual cargando la imagen. Para ello, vamos a ejecutar lo siguiente:

<code>qemu-system-x86_64 -hda slita.qcow2 -cdrom slitaz-4.0.iso</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-41.png">

+ Ahora comienza la instalación y así quedará instalada:

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-42.png">

Ahora vamos a instalar una máquina virtual con **ttyLinux**:

+ Lo primero que vamos a hacer es descargar la imagen de *ttyLinux*.

+ Una vez ya hayamos descargado la imagen, vamos a crear un nuevo disco virtual. Para ello, ejecutaré lo siguiente:

<code>sudo qemu-img create -f qcow2 ttyLinux.qcow2 10000M</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-43.png">

+ Ahora vamos a arrancar la máquina virtual cargando la imagen. Para ello, vamos a ejecutar lo siguiente:

<code>qemu-system-x86_64 -hda ttyLinux.qcow2 -cdrom ttylinux-pc_x86_64-2015.01.iso</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-44.png">

+ Ahora comienza la instalación y así quedará instalada:

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-45.png">

##2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.##

Ahora vamos a repetir el mismo ejercicio pero esta vez con otro hipervisor. En mi caso voy a utilizar *VirtualBox*.

Voy a proceder a instalar una de las imágenes que ya tengo descargadas como por ejemplo SliTaz. Crear una máquina en virtualBox es muy intuitivo así que no voy a explicar todos los pasos. Es tan simple como pulsar sobre "nuevo" y seguir los pasos hacia adelante cambiando el tamaño del disco y la cantidad de memoria asignada a voluntad.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-46.png">

Una vez que hayamos creado el nuevo disco, le daremos a "iniciar" y elegiremos nuestra imagen.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-47.png">

Acto seguido comenzará la instalación.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-48.png">

#Ejercicio 3#
##Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con <code>qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img</code>##

#Ejercicio 4#
##Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.##

La imagen ISO que instalaré será "Lubuntu".

Lo primero que vamos a hacer es crear una imagen:

<code>qemu-img create -f qcow2 lxde.img 15G</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-49.png">

Ahora vamos a ejecutar la siguiente orden para asignarle 512 megas de RAM:

<code>qemu-system-x86_64 -hda lxde.img -cdrom lubuntu-12.04-desktop-i386.iso -m 512M</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-7.png">

Y ahora se realizará una instalación normal. Seleccionamos idiomas:

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-8.png">

Le damos a "Instalar Lubuntu":

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-9.png">

Se irá realizando la instalación con normalidad:

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-13.png">

INSTALACIÓN FINALIZADA:

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-18.png">

Una vez que ya tenemos realizada la instalación vamos a proceder a conectarnos mediante *ssh*. Para ello, seguiremos los siguientes pasos:

+ Arrancamos la máquina virtual a través de un puerto, con:

<code>qemu-system-x86_64 -boot order=c -drive file=lxde.img,if=virtio -m 512M -name lubuntu -redir tcp:4664::22</code>

+ En un terminal nuevo, miramos con "ifconfig" la dirección de la interfaz a la que vamos a conectarnos con:

<code>vinagre <direccion_interfaz></code>

+ Por último, instalaré *ssh* en la nueva máquina y accederemos desde nuestra máquina anfitriona de la siguiente manera:

<code>ssh -p 4664 javi@localhost</code>

Con estos pasos ya podremos conectarnos a la máquina mediante *ssh*.

#Ejercicio 5#
##Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.## 

Vamos a comenzar listando los "Ubuntu" que hay disponibles. Para ello, vamos a ejecutar el comando siguiente:

<code>azure vm image list | grep Ubuntu</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-40.png">

Ahora vamos a crear la máquina. Para ello, vamos a ejecutar el siguiente comando:

<code>azure vm create maquinajavi b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB javi userJavi8= --location "West Europe" --ssh</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-41.png">

Una vez que ya la tenemos creada, procedemos a arrancarla:

<code>azure vm start maquinajavi</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-42.png">

Ahora vamos a listar los detalles de la máquina:

<code>azure vm list</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-43.png">

Vamos a proceder a conectarnos mediante *ssh*:

<code>ssh iblancasa@iblancasa.cloudapp.net</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-44.png">

Ahora que ya estamos conectados ejecutamos <code>sudo apt-get update && sudo apt-get ugprade</code>, y seguidamente procedemos a instalar *nginx*  de la siguiente manera:

<code>sudo apt-get install nginx</code> 

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-45.png">

Una vez instalado, pondremos en marcha el servicio:

<code>sudo service nginx start</code>

Comprobaremos que se ha iniciado correctamente mediante el comando <code>sudo service nginx status</code>.

Por último, solo nos quedará ejecutar el siguiente comando en una terminal local:

<code>azure vm endpoint create -n http0 maquinajavi 80 80</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-46.png">

Y finalmente, accederemos desde nuestro navegador poniendo "maquinajavi.cloudapp.net".

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-47.png">

#Ejercicio 6#
##Usar juju para hacer el ejercicio anterior.##

Vamos a proceder a hacer lo mismo que en el ejercicio anterior, pero esta vez utilizando *juju*. Para ello, vamos a seguir los siguientes pasos:

+ En primer lugar, vamos a crear un certificado. Para ello, ejecuto lo siguiente:

<code>openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-48.png">

<code>openssl x509 -inform pem -in azure.pem -outform der -out azure.cer</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-49.png">

<code>chmod 600 azure.pem</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-50.png">

+ Ahora lo que haremos será cargarlo en azure. Para ello, nos iremos a la página de Azure y pulsaremos sobre "Configuración-->Certificados de Administración-->Cargar" para cargarlo.

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-51.png">

+ Seguidamente, pasaremos a editar el fichero */home/javi/.juju/environments.yaml* para cambiar alguna configuraciones. Editaremos las siguientes líneas:

FICHERO SIN MODIFICAR

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-52.png">

   - "location" pasa a "West Europe"
   - "manage-suscription-id" lo tomamos de azure account list
   - "management-certificate-path" es la ruta a nuestro ".pem", generado cuando hemos creado el certificado
   - Añadimos "availability-sets-enabled: false" (sin comillas)
   - "storage-account-name" ponemos el nombre de la cuenta de almacenamiento que vamos a usar (azure storage account list)

FICHERO MODIFICADO

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-53.png">

+ Ahora iremos ejecutando paso a paso los siguiente comandos:

<code>sudo juju switch azure</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-54.png">

<code>sudo juju bootstrap</code>

<code>sudo juju deploy --to 0 juju-gui</code>

<code>sudo juju expose juju-gui</code>

Y para comprobar su estado ejecutamos <code>sudo juju status</code>

+ A continuación, accederemos desde el navagador a la dirección que se nos indica "juju-azure-duk5z7rrds.cloudapp.net".

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-55.png">

+ La contraseña la podemos encontrar en "~/.juju/environments/azure.jenv".

+ Y una vez dentro, podremos instalar *nginx* desde el panel de control de la izquierda al acceder a la página.

#Ejercicio 7#
##Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.##

El hipervisor que tengo instalado y el cuál utilizaré es *VirtualBox*. En primer lugar, lo que haremos será descargar *Linux Mint* de [esta dirección](http://www.linuxmint.com/download.php).

Una vez la tengamos descargada, crearemos una nueva máquina virtual. Para ello, solo tendremos que pulsar sobre el botón "Nueva" y darle los valores que deseamos como memoria Ram, espacio de disco duro, etc... Podemos ver el proceso en las siguientes imágenes:

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-56.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-57.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-58.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-59.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-60.png">

Una vez creada la máquina lo que haremos será cargar la imagen:

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-61.png">

Comenzará a iniciarse la imagen:

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-62.png">

Y finalmente, para que se instale basta con pulsar sobre "Start Linux Mint":

<img src="https://github.com/javiergama8/Images/blob/master/Tema6-63.png">
