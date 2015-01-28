Ejercicio 3
-----------

**Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre**


Primero, instalamos el paquete qemu, que es el que vamos a utilizar:
```bash
sudo apt-get install qemu-system
```

Ahora, creamos algunas imagenes con distintos formatos, como qcow2 y raw, introduciendo los siguientes comandos:
```bash
# qcow2
qemu-img create -f qcow2 img-cow.qcow2 5M

# raw
qemu-img create -f raw img-raw.raw 5M
```
![t5ej3.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej3.png)

Ahora, ponemos una imagen en bucle y le damos formato, usando los siguiente comandos:
```bash
sudo losetup -v -f img-cow.qcow2
sudo mkfs.ext4 /dev/loop0
```
![t5ej3b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej3b.png)
