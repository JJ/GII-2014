###Ejercicio6
**Crear un dispositivo ceph usando BTRFS o XFS**

En primer lugar, creamos los dispositivos donde se va a almacenar la información:

![](./img/6.1)

Configuramos ceph creando un fichero de configuración como el siguiente:

![](./img/6.2)

![](./img/6.3)

Creamos el directorio.

<pre>sudo mkdir /srv/ceph/osd/osd.0</pre>

Y asi podemos crear el sistema de ficheros de objetos.

![](./img/6.4)

Por último, iniciamos el servicio con la orden:

<pre>sudo /etc/init.d/ceph -a start</pre>
