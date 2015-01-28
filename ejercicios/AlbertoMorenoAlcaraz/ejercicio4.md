Ejercicio 4
-----------

**Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema**

Para empezar, creamos dos imagenes con qemu para realizar las pruebas y las ponemos en bucle:
```bash
qemu-img create -f raw img1.raw 50M
qemu-img create -f raw img2.raw 50M

sudo losetup -v -f img1.raw
sudo losetup -v -f img2.raw
```

Despues se les da formato a las imagenes y las montamos:
```bash
sudo mkfs.xfs -f /dev/loop1
sudo mkfs.btrfs -f /dev/loop2

sudo mkdir /mnt/loop1
sudo mkdir /mnt/loop2

sudo mount /dev/loop1 /mnt/loop1
sudo mount /dev/loop2 /mnt/loop2
```

Creamos el fichero:

```bash
sudo dd if=/dev/zero of=/home/ubuntu/40M bs=1MB count=40
```
Despues, copiamos el fichero para ver el tiempo:
```bash
sudo time -v cp 40M /mnt/loop2/40M
sudo time -v cp 40M /mnt/loop3/40M
```

Se puede comprobar que xfs es un poco mas rapido que btrfs.



