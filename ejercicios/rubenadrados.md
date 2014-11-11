Ejercicios de Rubén Adrados Bretón
==================================

## Tema 1

### Ejercicio 3
1. Varios clientes en un solo servidor: Para este usaría un entorno de virtualización a nivel se sistema operativo, ya que tendría al servidor como anfitrión y a los clientes aislados en los contenedores.

Crear un sistema eficiente de web + middleware + base de datos: un sistema de virtualización plena ya que tiene estructuras de control llamadas hipervisores para controlar los diferentes aspectos de web y base de datos.

Un sistema de prueba de software e integración continua: dado que es un sistema de prueba simplemente debe usarse una virtualización de entornos de desarrollo para así probar las diferentes versiones y por tanto así tenemos cubierta una integración continua.

Creamos un archivo ejecutable que contenga: #!/usr/bin/python print "Hello World"
Y una vez descargado e instalado el paquete CDR ejecutamos el archivo de prueba:
./holamundo.py

### Ejercicio 4
[Pantallazo]

### Ejercicio 5
Para instalar el sistema de gestión de fuentes tenemos que escribir en la linea de ordenes lo siguiente: 
apt-get install -y git

### Ejercicio 6
En mi repositorio hay un proyecto de prueba con el archivo README modificado.

### Ejercicio 7
En mi caso se encuentra situado en:
/sys/fs/cgroups

Contiene diferentes ficheros, tanto de lectura como de escritura.

### Ejercicio 10
Intel(R) Core(TM) i3 CPU M 330 @ 2.13GHz
Tras ejecutar:
$ egrep '^flags.*(vmx|svm)' /proc/cpuinfo

Aparece como que no estan acivos o instalados.

### Ejercicio 11
Ejecutando la orden:
kvm-ok

Muestra que no esta instalado.

## Tema 2

### Ejercicio 1

He optado por la instalacion de la maquina virtual de python dado que tambien trabajamos con este lenguage en la asignatura DAI.

Instalacion:
```sh
sudo apt-get install python-pip
pip install virtualenv
```

Ejecutamos:
```sh
sudo pip virtualenv
```

### Ejercicio 2 y 3

[enlace]:https://ejercicioiv-rubenadrados.rhcloud.com/

Dado que el ejercicio 3 es sobre OpenShift he decidido hacer los dos juntos.

Una vez registrados siguiendo unos sencillos pasos creamos nuestra aplicacion de WordPress.

Podemos ver la pagina en el siguiente [enlace].


### Ejercicio 4

Accedemos a nuestro GoogleDrive. Si queremos crear por primera vez un script tendremos que conectar dicha aplicacion dado que no viene por defecto, una vez conectada aparacera siempre.

He creado un pequeño script para cambiar el nombre de los documentos:

```sh
function myFunction() {
  var files = DriveApp.getFilesByName('Archivo');
  while(files.hasNext()) {
    var fichero = files.next();
    fichero.setName('NuevoArchivo');
  }
}
```

