#Ejercicios de [Francisco Javier Expósito Cruz](http://github.com/franexposito)

##Introducción a la infraestructura virtual: concepto y soporte físico
###Ejercicio 1.
Para la realización de este ejercicio voy a utilizar el siguiente [servidor](http://www.senetic.es/product/709942-421?gclid=CjwKEAjwqamhBRDeyKKuuYztxwQSJAA1luvGNmmaBPD8uIBTFVNLdraahBwsAqJr7wJy4doFwrarLRoCeEfw_wcB)  
El servidor elegido tiene el siguiente coste:
* 4 207,08 euros precio bruto
* 3 476,93 euros precio neto

######Cálculo de la amortización en 4 años:
Nos deduciremos hasta un máximo de un 25% anual siguiendo la tabla de amortizaciones simplificada.  
* Primer año: 3476,93 * 25% = 869,2325  
* Segundo año: 3476,93 * 25% = 869,2325  
* Tercer año: 3476,93 * 25% = 869,2325  
* Cuarto año: 3476,93 * 25% = 869,2325  

######Cálculo de la amortización en 7 años: 
Para ello nos deduciremos en un primer momento la mayor parte al principio puesto que es cuando se realiza la inversión.  
* Primer año: 3476,93 * 25% = 869,2325  
* Segundo año: 3476,93 * 20% = 695,386  
* Tercer año: 3476,93 * 20% = 695,386  
* Cuarto año: 3476,93 * 15% = 521,5395  
* Quinto año: 3476,93 * 10% = 347,693  
* Sexto año: 3476,93 * 5% = 173,8465  
* Séptimo año: 3476,93 * 5% = 173,8465  

###Ejercicio 2.
Para la comparación voy a utilizar dos de los servicios más conocidos: [Amazon EC2](http://aws.amazon.com/es/ec2/) y [Google Compute Engine](https://cloud.google.com/products/compute-engine/)  
Características de la máquina de Amazon m1.medium:
* CPU: 1 core
* Memoria: 3,75GB 
* Disco duro: 410GB
* Precio: 0,126714105 euros/hora

Características de la máquina de Google n1-standard-1-d:
* CPU: 1 core
* Memoria: 3,75GB
* Disco duro: 420GB
* Precio por hora: 0,114834658 euros/hora

######Cálculo de los precios al 1% de uso:
Amazon: 0,126714105 * 87,6 horas = 11,15084124 euros.  
Google: 0,114834658 * 87,6 horas = 10,105449904 euros.  

######Cálculo de los precios al 10% de uso:
Amazon: 0,126714105 * 876 = 111,00155598 euros  
Google: 0,114834658 * 876 horas = 100,595160408 euros  

###Ejercicio 3.
######Apartado a
[Comentario en el foro](https://github.com/JJ/GII-2014/issues/71#issuecomment-60100625)

######Apartado b
Para la realización de este ejercicio he optado por una sencilla aplicación en phyton desarrollada para la asignatura de Desarrollo de Aplicaciones en Internet. 

[Programa](https://www.dropbox.com/s/d287zt39h4j5f3t/ejercicio1.py?dl=0)

Una vez descargado el archivo binario de [cde](https://github.com/downloads/pgbovine/CDE/cde_2011-08-15_32bit) y darle permisos de ejecución, probamos a empaquetar el programa:
![imagen1](http://i.imgur.com/KOecKJI.png)
![imagen2](http://i.imgur.com/xdaSLlG.png)

Finalmente probamos el paquete en otra distribución para ver que funciona correctamente:
![imagen3]()

###Ejercicio 4.
[x] Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.
![imagen4](http://i.imgur.com/pYj8C4Y.png)

###Ejercicio 5.
[x] Instala el sistema de gestión de fuentes **git**  
![imagen5](http://i.imgur.com/VeQayLD.png)

###Ejercicio 6.
En mi [repositorio de Github](https://github.com/franexposito) se pueden apreciar la creación de varios proyectos con la inclusión y modificiación del archivo README. Por ejemplo en [este proyecto](https://github.com/franexposito/bkst-calculator/blob/master/README.md)

###Ejercicio 7.
En mi caso se encuentra situado en: 
<pre><code>/sys/fs/cgroups</code></pre>
Y podemos ver que el contenido haciendo un ls:  
[imagen6](http://i.imgur.com/6WqOGkz.png)  

###Ejercicio 8.
[] Pendiente por desarrollar  

###Ejercicio 9.
**CPU**:  Intel(R) Core(TM)2 Duo CPU     T5450  @ 1.66GHz  
Tras ejecutar el comando:  
<pre><code>$ egrep '^flags.*(vmx|svm)' /proc/cpuinfo</code></pre>  
Obtenemos, que en mi caso, no están instalados o activados los flags.  

###Ejercicio 10.
Tras ejecutar la orden:  
<pre><code>$ kvm-ok</code></pre>  
Obtenemos, en mi caso, que no está soportado.  

###Ejercicio 11.
[x] Comentar diferentes soluciones de Software as a Service de uso habitual [Comentario](https://github.com/JJ/GII-2014/issues/72#issuecomment-58912586).  