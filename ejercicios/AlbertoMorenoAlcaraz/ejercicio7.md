Ejercicio 7
-----------

**Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.**

Para este ejercicio, vamos a usar rados para almacer objetos y directorios.

Primero hay que crear pool, introduciendo el comando:
```bash
sudo rados mkpool pool
```

Y añadimos el fichero:
```bash
sudo rados put -p pool obj alberto
```

