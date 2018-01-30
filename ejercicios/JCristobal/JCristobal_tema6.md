#Ejercicios de JCristobal (José Cristóbal López Zafra)

# Tema 6

[Enlace al tema](http://jj.github.io/IV/documentos/temas/Uso_de_sistemas)


##Ejercicio 1
###Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Primero volvemos a comprobar que podemos ejecutar VKM con `kvm-ok` y una vez confirmado (ya estaba instalado de otro tema) vemos el listado de máquinas virtuales ya instaladas con `sudo virsh list --all`

![imagen](http://i.imgur.com/OnbcMEL.png) 


##Ejercicio 2
###Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Primero instalamos Debian:

Creamos un disco duro virtual en formato QCOW2 con `qemu-img create -f qcow2 imagenAct2.qcow2 3G`

Y arrancamos KVM para instalar el sistema `qemu-system-x86_64 -hda ./imagenAct2.qcow2 -cdrom ./debian-7.7.0-amd64-netinst.iso`

![imagen](http://i.imgur.com/4jIkbBO.png) 


Y ahora con SliTaz:

Nos descargamos una imagen SliTaz desde [el enlace de su página](mirror.slitaz.org/iso/4.0/slitaz-4.0.iso)

Y volvemos a crear un disco duro: `qemu-img create -f qcow2 imagen2Act2.qcow2 10000M`

Arrancamos KVM : `qemu-system-x86_64 -hda imagen2Act2.qcow2 -cdrom slitaz-4.0.iso`

Pasamos al arranque automático:

![imagen](http://i.imgur.com/zVZzpZR.png) 

Y ya lo tenemos (pantallazo mostrando el resultado de la orden `top`):

![imagen](http://i.imgur.com/mRmoLvY.png) 


###Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Y usamos el hipervisor [VirtualBox](https://www.virtualbox.org/) para instalar la imagen de SliTaz:

![imagen](http://i.imgur.com/kZPtDv2.png) 

Y ahora comenzará la instalación, sólo hay que seguir los pasos que hemos seguido antes para para ello.

![imagen](http://i.imgur.com/2MF8dOl.png) 



##Ejercicio 3
###Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con `qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img`

Usando `qemu-system-x86_64 -hda ./imagenAct2.qcow2 -cdrom ./debian-7.7.0-amd64-netinst.iso`

Creamos un script:

![imagen](http://i.imgur.com/yjIANLS.png) 

Y creamos un archivo para trabajar con el con `dd if=/dev/urandom of=ficheroprueba bs=191 count=100000`, le damos permisos y hacemos varias pruebas:

![imagen](http://i.imgur.com/dtNPXf9.png) 




|            | Tiempo (s) | Velocidad   [ MB/s]  | 
| ---------- | :--------: | :------------------: | 
| prueba 1   | 26         | 769.23               | 
| prueba 2   | 43         | 465.11               | 
| prueba 3   | 64         | 312.50               |
| prueba 4   | 43         | 465.11               | 
| prueba 5   | 71         | 281.69               | 
| prueba 6   | 70         | 285.71               |
| prueba 7   | 41         | 487.80               | 
|            |            |                      | 
| Media      |   51.14    |    438.16            | 



Y sin paravirtualización, como nos indican en el enunciado `qemu-system-x86_64 -hda debian-7.7.0-amd64-netinst.iso`

Seguimos otra vez los pasos anteriores y tenemos los resultados:

|            | Tiempo (s) | Velocidad   [ MB/s]  | 
| ---------- | :--------: | :------------------: | 
| prueba 1   | 28         | 760.19               | 
| prueba 2   | 44         | 459.85               | 
| prueba 3   | 64         | 310.38               |
| prueba 4   | 42         | 460.46               | 
| prueba 5   | 70         | 278.40               | 
| prueba 6   | 71         | 275.60               |
| prueba 7   | 41         | 475.80               |
|            |            |                      | 
| Media      |   51.4     |    431.52            | 


Vemos con que con paravirtualización obtenemos resultados algo mejores.


##Ejercicio 4
###Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Creamos su disco duro: `qemu-img create -f qcow2 discolxde.qcow2 5G`

Y lo instalamos con KVM: `qemu-system-x86_64 -hda ./discolxde.qcow2 -cdrom ./debian-7.7.0-amd64-netinst.iso`

En el menú de arranque seleccionamos "Advanced options". Dentro nos vamos a "Alternative desktop environments", seleccionamos LXDE como nos indica el enunciado e instalamos.

![imagen](http://i.imgur.com/jLx66aJ.png) 

Una vez instalado:

![imagen](http://i.imgur.com/yuxOIqx.png) 


Ahora ejecutamos `qemu-system-x86_64 -boot order=c -drive file=discolxde.qcow2,if=virtio -m 512M -name debian -vnc :1`

Vemos que no se abre nada, vemos la dirección de interfaz que tenemos que usar con `ifconfig virbr0` y accedemos a ella con "vinagre 192.168.122.1:5901" en mi caso:

![imagen](http://i.imgur.com/97cWoaH.png) 


Para poder conectarnos tenemos que especificar una redirección del puerto de la máquina anfitriona a un puerto de la máquina virtual:
`qemu-system-x86_64 -boot order=c -drive file=discolxde.qcow2,if=virtio -m 512M -name debian -redir tcp:4664::22` y conectamos con `ssh -p 4664 localhost`



##Ejercicio 5
###Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Ejecutamos `azure vm image list | grep Ubuntu` para listar la máquinas virtuales que hay disponibles, mostrando las que tienen "Ubuntu" para facilitar nuestra búsqueda.

Una vez listadas escogemos la versión 
" b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-trusty-14_04_1-LTS-amd64-server-20150113.1-en-us-30GB ", la versión de 14-04-1 (LTS) más actualizada.


y la creamos con  `azure vm create jcristobal b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-trusty-14_04_1-LTS-amd64-server-20150113.1-en-us-30GB jcristobal  (micontraseña) --location "West Europe" --ssh` con jcristobal como usuario y nombre, y  (micontraaseña) será la contraseña (debe conetener minúsculas, mayúsculas, números y caractéres especiales)


Máquina recién creada y comprado listando las máquinas:
![imagen](http://i.imgur.com/WoKJpoP.png) 


La arrancamos con `azure vm start jcristobal` y nos conectamos con `ssh jcristobal@jcristobal.cloudapp.net`

![imagen](http://i.imgur.com/3E9mMFn.png) 


Una vez dentro instalamos nginx con `sudo apt-get install nginx`

[Lo comprobamos con `service nginx status`](http://i.imgur.com/lldr7Av.png) 


El servidor ya está funcionando, pero no estará accesible hasta que indiquemos un "endpoint" a la máquina virtual, así que lo creamos al puerto 80: `azure vm endpoint create -n http jcristobal 80 80` (lo comprobamos con `azure vm endpoint list jcristobal`)

![imagen](http://i.imgur.com/j99Rprq.png) 


Y nuestra web ya está creada: http://jcristobal.cloudapp.net/

![imagen](http://i.imgur.com/H5rX8Uw.png)


##Ejercicio 6
###Usar juju para hacer el ejercicio anterior.



Creamos un certificado con los comandos:
`openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem`
`openssl x509 -inform pem -in azure.pem -outform der -out azure.cer`
`chmod 600 azure.pem`


Ahora en el la pestaña de [Configuración del dashboard de Azure](https://manage.windowsazure.com/@MicrosoftAzurePass.onmicrosoft.com#Workspaces/AdminTasks/ListManagementCertificates) cargamos nuestro azure.cer

![imagen](http://i.imgur.com/wcv7mhT.png)


Ahora en environments.yaml (en /home/jcristobal/.juju) configuraremos algúnos parámetros de Azure:

* Location ahora será West Europe
* management-subscription-id será el campo id consultándolo de `azure account list`
* management-certificate-path la ruta hacia nuestro azure.pem
* storage-account-name una id que podemos consultar en `azure storage account list`
* Y añadiendo "availability-sets-enabled: false"


Guardamos el fichero y ejecutamos:

```
sudo juju switch azure
sudo juju bootstrap
sudo juju deploy --to 0 juju-gui
sudo juju expose juju-gui
```

y `sudo juju status` para ver su estado:

![imagen](http://i.imgur.com/6fM7NEh.png)

Y accedemos la dirección que nos indican: juju-azure-duk5z7rrds.cloudapp.net

![imagen](http://i.imgur.com/nV4URuo.png)

La contraseña está en ~/.juju/environments/azure.jenv como nos indican en la página.


Y una vez dentro podemos instalar nginx en el apartado de la izquierda: lo buscamos y lo agregamos:

![imagen](http://i.imgur.com/lE0jXUh.png)


[Información sobre la máquina](http://i.imgur.com/jnxIq4d.png)



