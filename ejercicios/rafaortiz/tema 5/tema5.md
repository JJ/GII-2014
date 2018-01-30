## Virtualizacion de almacenamiento
# Ejercicio 1
# ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?
	1 particion primaria con un sistema operativo windows
	1 particion primaria con un sistema operativo linux (ubuntu)
	1 particion extendida con datos y archivos
	Ademas hay 2 particiones mas que son la de system o el arranque de windows y el swap de linux, system es primaria y el swap extendida
![Imgur](http://i.imgur.com/33o78OX.png)
# Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?
Creo que los ordenadores de la escuela usan un sistema de discos accesibles desde la red, SAN.
# Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.
	Es mas barato usar un disco duro particionado en un equipo, que un sistema de almacenamiento en red, pero SAN proporciona acceso a los datos de los servidores desde cualquier equipo de la red local.
# Ejercicio 2
# Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.
