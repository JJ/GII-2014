Ejercicio 6
-----------

**Crear un dispositivo ceph usando BTRFS o XFS**

Primero, instalamos los paquetes que vamos a necesitar:
```bash
sudo apt-get install ceph-mds
```

Despues, creamos los directorios que necesitamos y el fichero de configuración:
```bash
mkdir -p /srv/ceph/{osd,mon,mds}

sudo nano /etc/ceph/ceph.conf
```

En el fichero de configuracion introducimos lo siguiente:
```bash
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = santiago-PC
mon addr = 127.0.0.1:6985
[mds]
[mds.mio]
host = santiago-PC
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = santiago-PC
devs = /dev/loop0
```

Creamos la imagen:
```bash
qemu-img create -f raw img.raw 200M
sudo losetup -v -f img.raw
sudo mkfs.xfs /dev/loop3
```

Despues, creamos el directorio para el sistema de objetos:
```bash
 sudo mkdir /srv/ceph/osd/osd.0
 sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf 
 ```

![t5ej6.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej6.png)

Iniciamos el servicio:
```bash
sudo /etc/init.d/ceph -a start
```

Vemos el resultado:
```bash
sudo ceph -s
```
![t5ej6b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej6b.png)

Finalmente, montamos:
```bash
sudo mkdir /mnt/ceph
sudo mount -t ceph ubuntu:/ /mnt/ceph
```


