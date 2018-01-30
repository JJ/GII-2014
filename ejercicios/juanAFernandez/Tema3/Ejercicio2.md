###Ejercicio 2

####Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback

#####1 Mostrar los puentes configurados en el sistema operativo.

Para mostrar los puentes configurados hacemos **brctil show**.

~~~bash
$ brctl show
bridge name	bridge id		STP enabled	interfaces
~~~

Muestra información sobre todos los puentes de red creados. Se ve que no tenemos ningún puente configurado.

#####2 Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.

Creamos la interfaz con **brctl addbr**:

      sudo brctl addbr prueba
      brctl show
      bridge name	bridge id		STP enabled	interfaces
      prueba		8000.000000000000	no

Este brctl addbr crea un puente lógico de red. Cada puente creado se interpretará por el sistema como una nueva intefaz de red.

Podemos obtener más información de la interfaz con **ip addr show **:

    7: prueba: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN
    link/ether 66:3b:e1:87:cc:cd brd ff:ff:ff:ff:ff:ff


Ahora debemos enlazar el puente con una interfaz real, usando **addif**:

    sudo brctl addif prueba wlan0


Enlaces interesantes:

* [Linux Bridge with brctl utilities.](http://www.tldp.org/HOWTO/BRIDGE-STP-HOWTO/set-up-the-bridge.html)
* [strace](http://linux.die.net/man/1/strace)
