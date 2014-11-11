# Ejercicios de FelixParra
# Modulo I
## Sesión 29-sept-2014

**Ejercicio 1:**<br />
**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.**<br /><br />
Servidor: [Link del servidor](http://www.dynos.es/servidor-hp-proliant-ml350e-g8-xeon-e5-2407-2.2-ghz-2gb-ddr3-500gb-sata-lff-dvd-rw-matrox-g200-array-b120i-887111422231__470065-691.html "Servidor")

<br />Precio total: 1035€
<br />Base Imponible: 855,37€
<br />IVA: 179.63€ 
<br />*-Coste de amortización 4 años:*
<br />Año 2015 (25%): 213,84€
<br />Año 2016 (25%): 213,84€
<br />Año 2017 (25%): 213,84€
<br />Año 2018 (25%): 213,84€
<br />*-Coste de amortización 7 años:*
<br />Año 2015 (15%): 128,30€
<br />Año 2016 (15%): 128,30€
<br />Año 2017 (15%): 128,30€ 
<br />Año 2018 (15%): 128,30€
<br />Año 2019 (15%): 128,30€
<br />Año 2020 (15%): 128,30€
<br />Año 2021 (10%): 85,57€
<br />

**Ejercicio 2:**<br />
**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.** <br />

Fuente: t2.mircro [Amazon](http://aws.amazon.com/es/ec2/pricing/ "Amazon")<br />
Fuente: A0 [Azure](http://azure.microsoft.com/es-es/pricing/details/cloud-services/ "Azure")<br />
* Vendedor 1: Azure 0,0148€/h
  * Tiempo de uso 1%: 1,29648 €
  * Tiempo de uso 10%: 12,9648 €
* Vendedor 2: Amazon 0,014€/hora
  * Tiempo de uso 1%: 1,2264 €
  * Tiempo de uso 10%: 12,264 €
La diferencia radica en las características que ofrecen cada una de las empresas por ese precio, como pueden ser servicios extra, horas gratuitas de uso, o almacenamiento extra.
<br />

**Ejercicio 3:**<br />
**¿Qué tipo de virtualización usarías en cada caso?** <br />
######Apartado 3.1: [Foro](https://github.com/JJ/GII-2014/issues/71 "Respuesta") 

######Apartado 3.2: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.
<br />
![imagen EJ_3](http://imageshack.com/a/img909/4383/9U1I1A.png)

<hr />

## Sesión 30-sept-2014

**Ejercicio 4:**<br />
**Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.**<br />
![imagen EJ_4](http://imageshack.com/a/img673/3176/c3IQoX.png)

<br />**Ejercicio 5: Instala el sistema de gestión de fuentes git**<br />

![imagen Ej_5](http://imageshack.com/a/img538/9873/rqrgai.png)

<br />**Ejercicio 6:** <br />
######6.1.Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.<br />
![imagen Ej_6_1_1](http://imageshack.com/a/img673/1894/CtkfwI.png)<br />
![imagen Ej_6_1_2](http://imageshack.com/a/img538/5820/BICLPq.png)<br />
######6.2.Modificar el readme y subir el fichero modificado.<br />
![imagen Ej_6_1_2](http://imageshack.com/a/img674/9550/CLdz4f.png)

<br />**Ejercicio 7:** <br />
**Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.**<br />
-La instalación esta hecha y se ha montado en /sys/fs/cgroup<br />
-Lo que contiene es:<br />
![imagen Ej_7](http://imageshack.com/a/img661/4265/QVSZsN.png)

<hr />

## Sesión 6-oct-2014

**Ejercicio 8:**
######8.1 - Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.

######8.2 - Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes

<br />**Ejercicio 9:**<br>
######9.1 - Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.<br />
######9.2 - Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).<br />
######9.3 - Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema). <br />
######9.4 - Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.<br />

**Ejercicio 10:**<br />
**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**<br />
Al trabajar desde una máquina virtual la orden egrep '^flags.*(vmx|svm)' /proc/cpuinfo no funciona. El archivo cpuinfo es el siguiente: <br /> 
![imagen Ej_10](http://imageshack.com/a/img910/3717/q2bvds.png)

**Ejercicio 11:**<br />
**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**<br />
![imagen Ej_11](http://imageshack.com/a/img674/6798/6sq8cp.png)

**Ejercicio 12:**<br />
**Comentar diferentes soluciones de Software as a Service de uso habitual**<br />
Foro: [Contestación](https://github.com/JJ/GII-2014/issues/72 "Contestación")<br />

<hr />

# Modulo II
## Sesión 20-oct-2014

**Ejercicio 1:**<br />
**Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba,obviamente).**<br />
Instalación de virtualenv para python.

**Ejercicio 2:**<br />
**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.**<br />
![imagen EJ_2_2](http://imageshack.com/a/img911/5276/OiDENR.png)

**Ejercicio 3:**<br />
**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**<br />
[Link web](http://felix-parra.rhcloud.com/ "Web") 
![imagen EJ_2_3](http://imageshack.com/a/img674/7789/FPOF8Z.png)

**Ejercicio 4:**<br />
**Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.**<br />
