###Ejercicio5

**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

En primer lugar, configuramos nuestra cuenta de azure en Linux, instalando nodejs y ejecutando las instrucciones siguientes.

![](./img/5.1)

![](./img/5.2)

![](./img/5.3)

Ejecutamos la siguiente orden para ver las imagenes disponibles.

<pre>azure vm image list</pre>

Voy a instalar una imagen de Ubuntu server 14.04, para ver si esta disponible e información sobre ella, tras buscarla en la lista anterior, ejecutamos lo siguiente:

![](./img/5.4)


Y ahora creamos la imagen con la siguiente orden:

<pre>azure vm create ubuntu-mortega87 b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB mario [PASSWORD] --location "West Europe" --ssh</pre>

Ahora vemos la lista de las imagenes:

![](./img/5.5)

Y arrancamos la máquina

![](./img/5.6)

Ahora, desde nuestra terminal, accedemos a ella por ssh:

![](./img/5.7)

Y una vez dentro de ella, instalamos nginx

![](./img/5.8)

Comprobamos que está funcionando:

![](./img/5.9)

Ahora tenemos que habilitar el puerto 80 de la máquina virtual, ya que como podemos ver, solo tiene el 22

![](./img/5.10)


Ejecutamos la siguiente orden para habilitarlo y vemos que ya está disponible:

![](./img/5.11)

Ya tenemos acceso al servidor web

![](./img/5.12)
