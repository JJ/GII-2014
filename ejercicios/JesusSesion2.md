# Sesión 2.

**Ejercicio 1.** Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

En mi caso he elegido un servidor modelo [Fujitsu Primergy RX300 S8 Formato Rack](http://www.pccomponentes.com/fujitsu_primergy_rx300_s8_formato_rack.html "Servidor"). El precio del servidor elegido es de 759€. La amortización se calcula sin IVA por lo tanto tenemos que el precio es de 599.61€

Aplicacion de calculo de amotización lineal:
Para proceder al calculo de la amortización de este equipo para un periodo de 4 años, debemos aplicar el gasto de amortización establecido por la Agencia Tributaria, que en este caso es de un 26%.
Por lo tanto tenemos 599.61 * 0.26 = 155.89€ que es la perdida de valor de nuestro equipo cada año.

Para proceder al calculo de la amortización de este equipo para un periodo de  años, debemos aplicar el gasto de amortización establecido por la Agencia Tributaria, que en este caso es de un 100% / 7 = 14.28% .
Por lo tanto tenemos 599.61 * 14.28 = 85.62



**Ejercicio 2.** Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para la elaboracíon del ejerccio he elegido dos servidores de la pagina 1&1 el [servidor dedicado](http://www.1and1.es/servidores-dedicados?__lf=Order-Tariff&linkId=hd.subnav.servidores-dedicados) y el [servidor cloud](http://www.1and1.es/servidor-cloud-dinamico?__lf=Order-Tariff&linkId=hd.subnav.servidor-cloud-dinamico) tienen unos precios respectivamente de 19.99 €/mes y 218.79 €/mes ambos con unas características similares.

**Servidor dedicado:** 19.99 * 12 = 239.88 €
  Haciendo uso del 1%: 237.48 €
  Haciendo uso del 10%: 215.89 €
  
**Servidor cloud:** 218.79 * 12 = 2618.28 €
   Haciendo uso del 1%: 2592.09 €
   Haciendo uso del 10%: 2356.45 €

**Ejercicio 3.** 

  **1.** ¿Qué tipo de virtualización utilizarias en cada caso?

  **2.** ¿Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.?

**Ejercicio 4.** Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona. Avanzado Instalarlo y crear una aplicación contenedorizada.

Tutorial de docker realizado: [Imagen Docker](https://www.dropbox.com/s/o96730riyqisphq/docker.png?dl=0 "Servidor").

**Ejercicio 5.** Instala el sistema de gestión de fuentes git.

Para instalar git es necesario ejecutar en la terminal el siguiente comando: sudo apt-get install git


**Ejercicio 6.** 

  **1.** Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.
  En mi caso he creado el archivo Ejercicio6_P con su README.md
  
  Para clonar el directorio ejecutamos en la terminal el comando git clone https://github.com/Jesux11/Ejercicio6_P  
  
  Para modificar el archivo ejecutamos el siguiente comando: git commit -m "Modificando el archivo README"
    
  Para guardar los cambios hacemos lo siguiente: git push
  
  [Captura de pantalla ejercicio](https://www.dropbox.com/s/3ascml9ouhgvul7/Ejercicio6.png?dl=0 "Captura").

**Ejercicio 9.** Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? 

¿Qué aparece como salida de esa orden?

Mi procesador es un AMD Turion(tm) II Ultra Dual-Core Mobile M600, Con Con caché 1MB caché. Al ejecutar el comando  cat /cpu/info puedo observar el modelo de mi procesador.

CUando ejecuto este comando egrep '^flags.*(vmx|svm)' /proc/cpuinfo  no me muestra ningún tipo de información.


**Ejercicio 10.** Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Mi nucleo si contiene dicho modulo del kernel.

[Captura de pantalla ejercicio](https://www.dropbox.com/s/7ghximpcmblc877/ejercicio10.png?dl=0 "Captura").

**Ejecicio 11.** Comentar diferentes soluciones de Software as a Service de uso habitual.
