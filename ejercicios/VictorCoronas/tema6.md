##TEMA 6

#Virtualización completa: uso de máquinas virtuales

* [+]Ejercicio 1
 - A) Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones.
 Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado 
 para ejecutarlo o hay que conformarse con la paravirtualización.

El primer paso que tenemos que dar es comprobar que nuestro procesador soporta virtualización, para ello usamos el siguiente comando:

    egrep -c '(vmx|svm)' /proc/cpuinfo

Si el resultado es igual a "0" es que no lo soporta, en mi caso es asi ya que lo estoy usando desde una máquina virtual.
[Ver](https://www.dropbox.com/s/kw6c9e26k8y13ny/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2013.11.37.png?dl=0)

Si nos saliese un número ">0", eso siginifica que lo soporta.

Otra alternativa para comprobar, es usar "kmv-ok", que te daría información [ver](https://www.dropbox.com/s/o582nhc43dt5r39/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2013.08.29.png?dl=0).

Para saber más informacion sobre los resultados y demás [ver enlace](https://help.ubuntu.com/community/KVM/Installation).

El segundo paso sería proceder a instalar los paquetes necesarios para poder usar "KVM", para ello usamos el siguiente comando:

    sudo apt-get install qemu-kvm qemu-system libvirt-bin virtinst virt-manager

[Ver instalción](https://www.dropbox.com/s/stznyxi0dhihaay/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2013.17.18.png?dl=0)

* [+]Ejercicio 2
 - A) Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD.
Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas
se puede usar CoreOS (que sirve como soporte para Docker) 
GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y 
ttylinux (basado en línea de órdenes solo).

El primer paso que debemos de dar es activar el módulo del kernel kvm con el siguiente comando:

    sudo modprobe kvm-intel

Ahora vamos a crear las diferentes máquinas.

El primero que vamos a hacer es con "SliTaz":

 - Primero nos descargamos la imagen de la [página oficial](http://www.slitaz.org/en/get/#stable).
 - Ahora tenemos que crear un nuevo disco virtual con:

    `qemu-img create -f raw SliTaz-hdd.img 100M`
[Ver](https://www.dropbox.com/s/ap2zfs0bs06sm7d/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.21.07.png?dl=0)

 -Por último solo tenemos que arrancar la máquina virtual para instalarla:
 
    `qemu-system-x86_64 -hda ./SliTaz-hdd.img -cdrom ../media/sf_PRACTICAS/slitaz-4.0.iso`
[Ver](https://www.dropbox.com/s/l80n5g5ak6wkwtw/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.28.04.png?dl=0)

El primero que vamos a hacer es con "ttyLinux":

 - Primero nos descargamos la imagen de la [página oficial](http://ttylinux.net/dloadV-x86_64.html).
 - Ahora tenemos que crear un nuevo disco virtual con:

    `qemu-img create -f qcow2 ttylinux-hdd.img 500M`
[Ver](https://www.dropbox.com/s/u3892p71096jmd8/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.29.42.png?dl=0)

 -Por último solo tenemos que arrancar la máquina virtual para instalarla:
 
    `qemu-system-x86_64 -hda ./ttylinux-hdd.img -cdrom ttylinux-pc_x86_64-16.1.iso`
[Ver](https://www.dropbox.com/s/7rqxs7h9m7ccrav/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.31.39.png?dl=0)

 B) Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Yo voy a usar "VirtualBox" que es el hipervisor que tengo instalado.
[Ver](https://www.dropbox.com/s/kry3gcb7917hehg/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.33.28.png?dl=0)

Ahora debemos de darle al "botón NUEVO" y hay rellenamos algunos [campos](https://www.dropbox.com/s/ga1drzyc0r09308/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.35.03.png?dl=0).

Ponemos el tamaño de "RAM" a usar, [ver](https://www.dropbox.com/s/jpp3vpnuyxkfzq4/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.37.55.png?dl=0).

Creamos un disco virtual y le damos un tamaño dinámico. [Ver](https://www.dropbox.com/s/akwh7arxxkor14z/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.39.13.png?dl=0).

Una vez estos pasos se creará la máquina, por último tenemos que darle a la configuración de la máquina virtual y en la sección de "almacenamiento", le asignamos una imagen ".iso" de las que tengo a la unidad, como se muestra a continuación. [Ver](https://www.dropbox.com/s/oqway5ik68yi09d/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.41.15.png?dl=0).

Para finalizar, solo le damos a "Mostrar" y arrancará la instalación de nuestro sistema operativo. [Ver](https://www.dropbox.com/s/lnkudm9pupwvba5/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.44.12.png?dl=0)

* [+]Ejercicio 3
 - A) Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con "qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img"

El primer paso que debemos de dar es usar un benchmark escrito en "c++" que he usado de un de un compañero de la asignatura "ISE de tercero". 

```
   #include <iostream>
   #include <cmath>
   
   using namespace std;

   void proceso(void) {
   
       unsigned int i=0;
       unsigned int j=0;
       unsigned int k=0;
   
       for(i=0; i<10000; i++){
           for(j=0; j<10000; j++){
               k*=13; k/=11;
           }
       }
   }
   
   int main(int argc, char **argv) {
   
       double inicio, fin;
   
       inicio = clock();
       proceso();
       fin = clock();
   
       double resultado = fin - inicio;
       cout << "El tiempo es: " << resultado << endl;
   
       return 0;
   }
   ````

Para ello vamos a usar dos sistemas iguales pero en diferentes sistemas:

El primero será en "qemu" con un ubuntu server:

Da un tiempo de 774934

[Ver](https://www.dropbox.com/s/4jg6iz561owexhg/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2012.08.29.png?dl=0)

El segundo será en "VirtualBox" con un ubuntu server:

Da un tiempo de 717254

[Ver](https://www.dropbox.com/s/6dgqu6kkjto0mcb/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2012.20.33.png?dl=0)

Segun los datos obtenidos con el benchmark el sistema que da mejores resultados seria el que corre en "VirtualBox".

* [+]Ejercicio 4
 - A) Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.
Lo que vamos a ahcer es descargarnos "Lubuntu" ya que es una distribución que tiene el entorno gráfico "LDXE", para ello usamos los siguientes comandos:

    `qemu-img create -f qcow2 Lubuntu-hdd.img 8G`
    `qemu-system-x86_64 -hda lubuntu-hdd.img -cdrom ../media/sf_PRACTICAS/lubuntu-13.10-desktop-i386.iso -m 512M`
    
    
[Ver 1](https://www.dropbox.com/s/t9yq1x7qwfa44da/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.56.56.png?dl=0)

[Ver 2](https://www.dropbox.com/s/3yeceuhynbs5nxf/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2017.58.40.png?dl=0)

Realizamos la instalación siguiendo los pasos tipicos de instalación como cualquier otro sistema operativo:

[Ver 1](https://www.dropbox.com/s/nnbe2pqt3a5z7bt/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2018.00.14.png?dl=0)

[Ver 2](https://www.dropbox.com/s/nnbe2pqt3a5z7bt/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2018.00.14.png?dl=0)

[Ver 3](https://www.dropbox.com/s/m4ijic307loosep/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2018.03.08.png?dl=0)

[Ver 4](https://www.dropbox.com/s/2fbzc0njs9g3thd/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2018.04.37.png?dl=0)

De esta manera ya tendríamos instalado "Lubuntu".

Ahora para poder conectarnos por ssh solamente debemos de hacer lo siguiente:

    qemu-system-x86_64 -boot order=c -drive file=Lubuntu-hdd.img,if=virtio -m 512M -name lubuntu -redir tcp:2222::22

Y para conectarnos al "localhost" hacemos:

    ssh -p 2222 lubuntu@localhost

Ahoara para el caso de usar "VNC", tenemos que instalarlo primero en la máquina anfitriona con:

    apt-get install vnc4server

[Ver](https://www.dropbox.com/s/415xyexqe5cayb8/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2018.11.08.png?dl=0)

A continuación nos conectamos a nuestra máquina virtual usando el servicio VNC, para ello usamos la IP de la NAT de nuestra máquina.

Basta con hacer ifconfig y nos la mostrará:

    virbr0 : 192.168.122.1

[Ver](https://www.dropbox.com/s/pn0x7kynrd22z0k/Captura%20de%20pantalla%202015-01-12%20a%20la%28s%29%2018.12.47.png?dl=0)

Ya por último vamos a proceder a arrancar y conectarnos a nuestra máquina virtual con se muestra a continuiación:

    qemu-system-x86_64 -boot order=c -drive file=Lubuntu-hdd.img,if=virtio -m 512M -vnc :1
    vncviewer 192.168.122.1:5901


* [+]Ejercicio 5
 - A) Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Uso una máquina virtual de ubuntu server ya crea en la práctica anterior. POr lo que debemos de abrir virtualBox y arrancamos la máquina:

[Ver](https://www.dropbox.com/s/kqvkj62tm9yzneg/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.02.09.png?dl=0)

Ahora abrimos la terminal he instalamos "nginx" en caso de que no lo tengamos instalado, para ello usamos el siguiente comando:

    sudo apt-get install nginx

[Ver 1](https://www.dropbox.com/s/gwm9b985qbd0suu/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.05.55.png?dl=0)

[Ver 2](https://www.dropbox.com/s/a90awh5wljd64z6/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.06.46.png?dl=0)

Una vez instalado "nginx" tenemos que reiniciar el servicio con el siguiente comando:

    sudo service nginx restart

[Ver](https://www.dropbox.com/s/9ndg8i3ylh6h32p/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.08.08.png?dl=0)

Ahora comprobamos la ip local que tenemos en nuestra máquina con:

    ifconfig

También podemos editars el fichero de configuración que se encuentra en:

    /etc/nginx.confd/default.conf:

Por último nos vamos a nuestro navegador y ponemos nuestra ip o "localhost", y se nos mostraría la página "index" de "Nginx".

[Ver](https://www.dropbox.com/s/504z8iap8ba7wmr/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.28.48.png?dl=0)

* [+]Ejercicio 6
 - A) Usar juju para hacer el ejercicio anterior.

El primer paso que tenemos que dar es iniciar "juju" con el siguiente comando:

    juju init

El segundo paso es crear el certificado para que lo use "juju", esto se hace de la siguiente manera:

    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
    openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
    chmod 600 azure.pem

El siguiente paso después de tener el certificado es, editar el archivo "environments.yaml", en el cual tenemos que buscar:

 - "management-subscription-id", se conoce con el comando:

    `azure account list`

 - "storage-account-name", se conoce con el comado:

    `azure storage account list`

Una vez realizado estos pasos, tenemos que subir el certificado, nos vamos a "configuración", después en la zona de "Certificados de administración", le damos al botón de "Cargar" y buscamos el archivo "azure.cer" que habiamos creado.

[Ver 1](https://www.dropbox.com/s/35b48lib5jtsw86/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2016.25.47.png?dl=0)

[Ver 2](https://www.dropbox.com/s/p33nybqdfiopdp8/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2016.26.33.png?dl=0)

[Ver 3](https://www.dropbox.com/s/hkjb7uiie4o2v66/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2016.27.49.png?dl=0)

Una vez tengamos ya el certificado y los pasos anteriores completados, vamos a crear un taper para instalar los servicios dentro de el:

    juju switch azure
    juju bootstrap
    juju deploy --to 0 juju-gui
    juju expose juju-gui

Nos tenemos que meter en la web que nos ofrece:

    juju status

[Ver](https://www.dropbox.com/s/5an4ca679quf7er/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2016.36.57.png?dl=0)

La contraseña para acceder como el usuario "user-admin" es el valor de "admin-secret" en el archivo de configuración "environments.yaml".

[Ver](https://www.dropbox.com/s/zcc5xeqleo47ipp/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2016.38.30.png?dl=0)

He usado dos fuentes para realizar este ejercicio:

[Enlace 1](https://juju.ubuntu.com/docs/config-azure.html)

[Enlace 2](http://eithel-inside.blogspot.com.es/2014/06/instalando-juju-para-orquestrar-nuestra.html)

* [+]Ejercicio 7
 - A) Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

El primer paso que debemos de dar es instala los paquetes que necesitamos con:

    apt-get install ubuntu-vm-builder kvm virt-manager

[Ver 1](https://www.dropbox.com/s/p6mil0qsh2o1qrf/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.40.47.png?dl=0)

[Ver 2](https://www.dropbox.com/s/ocgb2o328xonilu/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.43.32.png?dl=0)

Lo siguiente será decir la distribución, destino, nombre, etc, mediante el siguiente comando:

    vmbuilder kvm ubuntu --suite precise --flavour server -o --dest ~/home --hostname walker --domain walker 

[Ver](https://www.dropbox.com/s/4qeu6sxpus1t0ao/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.46.47.png?dl=0)

El último paso que debemos de dar, es crear una máquina virtiual con VirtualBox, siguiendo los pasos como explico en el "Ejercicio 2 B)", pero a la hora de seleccionar el disco seleccionamos este que hemos creado en este ejercicio. Le damos a la opción de " Seleccionar un archivo de disco virtual..."

[Ver](https://www.dropbox.com/s/31eyxdaenrx8iss/Captura%20de%20pantalla%202015-01-13%20a%20la%28s%29%2011.50.10.png?dl=0)
