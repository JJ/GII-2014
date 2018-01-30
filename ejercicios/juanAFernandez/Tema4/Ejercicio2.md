#Ejercicio 2

##### Comprobar qué interfaces puente se han creado y explicarlos.

Se ha creado una interfaz de red **lxcbr0**, esto podemos comprobarlo
con `ifconfig` o con `rctl show`.





~~~bash
brctl show
bridge name	bridge id		STP enabled	interfaces
lxcbr0		8000.000000000000	no
~~~

~~~bash
ifconfig
...
...
lxcbr0    Link encap:Ethernet  HWaddr 86:a5:62:7a:fd:7f  
inet addr:10.0.3.1  Bcast:10.0.3.255  Mask:255.255.255.0
inet6 addr: fe80::84a5:62ff:fe7a:fd7f/64 Scope:Link
UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
RX packets:0 errors:0 dropped:0 overruns:0 frame:0
TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:0
RX bytes:0 (0.0 B)  TX bytes:648 (648.0 B)
~~~

Esta interfaz es creada por defecto para que los conetendores puedan tener acceso a la red. Podemos conocer más detalles en la guía de [LXC](https://help.ubuntu.com/lts/serverguide/lxc.html).
