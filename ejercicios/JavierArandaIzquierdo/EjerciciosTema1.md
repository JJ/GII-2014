# Ejercicios Tema 1

### Ejercicio 1
##### Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Para este ejercicio he buscado este [servidor Dell](http://configure.euro.dell.com/dellstore/config.aspx?oc=pet110ii04&model_id=poweredge-t110-2&c=es&l=es&s=bsd&cs=esbsdt1&).

Su precio sin IVA 1579,00€. 

La amortizacion de 4 años seria un 25% cada año:

	1579,00€ / 4 años = 394,75 € por año

La amortizacion de 7 años seria: 3 años al 20% y 4 años al 10%. Esto nos da los siguientes resultados:

	Tres años a 315,8 €  ------> el 20%
    Cuatro años a 157,9€ ------> el 10%


### Ejercicio 2
##### Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Primero calculamos las horas que estaria activo el servidor para el 1% y el 10%, sabiendo que un años tiene 365 dias x 24 horas/dia = 8760 horas

	El 1% de 8760 es 87,60 horas
    El 10% de 8760 es 876 horas

[Google Compute Engine:](https://cloud.google.com/products/calculator/)

| Sistema Operativo | Tipo | CPU Cores | RAM | Datacenter | $/hora | $/dia | $/mes | $/año | Precio 1% | Precio 10% |
|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
| Linux | n1-standar1 | 1 | 3,75 GB | Europa | 0,05$ | 1,16$ | 34,87$ | 418,44$  |  4,38$ | 43,80$ |
| Linux | n1-standar2 | 2 | 7,5 GB | Europa | 0,09$ | 2,33$ | 69,75$ | 837$  |  7,88$ | 78,84$ |
| Linux | n1-standar4 | 4 | 15 GB | Europa | 0,19$ | 4,65$ | 139,49$ |  1673,88$ | 16,64$  | 116,44$ |
| Linux | n1-standar8 | 8 | 30 GB | Europa | 0,39$ | 9,30$ | 278,98$ | 3347,76$  | 34,16$  | 341,64$ |
| Linux | n1-standar16 | 16 | 60 GB | Europa | 0,78$ | 18,60$ | 557,96$ | 6695,52$  | 68,32$  | 683,28$ |


[Arsys:](www.arsys.es/servidores/dedicados)

| Sistema Operativo | Tipo | CPU Cores | RAM | €/hora | €/mes | €/año | Precio 1% | Precio 10% |
|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
| CentOS 6 | Servidor S2 | 1 x 2 Core | 2 GB | 0,17€ | 125€ | 1500€ |  14,90€ | 148,92€ |
| CentOS 6 | Servidor S4 | 1 x 4 Core | 4 GB | 0,24€ | 175€ | 2100€ |  21,02€ | 210,24€ |
| CentOS 6 | Servidor S6 | 1 x 6 Core | 8 GB | 0,31€ | 225€ | 2700€ | 27,16€  | 271,56€ |
| CentOS 6 | Servidor S8 | 2 x 4 Core | 8 GB | 0,38€ | 275€ | 3300€ | 33,29€  | 332,88€ |

Con esta comparación, se ve como la virtualizacion es mucho mas barato que los servidores dedicados.

### Ejercicio 3
#### 1.¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.
#### 2.Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

#####[Primera parte](https://github.com/JJ/GII-2014/issues/71)

##### Segunda parte

El codigo del programa es un simple HolaMundo en Python:

```
#!/usr/bin/env python
print "Hola mundo en Python"
```

- Instalamos CDE con apt-get install cde
- Ejecuto el programa con "cde python holamundo"
- Me voy a mi directorio "/cde-package/cde-root/home/javi/Escritorio"
- Ejecuto "./python.cde holamundo" y funciona

### Ejercicio 4
#### Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.Avanzado Instalarlo y crear una aplicación contenedorizada

Realizado el tutorial de ordenes Docker

### Ejercicio 5
#### Instala el sistema de gestion de fuentes git
Para instalarlo en Ubuntu basta con escribir esto en la linea de comandos "sudo apt-get install git"

### Ejercicio 6
#### 1.Crear un proyecto y descargarselo con git. Al crearlo se marca la opcion de incluir el fichero README.
#### 2.Modificar el README y subir el fichero modificado
He creado un repositorio llamado "ejercicio6" en mi perfil de github.

Para descargarlo he utilizado "git clone https://github.com/JavideBaza/ejercicio6.git"

Se puede ver como ha sido modificado [aqui](https://github.com/JavideBaza/ejercicio6/blob/master/README.md)

### Ejercicio 7
#### Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene. 
Se encuentra en la carpeta /sys/fs/cgroup y las carpetas que contiene son: blkio, cpu, cpuset, devices, freezer, hugetlb, memory, perf_event, systemd.


###Ejercicio 8
####1.Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.
-Primeramente voy a crear un grupo para mi usuario javi que se encargara de  controlar la memoria y CPU (deberemos estar como administrador para hacerlo):

	cgcreate -a javi -g memory,cpu:ejercicio7
El siguiente paso es crear 3 subgrupos para ejecutar el navegador, un procesador de textos y el centro de software de ubuntu:

	sudo cgcreate -g memory,cpu:ejercicio7/navegador
	sudo cgcreate -g memory,cpu:ejercicio7/editor
	sudo cgcreate -g memory,cpu:ejercicio7/centroSoftware
    
Tras esto, ejecutamos las ordenes con cgexec:

	sudo cgexec -g memory,cpu:ejercicio7/navegador firefox
	sudo cgexec -g memory,cpu:ejercicio7/editor gedit
	sudo cgexec -g memory,cpu:ejercicio7/reproductorMusica 
Podemos ver los resultados en la carpeta

	/sys/fs/cgroup/(memory|cpu)/ejercicio7/(navegador|editor|centroSoftware)
#####Estas son las capuras de dichos archivos:
Para el navegador, podemos ver el tiempo consumido por el usuario y por el sistema en el archivo cpuacct.stat:

![navegador cpuacct](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/cpuacct-navegador.png)

Aqui podemos ver el archivo memory.stat para ver la memoria consumida en Bytes:
![navegador memory](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/memory-navegador.png)

Las capturas para el editor de texto son las siguientes:

![editor cpuacct](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/cpuacct-editor.png)

![editor memory](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/memory-editor.png)

Las capturas para el software center de texto son las siguientes:

![editor cpuacct](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/cpuacct-centroSoftware.png)

![editor memory](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/memory-centroSoftware.png)


####2.Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.
Primero eligiremos un ordenador de cualquier tienda, en mi caso he elegido [este](http://www.redcoon.es/B538778-Acer-Aspire-E1-572G-74508G1TMnii_Port%C3%A1tiles). Contando con que un portatil tiene una vida media de 7 años y que el consumo de electricidad de un portatil es de unos [30 € al año](http://www.pcsilencioso.com/recursos/bdd/73-alimentacion/45-gasto-electricidad):

1 año serian 100€ + 30€ de energia = 130€

7 años serian 700€ + 210€ de energia = 910€



###Ejercicio 9

####2.Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).

	

####3.Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).
####4.Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.

### Ejercicio 10
#### Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
Al abrir el fichero /proc/cpuinfo podemos ver que mi procesador es el siguiente:
![procesador](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/modeloprocesador.png)
Al hacer: 

	egrep '^flags.*(vmx|svm)' /proc/cpuinfo 
la salida es la siguiente:

![egrep](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/egrep.png)

### Ejercicio 11
#### Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Al ejecutar el comando kvm-ok el resultado es el siguiente:

![kvm](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/kvm-ok.png)

### Ejercicio 12
####[Comentar diferentes soluciones de Software as a Service de uso habitual](https://github.com/JJ/GII-2014/issues/72)
