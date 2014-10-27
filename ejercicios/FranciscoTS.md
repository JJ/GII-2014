
###Ejercicio 1

[Ordenador Servidor] 

http://www.dynos.es/ordenador-hp-500-315ns-intel-core-i5-4460s-8gb-1-tb--intel-hd-graphics-dvdrw--usb-3.0-wifi-win-8.1__J2H53EA.html

Usando como ejemplo un ordenador servido de 599 euros. Imaginamos que compramos el ordenador el 6/01/2015. Con lo que el primer año tendremos que contarlo entero, al comprarlo en el primer trimestre. Calculamos el precio sin iva de dicho ordenador: 599 / 1,21 = 495 €. 

Amortización a 4 años con un 25% cada año: 

Año 2015, 2016, 2017, 2018 y 2019: 123, 76 €

Para la amortización a 7 años imaginaremos que el ordenador lo compramos en mitad del año, en este caso el 6/07/2015. El primer y segundo año pondremos un 25% y el resto un 10 %.

Añortización a 7 años:

Año 2015: 61,88 €, 
Año 2016: 123, 76 €
Año 2017, 2018, 2019, 2020, 2021: 49,5 €, 
Año 2022: 61,88 € 

###Ejercicio 2

Para la comparación usare los siguiente servidores:

http://aws.amazon.com/es/ec2/

https://cloud.google.com/compute/

**Cálculo de los precios al 1% de uso:**

Amazon: 0,126714105 * 87,6 horas = 11,15084124 euros.  
Google: 0,114834658 * 87,6 horas = 10,105449904 euros.  

**Cálculo de los precios al 10% de uso:**

Amazon: 0,126714105 * 876 = 111,00155598 euros  
Google: 0,114834658 * 876 horas = 100,595160408 euros  


###Ejercicio 4

![imagen1](http://s2.subirimagenes.com/otros/previo/thump_9133750ejercicio-4.jpg)

Para instalar Docker en Ubuntu escribimos: sudo apt-get install docker.io

###Ejercicio 5

Para instalar Git en Ubuntu escribimos: sudo apt-get install git

###Ejercicio 6

Una vez que hayamos instalado git escribimos lo siguiente para clonar un proyecto: git clone "URL del directorio que queremos clonar"

Como queremos añadir el archivo README al proyecto: git add README.md

Y para modificar el contenido de ese archivo: git commit -m "Modificado por FTS"

Para guardar los cambios: git push origin master

###Ejercicio 7

Escribimos: sudo mount -t cgroup cgroup /sys/fs/cgroup

Cambiamos de directorio: cd /sys/fs/cgroup

Realizamos un ls y aparece:

![imagen2] (http://s2.subirimagenes.com/otros/previo/thump_9133771ejercicio-7.jpg)

###Ejercicio 8

Creamos el primer grupo de control para el navegador: mkdir cgroup/chrome

###Ejercicio 10

Con el comando "cat /proc/cpuinfo", vemos la CPU que tenemos: Intel(R) Core(TM)2 Duo CPU T 6500 @ 2.10GHz
Con el comando "egrep '^flags.*(vmx|svm)' /proc/cpuinfo", no aparece nada ya que no esta activada esa opción.

###Ejercicio 11

Dicho modulo no esta habilitado, ya que en virtualbox no esta habilitada la aceleración por hardware. En pantalla nos aparece esto: Your CPU does not support KVM extensions. KVM acceleration can NOT be used. 
