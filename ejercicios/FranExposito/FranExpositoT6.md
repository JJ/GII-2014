##Ejercicios Tema 6. [Francisco Javier Expósito Cruz](http://github.com/franexposito)

##Virtualización completa: uso de máquinas virtuales
###Ejercicio 1.

```
sudo apt-get install qemu-kvm
sudo apt-get install qemu-system
```

###Ejercicio 2.
Dado que KVM es un módulo del kernel, puede que no esté cargado por defecto. Dependiendo del procesador que usemos, lo cargamos con:  

```
sudo modprobe kvm-intel
```

Nosotros debemos primeramente crear la imagen donde queremos que se vaya a instalar el sistema operativo. La única propiedad que es necesaria para crear la imagen es el tamaño de esta, debemos especificar el tamaño que ocupará esa imagen.  

Una vez que se termina la instalación, solo falta "encender" la máquina virtual que ya se ha instalado, debemos ejecutar el siguiente comando:  

```
qemu -hda maquina.img -m 256 -boot c
```

###Ejercicio 3.


###Ejercicio 4.
Creamos la imagen:  

```
qemu-img create kvm/mint.img 8G //linux mint exige minimo 8gb
```

Lanzamos la instalación con la opcion -m 512

```
qemu -hda kvm/mint.img -cdrom /home/franexposito/Descargas/linuxmind-16-kde.iso -boot d -m 512
```

###Ejercicio 5.
Creamos la imagen:  

```
qemu-img create kvm/ubuntu.img 8G
```

Lanzamos la instalación:  

```
qemu -hda kvm/ubuntu.img -cdrom /home/franexposito/Descargas/ubuntu-13.04-desktop-amd64.iso -boot d
```
Una vez instalada la ejecutamos con:  

```
qemu -hda ubuntu.img -m 1G -boot c
```

Instalamos nginx:

```
sudo apt-get install nginx
```

###Ejercicio 6.
En primer lugar instalamos juju en el caso de no tenerlo instalado ya.
```
sudo add-apt-get-repository ppa:juju/stable
sudo apt-get update
sudo apt-get install juju-core
juju init
```

Modificamos el archivo de configuración que como nos indica el terminal al crearlo esta en la ruta ~/.juju/environments.yaml. Es importante modificar la linea de default para que trabaje en entorno local:  
```
#default: amazon
default: local
```

Creamos el entorno:
```
juju bootstrap
```

CONFIGURACIÓN AZURE
Primero nos creamos un certificado rellenando todos los datos:  
```  
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
chmod 600 azure.cer
```

Cargamos en la web azure el certificado que acabamos de crear.
