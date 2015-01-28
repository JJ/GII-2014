Ejercicio 2
-----------

**Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.**

Antes de empezar, necesitamos tener instalado el paquete sshfs.
Para ello, ejecutamos en la maquina virtual ubuntu, el comando:
```bash
sudo apt-get install sshfs
```

Y en la maquina anfitriona fedora, este comando:
```bash
sudo yum install sshfs
```

Una vez instalado, añadimos en la maquina virtual el usuario con el que nos vamos a conectar al grupo de usuarios fuse. En este caso, usaremos el comando:
```bash
sudo usermod -a -G fuse alberto
```

Despues, en la maquina anfitriona, se crea la carpeta que se quiere sincronizar con la maquina virtual, por ejemplo la carpeta iv. 

Una vez creada, pasamos a sincronizarla usando sshfs, introduciendo el siguiente comando:
```bash
sshfs ubuntu@192.168.56.101:/home /home/alberto/Universidad/IV/iv -p 30520
```

En la siguiente captura, podemos ver como se ha creado la carpeta correspondiente:
![t5ej2.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej2.png)