
#Alberto Mesa Navarro
##Introducción a la infraestructura virtual:concepto y soporte físico.
##Ejercicios del Tema 1.

###Ejercicio 1
Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar artículo en Infoautónomos sobre el tema.

Para nuestro ejercicio utilizaremos como ejemplo un servidor [Dell PowerEdge T110 II](http://ecomm.euro.dell.com/dellstore/basket.aspx?c=es&cs=esbsdt1&l=es&s=bsd&itemtype=CFG&oid=84adbb5e-09cf-45a4-b2cc-e2d3d0d09492). 
En lugar de ceñirme a la configuración básica he seleccionado los componentes que más me interesaban y finalmente la configuración que se ha elegido ha sido:

Intel® Xeon® E3-1270v2, 4C/8T, 3.50GHz, 8M Cache, 69W, Turbo. <br />
16GB RAM (2x8GB) 1600Mhz, Bajo voltaje UDIMM. <br />
Red Hat Enterprise Linux 6.5, (1 año SnS y 1 invitado virtual). <br />
Tarjeta controladora software interna PERC S300 3Gb/s SAS/SATA. <br />
1.2TB 10K RPM SAS 6Gbps 2.5in -No hot swap-. <br />
Controladora de gestión embebida en placa base. <br />
Tarjeta de Red Intel Gigabit ET Dual Port Server Adapter, Cu, PCIe-4. <br /> <br />

Precio total del servidor elegido y configurado según mis intereses: 2.310,00 €. <br />
Para trabajar con las amortizaciones primero hay que obtener el precio del servidor SIN IVA (21%): 2.310 - 485,1 = 1.824,9 €. <br /><br />

Amortización a 4 años:desde Oct. 2014 a Oct. 2018.<br />
Para amortizarlo a 4 años, cada 12 meses hay que amortizar un 25% de los 1.824,9 €.<br />
Sabemos que un año completo supone un 25% de la base imponible, pero hay que tener en cuenta que a este año le quedan sólo 3 meses. Por tanto, realizando los cálculos:<br /> <br />

Desde 1 Octubre 2.014 a 31 Diciembre 2.014 = 3 meses = 6.25%: 114,06 €.<br />
Desde 1 Enero 2.015 a 31 Diciembre 2.015 = 25%: 456,225 €.<br />
Desde 1 Enero 2.016 a 31 Diciembre 2.016 = 25%: 456,225 €.<br />
Desde 1 Enero 2.017 a 31 Diciembre 2.017 = 25%: 456,225 €.<br />
Desde 1 Enero 2.018 a 30 Sept. 2.018 = 9 meses = 18.75%. (junto a los 3 meses de 2.014 completan el 4º año): 342,17 €.<br /> <br />


Amortización a 7 años:<br />
Para amortizarlo a 7 años, cada 12 meses hay que amortizar un 14,29% de los 1.824,9 €.<br /><br />

Desde 1 Octubre 2.014 a 31 Diciembre 2.014 = 3 meses = 3,5725%: 65,195 €. <br />
Desde 1 Enero 2.015 a 31 Diciembre 2.015 = 14,29%: 260,778 €.<br />
Desde 1 Enero 2.016 a 31 Diciembre 2.016 = 14,29%: 260,778 €.<br />
Desde 1 Enero 2.017 a 31 Diciembre 2.017 = 14,29%: 260,778 €.<br />
Desde 1 Enero 2.018 a 31 Diciembre 2.018 = 14,29%: 260,778 €.<br />
Desde 1 Enero 2.019 a 31 Diciembre 2.019 = 14,29%: 260,778 €.<br />
Desde 1 Enero 2.020 a 31 Diciembre 2.020 = 14,29%: 260,778 €.<br />
Desde 1 Enero 2.021 a 30 Sept. 2.021 = 9 meses = 10,7175%. (junto a los 3 meses de 2.014 completan el 7º año):  195,58€.

###Ejercicio 2
Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Máquina en Ninefold:<br />
16.0 GB RAM / 8 VCPUs	16 GB RAM	1000 GB HDD	8 vCPU	~ 19.2 ECU	445,42 euros/año -> 0,05155 euros/hora.<br />

Máquina en Dimension Data:<br />
16 GB RAM / 8 VCPUs 	16 GB RAM	1000 GB HDD	8 vCPU	~ 16 ECU	524,69 euros/año -> 0,06072 euros/hora.<br />

Coste anual al 1% de uso:<br />
1 año = 8760 horas. 1% de uso = 87,6 horas.<br />
Ninefold: 0,05155 euros/hora * 87,6 horas = 4,51578 euros.<br />
Dimension Data: 0,06072 euros/hora. * 87,6 horas = 5,319072 euros.<br />

Coste anual al 10% de uso:<br />
1 año = 8760 horas. 10% de uso = 876 horas.<br />
Ninefold: 0,05155 euros/hora * 876 horas = 45,1578 euros.<br />
Dimension Data: 0,06072 euros/hora. * 876 horas = 53,19072 euros.<br />


###Ejercicio 3
3.1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.

### RECORDATORIO: Poner comentarios en el foro. ###

3.2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Para este ejercicio he decidido utilizar un sencillo [Tutorial Perl](http://linuxconfig.org/perl-programming-tutorial). Además se utilizan los siguientes [Pasos para el uso de CDE](http://www.taringa.net/posts/linux/14889225/CDE-herramienta-para-crear-aplicaciones-portables-de-Linux.html) pero adaptado a mi propio script en Perl.

Vamos a seguir sus pasos para la creación de un programa sencillo y la preparación de CDE:

![1](http://s27.postimg.org/eo51afalf/Captur_Files_2.png) .

A continuación utilizamos CDE para el empaquetado:

![2](http://s28.postimg.org/ykohtm6kd/Captur_Files_1.png) .

Y por último lo pruebo en la otra máquina para asegurarnos de que funciona, como demuestra la captura. Hay que tener en cuenta que debemos copiar a la nueva máquina el directorio cde-package para que el portable funcione.

![3](http://s18.postimg.org/ou7r4cd21/Captura_de_pantalla.jpg) .


###Ejercicio 4
Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.

Se han seguido los pasos del tutorial y se ha completado la tarea correctamente:

![4](http://s29.postimg.org/cfsgj31x3/Tutorial_Docker.png) .


Avanzado: Instalarlo y crear una aplicación contenedorizada.

###Ejercicio 5
Instala el sistema de gestión de fuentes git.

![5](http://s27.postimg.org/ih0axolar/Captur_Files.png) .


###Ejercicio 6
1. Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README. <br />
2. Modificar el readme y subir el fichero modificado. <br />

Para este ejercicio se ha utilizado un proyecto creado para la realización de la práctica. Los pasos que se han seguido se ilustran a continuación:

![6](http://s3.postimg.org/mfouvrrbn/Captur_Files.png)

Al modificar ejecutaremos git commit -m "modificado", y finalmente lo subimos:

![7](http://s15.postimg.org/aldx08wiz/Captur_Files_1.png)


###Ejercicio 7
1. Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado. <br />
2. Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.


###Ejercicio 8
1. Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU. <br />
2. Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).
3. Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).
4. Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.


###Ejercicio 9
Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Para comprobar si está activada (disponible) la virtualización a nivel de hardware deberemos ejecutar el siguiente comando: <br />
egrep '^flags.*(vmx|svm)' /proc/cpuinfo, y vemos su salida en la siguiente captura. El comando muestra las líneas con la expresión que le pasamos (que es la que nos interesa hallar); al mostrar todo el listado de flags comprobamos que la funcionalidad existe y está activada, como vemos en la captura a continuación:

![8](http://s29.postimg.org/scckvd4s7/Captur_Files.png)

Respecto al modelo de procesador, podemos consultar /proc/cpuinfo:

![9](http://s18.postimg.org/x1obovell/Captur_Files_1.png)

En este caso sólo he recogido en la captura la información respecto al procesador 0, ya que no es necesario incluir información no relevante y de por sí es suficientemente aclaratorio.

###Ejercicio 10
Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Vamos a comprobar que el núcleo KVM esté instalado. Usaremos el comando kvm-ok (necesitaremos instalar cpu-checker si no lo tenemos instalado):

![10](http://s30.postimg.org/65ftqvb9d/Captur_Files.png)

Vemos que, efectivamente, existe y la aceleración se puede usar.

###Ejercicio 11
Comentar diferentes soluciones de Software as a Service de uso habitual.

Vamos a comentar 3 ejemplos de soluciones SaaS comunes. Si queremos más información podemos consultar este útil enlace con los [20 principales proveedores](http://www.clouds360.com/saas.php)

1.  Oracle on Demand. Permite a los usuarios flexibilidad al desplegar su software CRM, basándose en las necesidades específicas y las restricciones de presupuesto. <br />

2. Cloud9 Analytics. Herramienta para la gestión de ventas, volúmenes y comportamientos de parámetros económicos como salarios y tasas e informes de ventas. Todo ello con visibilidad en tiempo real. <br />

3. Intacct. Pone al alcance de los usuarios un sistema de cuentas SaaS ligado a Salesforce.com. Consigue que las finanzas sean más productivas y gestiona parámetros como facturación, pedidos, contabilidad y ofrece software de informes financieros. <br />
