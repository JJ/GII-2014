###Ejercicio 1###

[Fujitsu Primergy TX300 S8 Formato Torre](http://www.pccomponentes.com/fujitsu_primergy_tx300_s8_formato_torre.html)

Precio total de 899€ (IVA incluido).

Base imponible = 742,98€.

**Amortización en 4 años**

Partiendo de que el ordenador ha sido comprado el 1 de Enero.

El iva lo amortizamos en el primer trimestre, e iremos depreciando el valor con un porcentaje decreciente, ya que al principio es cuando pierde más valor.

Para 4 años, como el coeficiente maximo es de 26%, en equipos para tratamiento de la información y sistemas y programas informáticos, 
elegiremos una amortización de:

1er año: 26%  **193,18€**

2º año:  25%  **185,75€**

3er año: 25%  **185,75€**

4º año:  24%  **178,3€**

**Amortización en 7 años**

Para 7 años, haremos lo mismo que para 4 años:

1er año: 26%  **193,18€**

2º año:  20%  **148,6€**

3er año: 16%  **119€**

4º año:  13%  **96,6€**

5º año:  11%  **81,73€**

6º año:  8%   **59,5€**

7º año:  6%   **44,6€**

###Ejercicio 2###

Como servidor cloud, elegimos el A4 nivel standard de [Microsoft Azure](http://azure.microsoft.com/es-es/pricing/details/virtual-machines/#Linux)

~265,86€/mes * 12 * 0,01=~31,9€
~265,86€/mes * 12 * 0,1=~319€

Como servidor dedicado, elegimos el A8i de [1&1](http://www.1and1.es/server-dedicated-l?linkOrigin=servidores-dedicados&linkId=ct.btn.server-dedicated-l)

Desde 39,99€/mes *12=480€

Como se puede observar, siendo mejor el servidor cloud que ofrece amazon ya que es flexible y casi dobla la ram del servidor dedicado de 1&1, si solo se usa un 1% o 10% del tiempo, sale más barato que el de 1&1, calculo que a partir del 15% ya saldria más baarato el de 1&1 aunque siendo este un poco peor.


###Ejercicio 3###

* [X] ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.

-Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Mi programa simple, ha consistido en hacer el "hola mundo" en python.

Primero le damos permisos de ejecución con `chmod +x holamundo.py`, luego he instalado el CDE en mi version de ubuntu mediante: 
`sudo aptitude install cde`

Para empaquetar utilizamos la órden cde `./holamundo.py`

Por último lo comprimimos con: `tar czvf holamundo.tar.gz cde-package/`

Lo pasamos a otra distribución (por ejemplo a la de una máquina virtual), descomprimimos y ejecutamos el holamundo.py.cde

###Ejercicio 4###

* [X] Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.

Avanzado Instalarlo y crear una aplicación contenedorizada

###Ejercicio 5###

En mi versión de ubuntu lo he instalado con la orden: `sudo aptitude install git`

###Ejercicio 6###

Desde GitHub nos vamos a Repositories->New y marcamos la opción "Initialize this repository with a README" para incluir el readme.

Para descargarlo `git clone https://github.com/yonatan24891/NOMBRE_DEL_REPOSITORIO.git`

Modificamos el readme y para subirlo:

`git add README.md`

`git commit -a -m "COMENTARIO"`

`git push origin master`

###Ejercicio 7###

Está montado en /sys/fs/cgroup y contiene una carpeta, systemd que a su vez contiene los archivos cgroup.
