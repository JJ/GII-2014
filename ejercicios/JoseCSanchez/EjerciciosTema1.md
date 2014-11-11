# Ejercicios tema 1

## Ejercicio 1

El equipo que he elegido para calcular su amortización es el siguiente, y su página web se puede consultar pinchando <a href=http://www.dynos.es/servidor-hp-proliant-ml350e-g8-xeon-e5-2403-1.8-ghz-2gb-500gb-disco-duro-hdd-3.5-matrox-g200-887111422361__470065-695.html:>aquí</a>

SERVIDOR HP PROLIANT ML350E G8 XEON E5-2403 1.8 GHz 2GB 500GB DISCO DURO HDD 3.5" MATROX G200 de HP
Su precio es 964.00 €

Primero habrá que calcular el precio de la máquina sin el iva:

964 / 1.21 = 796.69 €

Ahora con ese precio calculo las amortizaciones.

**Para cuatro años**

Cada año le aplico el 25%, por lo tanto cada año se amortiza 199.17 €

**Para siete años**

Año 1 - 20% - 159.33<br>
Año 2 - 20% - 159.33<br>
Año 3 - 20% - 159.33<br>
Año 4 - 10% - 47.80<br>
Año 5 - 10% - 47.80<br>
Año 6 - 10% - 47.80<br>
Año 7 - 10% - 47.80<br><br>


## Ejercicio 2

En este ejercicio, comparo los precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube.

Para el servicio de cloud he elegido el Servidor cloud t2.medium de [Amazon EC2](http://aws.amazon.com/es/ec2/pricing/). Su precio es de 0,041€/hora.

Para el servicio de alojamiento web he elegido la empresa [arsys](http://www.arsys.es/hosting?gclid=CIaA-tz5rsECFQgXwwodo30AOw). El precio mas caro de todos sus presuspuestos, es el de 12€/mes.


**1% del tiempo de uso:**
Para el servicio de Amazon EC2, sería (0,041€ * 24h * 30 días * 12 meses) * 1% = 3,54€<br>
Para el servicio de arsys, siempre se pagará lo mismo puesto que el pago se realiza mensualmente: 12€/mes * 12 meses = 144€/año.<br>


**10% del tiempo de uso:**
Para el servicio de Amazon EC2, seria (0,041€ * 24h * 30 días * 12 meses) * 10% = 35,42€ <br>
Para el servicio de arsys, siempre se pagará lo mismo puesto que el pago se realiza mensualmente: 12€/mes * 12 meses = 144€/año.<br><br>


## Ejercicio 3

Parte 1: [Mi comentario en el foro](https://github.com/JJ/GII-2014/issues/71#issuecomment-59239961)


## Ejercicio 4

En la siguiente captura, muestro el final del tutorial despues de haberlo completado:

![](http://fotos.subefotos.com/0029a057e1f60509746b245257751ff9o.png)


## Ejercicio 5

En la siguiente foto muestro como ya tengo instalado git, y en su versión mas reciente.

![](http://fotos.subefotos.com/af847187f58a79b87f61633d42991fcao.png)


## Ejercicio 6

Uso mi repositorio como proyecto para clonar:

![](http://fotos.subefotos.com/3984f4f7823df7bdb04e66b429f185e1o.png)

Añado el archivo README.md
```sh
git add README.md 
```

Realizo cambios en el archivo. Seguidamente le hago un commit con un mensaje:
```sh
git commit -m "README actualizado"
```

Subimos los cambios al repositorio remoto de github
```sh
git push origin master
```

## Ejercicio 7

En mi máquina uso el ubuntu 14.04, por lo que ya tengo instalado el /sys/fs/cgroup. Lo compruebo mediante la terminal, y lo muestro en la siguiente captura:

![](http://fotos.subefotos.com/15000e15c18fced226b4251fea6a6cd7o.png)


## Ejercicio 10

Para comprobarlo ejecuto el siguiente comando:
egrep '^flags.*(vmx|svm)' /proc/cpuinfo, cuya salida se muestra en la siguiente captura:

![](http://fotos.subefotos.com/8b68f45c82ade1dc0057fb70d3a6a679o.png)

Para consultar el modelo del procesador accedemos a la información de /proc/cpuinfo:

![](http://fotos.subefotos.com/00c4d661a26fe4de3e89147946e6e941o.png)


## Ejercicio 11

Previamente instalo cpu-checker, y una vez instalado, con el comando kvm-ok compruebo que el núcleo KVM está en mi máquina. En la siguiente captura se puede observar que efectivamente está instalado:

![](http://fotos.subefotos.com/4998074add857be744e96e033c769477o.png)


## Ejercicio 12

De entre las muchas que he encontrado por internet, destaco las tres siguientes:

**Akamai**: tiene grandes planes en la nube, ya sean de seguridad, almacenamiento o una multitud de otras capacidades. Su optimización de la nube ofrece mejorar el rendimiento, incrementar la disponibilidad e incrementar la seguridad de las aplicaciones y los datos prestados (o compartidos) en la nube.

**Cloud9 Analytics**: aplicación simple pero potente para ayudar a los gerentes de ventas en la predicción de ventas de forma más precisa, en el comportamiento del personal de ventas, hace mas efectivas las reuniones de ventas semanales y finalmente aumenta los porcentajes de ganancias. CLoud9 incorpora visibilidad a tiempo real de  la previsión de ventas.

**FinancialForce**: es un software como un servicio de sistema de contabilidad e innovador sistema de gestión financiera que tiene un enfoque fresco a una función de negocio tradicional. La aplicacion fue creada junto a force.com y distribuido en estrecha integracion con salesforce.com.

