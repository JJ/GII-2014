###Ejercicio 1

#####1. ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

Para comprobar de un vistazo es estado lógico de nuestro disco duro podemos usar **fdisk**:

~~~bash
> fdisk -l

Disco /dev/sda: 250.1 GB, 250059350016 bytes
255 cabezas, 63 sectores/pista, 30401 cilindros, 488397168 sectores en total
Unidades = sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico / físico): 512 bytes / 512 bytes
Tamaño E/S (mínimo/óptimo): 512 bytes / 512 bytes
Identificador del disco: 0xdbaefcfd

Dispositivo Inicio    Comienzo      Fin      Bloques  Id  Sistema
/dev/sda1   *        2048      206847      102400    7  HPFS/NTFS/exFAT
/dev/sda2          206848   239460410   119626781+   7  HPFS/NTFS/exFAT
/dev/sda3       239462398   488396799   124467201    5  Extendida
/dev/sda5       484225024   488396799     2085888   82  Linux swap / Solaris
/dev/sda6       239462400   484225023   122381312   83  Linux
~~~

Vemos que el equipo cuenta con un sólo disco de 250GB dividido en 6 particiones lógicas, dos para linux, una extendida y otras dos para un sistemas windows. 


[Fundamentos](https://es.opensuse.org/SDB:Fundamentos_sobre_particiones,_sistemas_de_archivos_y_puntos_de_montaje)
