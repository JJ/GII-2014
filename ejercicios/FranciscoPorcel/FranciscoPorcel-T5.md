# Tema 5

## Ejercicio 1

#### ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos? 

Las particiones:

![Ejercicio 1_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/1_1.png)

No tengo VLM.

#### Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza? 

No tengo acceso, ya que me es imposible ir a clase porque estoy de prácticas por las mañanas.

#### Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

[Drobo 12-bay SAN storage array](http://www.lambda-tek.com/Drobo-DR-B1200I-1A31~shES/B1173753&viewSpec=y#productTop) - 3256.09€

[Drobo SAN for Business B800i Orden unidad de disco duro - Compartimentos: 8 - 0](https://www.google.es/shopping/product/3474554917818533788?q=san+precios&client=ubuntu&hs=hig&channel=fs&biw=1301&bih=673&bav=on.2,or.r_cp.r_qf.&bvm=bv.85076809,d.d2s&tch=1&ech=1&psi=BT3NVK-BOczlapa5gCg.1422736646441.7&prds=paur:ClkAsKraXxwK0LJrRFIT4-9gjgnaffuOy4Leq-PDkHt1Y99akFrvILE3ydnuwvI1sQ-XtkEG6ib5D0X8_JZxIyoaCfmohqcqYcsYh6Zr2ShrrQLlwkCYgEXxSxIZAFPVH72BfeFrrdAWVZ8b_cAKssVm9Gz-_w&ei=ID3NVKGLNsnyUoS6g-gD&ved=0CGsQpiswAA) - 1.171 €

Como podemos observar, los precios son mucho más elevados que los "locales", pero hay que tener en cuenta que el rendimiento es mucho mayor, y que una máquina convencional es casi imposible que disponga de estas especificaciones.

## Ejercicio 2

#### Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión. 

Comprobamos que no hay una instancia de FUSE:

![Ejercicio 2_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/2_1.png)

A continuación ejecutamos depmod -A:

![Ejercicio 2_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/2_2.png)

Ahora instalamos sshfs:

![Ejercicio 2_3](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/2_3.png)

Ahora podemos entrar a cualquier carpeta realizando:

``` sshfs [usuario remoto]]@[IP remota]]:[carpeta remota a montar] [punto de montaje] ```

## Ejercicio 3

#### Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre

En primer lugar instalamos qemu:

![Ejercicio 3_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/3_1.png)

Creamos la imagen:

![Ejercicio 3_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/3_2.png)

Montamos el mvdk:

![Ejercicio 3_3](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/3_3.png)

![Ejercicio 3_4](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/3_4.png)

## Ejercicio 4

#### Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema

Primero instalamos elementos necesarios:

``` sudo apt-get install btrfs-tools xfsprogs ```

A continuación creamos las imágenes:

![Ejercicio 4_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/4_1.png)

Las ponemos en loop y les damos formato:

![Ejercicio 4_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/4_2.png)

A continuación creamos el punto de montaje y las montamos:

~~~
sudo mkdir mnt/m1
sudo mkdir mnt/m2
sudo mount -t xfs /dev/loop1 /mnt/m1
sudo mount -t xfs /dev/loop2 /mnt/m2
~~~

Compiamos un archivo "pesado":

~~~
sudo time -v cp aplicacionmultimedia /mnt/m1/p1
sudo time -v cp aplicacionmultimedia /mnt/m2/p1
~~~

El primero tiene un system time de 0.8 segundos, y el segundo de 0.47 segundos.

## Ejercicio 5

#### Instalar ceph en tu sistema operativo. 

![Ejercicio 5_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema5/5_1.png)

## Ejercicio 6

#### Crear un dispositivo ceph usando BTRFS o XFS

## Ejercicio 7

#### Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados. 

Con rados lo primero que hacemos es crear un pool:

``` sudo rados mkpool poolprueba ```

Ahora simplemente añadimos un archivo:

``` rados put -p poolprueba obj prueba.md ```

## Ejercicio 8

#### Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente

Tras solicitar la cuenta de prueba, hay que ejecutar:

``` sudo npm install azure-cli -g ```

Después, tenemos que "hacer link" a nuestra cuenta de Azure de la siguiente manera:

``` azure 'account' download ```

Se nos muestra una URL, la abrimos y se nos descarga un fichero. Tenemos que importarlo a nuestra cuenta de Axure con:

``` azure 'account' import 'fichero_descargado' ```

Ya tenemos la cuenta enlazada.

## Ejercicio 10

#### Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.

~~~

#!/usr/local/bin/ruby

require "azure"

azure_blob = Azure::BlobService.new
cont = azure_blob.list_containers()

cont.each do |conte|
  File.open("listablob", "w") do |listablob_|
    listablob_.puts cont.name + " "
    blobs_cont = azure_blob.list_blobs(cont.name)
    blobs_cont.each do |blobs_cont_|
      lista_blobs.puts blobs_cont.name + " "
    end
  end
  text = File.open("lista_blobs", "rb") { |file| file.read }
  blob = azure_blob.create_block_blob(cont.name, "lista_blobs", text)
end

~~~




















