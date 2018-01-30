#Ejercicio 1

#####Instala LXC en tu versión de Linux favorita.

La instalación se realiza de forma simple con:

    apt-get install lxc

Después lo que nos queda es comprobar si nuestra máquina es compatible con lxc usando `lxc-checkconfig`:

~~~bash
uname -r
3.11.0-20-generic

lxc-checkconfig
Kernel config /proc/config.gz not found, looking in other places...
Found kernel config file /boot/config-3.11.0-20-generic
--- Namespaces ---
Namespaces: enabled
Utsname namespace: enabled
Ipc namespace: enabled
Pid namespace: enabled
User namespace: missing
Network namespace: enabled
Multiple /dev/pts instances: enabled

--- Control groups ---
Cgroup: enabled
Cgroup clone_children flag: enabled
Cgroup device: enabled
Cgroup sched: enabled
Cgroup cpu account: enabled
Cgroup memory controller: missing
Cgroup cpuset: enabled

--- Misc ---
Veth pair device: enabled
Macvlan: enabled
Vlan: enabled
File capabilities: enabled

Note : Before booting a new kernel, you can check its configuration
usage : CONFIG=/path/to/config /usr/bin/lxc-checkconfig
~~~

Como se ve algunas opciones no estan disponibles como **User namespace: missing** y **Cgroup memory controller: missing**. Esto se debe a la antiguedad del kernel del sistema. Para solucionarlo podemos actualizarlo y hacer algunas modificaciones (hay mucha información en la red al respecto o utilizar otro sistema).

~~~bash
uname -r
3.13.0-36-generic

lxc-checkconfig

--- Namespaces ---
Namespaces: enabled
Utsname namespace: enabled
Ipc namespace: enabled
Pid namespace: enabled
User namespace: enabled
Network namespace: enabled
Multiple /dev/pts instances: enabled

--- Control groups ---
Cgroup: enabled
Cgroup clone_children flag: enabled
Cgroup device: enabled
Cgroup sched: enabled
Cgroup cpu account: enabled
Cgroup memory controller: enabled
Cgroup cpuset: enabled

--- Misc ---
Veth pair device: enabled
Macvlan: enabled
Vlan: enabled
File capabilities: enabled
~~~
Con esto tenemos el problema resuelto.
