#Ejercicio 1

Calcular amortización a 4 y 7 años de un servidor

Servidor: [ASUS TS700-E7/RS8](http://www.alternate.es/ASUS/TS700-E7-RS8-(DVD-RW)/html/product/1135513?)

Precio: 1349€ (con IVA).
Precio sin IVA con el que realizaremos los cálculos: 1065,71€.
Además consideraremos que el equipo se ha obtenido en Enero (por lo que contariamos el año completo al realizar la amortización).

**Amortización a 4 años** 
Cada año se amortizaría un 25%, lo que nos daría una cantidad de 266,4275€ al año.

**Amortización a 7 años**
Cada año se amortizaría un 14'3% lo que nos daría una cantidad aproximada de 152,39€ al año.


#Ejercicio 2

Vamos a realizar una comparación de precios entre servicios de alojamiento en Internet y de proveedores de servicios en la nube. Hemos escogido como proveedor a la compañía [*Acens*](http://www.acens.com/).

- Características del servidor:
  * 4 cores
  * 4GB RAM
  * 600GB Disco
  
- Precio anual en un *Servidor Dedicado* : 203,3€/mes * 12 = 2439,6€/año.
- Precio anual en *Cloud Server* : 331,2€/mes (0.46€/hora) * 12 = 3974,4€/año.

Vamos a realizar comparaciones según el porcentaje de uso :
  Para un servidor dedicado pagaríamos siempre lo mismo, ya utilicemos un 1%, 10%. Ya que el pago se realiza por mes y   no por uso.

* Si se utiliza un 1% del tiempo :
  - Servidor Dedicado: 2439,6€/año (203,3€ * 12, Pago fijo al mes).
  - Cloud Server: 40,296€/año (8760horas/año * 0.46€/h = 4029,6€ aproximadamente).

*Si se utiliza un 10% del tiempo :
  - Servidor Dedicado: 2439,6€/año (203,3€ * 12, Pago fijo al mes).
  - Cloud Server: 402,96€/año (8760horas/año * 0.46€/h = 4029,6€ aproximadamente).
   


#Ejercicio 3

- Parte 2:
 
Se ha realizado un pequeño programa en python que suma dos valores introducidos por teclado.

Una vez creado, hemos instalado el paquete CDE, con la siguiente instrucción:
	> sudo apt-get install cde

A continuación hemos dado permisos de ejecución (chmod +x suma.py) al programa.

Por último hemos ejecutado una serie de comandos para realizar el empaquetado en CDE.
Hemos realizado una copia del fichero suma.py en los siguientes directorios:
	- /usr/games
	- /usr/bin

Una vez tenemos la copia en ese directorio ejecutamos:
	> cde suma.py

Se ejecutará y a continuación realizaremos un ls, para ver como se han creado en nuestro directorio una serie de ficheros y una carpeta. Accederemos a la carpeta "cde-packages" y ejecutaremos otro ls.

Nos saldrán un listado de los archivos que se han creado al ejecutar la orden cde anterior.

Comprobamos que ejecutando el fichero (./suma.py.cde) el programa se ejecuta correctamente.



#Ejercicio 4

Vamos a realizar el tutorial de docker que se encuentra en el siguiente enlace [*Tutorial*](https://www.docker.com/tryit/)

![Ejercicio_4](http://i.imgur.com/1I2UHzW.png?1)



#Ejercicio 5

Para comenzar la instalación del sistemas de fuentes Git, lo primero que
vamos a hacer es actualizar el listado de los paquetes.
	
	> sudo apt-get update

A continuación instalaremos el paquete.
	
	> sudo apt-get install git
	
Por último vamos a realizar la configuración de algunos parámetros que
servirán para identificarnos a la hora de realizar gestiones en nuestros
repositorios. Primero configuraremos el nombre y a continuación el email.

	> git config --global user.name "Cristina Rosillo"
	> git config --global user.email "cristy.blk@gmail.com"
	
Si queremos comprobar el estado de todos estos valores, podemos ejecutar:
	
	> git config --list
	
![Ejercicio_5](http://i.imgur.com/O5S6Kiu.png)



#Ejercicio 6

Vamos a crear un proyecto nuevo y a descargarlo desde git, modificando al el fichero README desde linea de 
comandos y actualizandolo.

![Ejercicio_6_1](http://i.imgur.com/Wrq19vn.png)

![Ejercicio_6_2](http://i.imgur.com/oMLMGms.png)

![Ejercicio_6_3](http://i.imgur.com/mhvsWgI.png)

![Ejercicio_6_4](http://i.imgur.com/5sCygPW.png)

![Ejercicio_6_5](http://i.imgur.com/m5EWt99.png)


#Ejercicio 7

Para verificar si está montado, comprobaremos que el directorio /sys/fs/cgroup
no esté vacío. Si lo está como en mi caso tendremos que montarlo ejecutando lo siguente:

	>sudo mount -t cgroup cgroup /sys/fs/cgroup
	
Una vez hecho, haremos un ls para ver su contenido.

![Ejercicio_7](http://i.imgur.com/945l6hG.png)



#Ejercicio 10

Si tiene instalados los flags, podemos comprobarlo ejecutando la siguiente orden:

	> egrep '^flags.*(vmx|svm)' /proc/cpuinfo

El procesador del equipo es:

![Ejercicio_10_1](http://i.imgur.com/YXYxnHg.png)

La salida que produce la ejecución de la primera orden es la siguiente.

![Ejercicio_10_2](http://i.imgur.com/W8XzkM3.png)



