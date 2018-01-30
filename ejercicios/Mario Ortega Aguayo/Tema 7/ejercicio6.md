###Ejercicio6

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

En primer lugar, desgamos Vagrant y lo instalamos.

<pre>sudo apt-get install vagrant</pre>

Y la instalamos de la siguiente forma:

![](./img/6.2)

Ahora creamos un fichero Vagrant, mediante la siguiente orden

<pre>vagrant init debian</pre>

Ejecutamos y conectamos mediante estos dos comandos:

<pre>vagrant up</pre>
<pre>vagrant ssh</pre>
