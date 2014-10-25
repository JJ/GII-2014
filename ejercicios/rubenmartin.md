Ejercicios de Rubén Martín
============================

## Introducción a la infraestructura virtual: concepto y soporte físico

### Ejercicio 1:

El catálogo que he usado para elegir un servidor es de la tienda DYNOS.es  
El servidor escogido ha sido este [HP](http://www.dynos.es/servidor-hp-proliant-ml310e-gen8-xeon-e3-1220v3-3.1ghz-4gb-ddr3-lff-1tb-dvd-rw-array-b120i-887758294864__724160-425.html#mod-descripcion).  
Dicho servidor tiene un coste de 619.00 € con IVA, y 511.57 € sin IVA, que es el precio con el que debemos realizar los cálculos de amortización.  
  
**Amortización a 4 años**  
Deducimos una amortización máxima del 25% cada año:  
511.57 * 0.25 = 127.89 € cada año  
  
**Amortización a 7 años**   
Amortizaremos el precio sin IVA entre los 7 años:
511.57 / 7 = 73.08 € cada año


### Ejercicio 2:   

Para el alojamiento web he elegido hostalia.com con el siguiente servidor dedicado: [https://www.hostalia.com/vps/servidores-vps-avanzado.html](https://www.hostalia.com/vps/servidores-vps-avanzado.html)   

Para el proveedor de servicios en la nube, escogí el t2.small de [Amazon EC2](http://aws.amazon.com/es/ec2/pricing/)  

**Si usamos solo un 1% del tiempo**  
Cálculo en Amazon EC2:   
   Precio del uso del servidor: $0.026/hora = 0.020 €/h -> (0.020€ * 24h * 31 dias) * 1% = 0,1488 €/mes      
   Ahora debemos añadirle el uso de almacenamiento EBS, que se cobra aparte: suponiendo que usáramos como máximo los 50 GB del servidor dedicado, 50 * $0.10 (que es el precio que cobran al mes por GB usado en AmazonEC2) = $5 = 3.987 €/mes  

Precios finales:  
Amazon EC2: 0,15 + 3,99 = 4,14 €/mes -> 4,14 * 12 meses =  49,68 €  
Servidor dedicado: 18,71 €/mes -> 18,71 * 12 meses = 224,52 €
 
 
**Si usamos solo un 10% del tiempo**  
Cálculo en Amazon EC2:  
   Precio del uso del servidor: $0.026/hora = 0.020 €/h -> (0.020€ * 24h * 31 dias) * 10% = 1,488 €/mes      
   Ahora debemos añadirle el uso de almacenamiento EBS, que se cobra aparte: suponiendo que usáramos como máximo los 50 GB del servidor dedicado, 50 * $0.10 (que es el precio que cobran al mes por GB usado en AmazonEC2) = $5 = 3.987 €/mes   

Precios finales:  
Amazon EC2: 1,49 + 3,99 = 5,48 €/mes -> 4,14 * 12 meses =  65.76 €  
Servidor dedicado: 18,71 €/mes -> 18,71 * 12 meses = 224,52 €


