#Carlos Campos Fuentes
##Introducción a la infraestructura virtual: concepto y soporte físico

###Ejercicio 1
Para realizar este ejercicio, he escogido este [servidor](http://www.dell.com/es/empresas/p/poweredge-t110-2/pd?oc=pet110ii04&model_id=poweredge-t110-2)

Dicho servidor tiene un coste de:
* 1579 € sin IVA
* 1910,59 con IVA

####Amortización a 4 años
Deduciremos un 25% anual, por lo tanto:
* Primer año -> 1579 * 0,25 = 394,75
* Segundo año -> 1579 * 0,25 = 394,75
* Tercer año -> 1579 * 0,25 = 394,75
* Cuarto año -> 1579 * 0,25 = 394,75

####Amortización a 7 años
Deduciremos al principio lo máximo posible para así poder rebajar lo máximo posible la inversión inicial, por lo tanto:
* Primer años -> 1579 * 0,25 = 394,75
* Segundo año -> 1579 * 0,20 = 315,80
* Tercer año -> 1579 * 0,15 = 236,85
* Cuarto año -> 1579 * 0,10 = 157,90
* Quinto año -> 1579 * 0,10 = 157,90
* Sexto año -> 1579 * 0,05 = 78,95
* Septimo año -> 1579 * 0,05 = 78,95

###Ejercicio 2
Para este ejercicio, utilizaremos las dos grandes compañias de servicio cloud, que son [Amazon EC2](http://aws.amazon.com/es/ec2) y [Google Compute Engine](https://cloud.google.com/compute/).

En el caso de Amazon EC2, vamos a utilizar el **m3.xlarge**, sus características son:
	CPU -> 4
	RAM -> 15
	Precio -> 0,280 $/h

En el caso de Google Compute Engine, utilizaremos **n1-standard-4**, el cuál es similar al anterior:
	CPU -> 4
	RAM -> 15
	Precio -> 0,252 $/h

**Calcular coste anual usando el 1%**
Amazon EC2: 0,280 $/h * 87,6 h = 24,528 $ -> 19,22468 €
GCE (Google Compute Engine): 0,252 $/h * 87,6 h = 22,0752 $ -> 173,02210 €

**Calcular coste anual usando el 10%**
Amazon EC2: 0.280 $/h * 876 h = 245,28 $ -> 19,22468 €
GCE: 0.252 $/h * 876 h = 220,752 $ -> 173,02211 €







