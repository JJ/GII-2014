Docker
======

![Imagen1](imagenes/docker.png)

Contenedor para correr aplicaciones. Extiende los contenedores LXC de Linux con una API de alto nivel que proporciona una solución de virtualización ligera aislando los procesos.
Docker utiliza LXC, cgroups y el propio kernel de Linux.

A diferencia de las tradicionales máquinas virtuales un contendor Docker no incluye un sistema operativo separado, en lugar de eso depdende de la funcionalidad del sistema operativo proporcionada por la infraestructura subyacente. Docker actua como un motor de contenidos portátiles. Empaqueta las aplicaciones y todas sus dependencias en un contenedor virtual que se ejecutará en cualquier servidor Linux. Esta ayuda proporciona flexibilidad y portabilidad en cualquier aplicación que queramos correr.

Docker consiste en:

 * Demonio Docker, el responsable de manejar los contenedores.
 * Cliente de Linea de Comandos Docker, para controlar el demonio en el servidor.
 * Repositorio de imágenes Docker, el lugar donde buscar y navegar entre las distintas imágenes disponibles. Este se encuentra en https://index.docker.io/


Esto es interesante:

Docker resuelve el problema del envío de código de una máquina a otra. Se trata de hacer que el proceso de envío de software más fiable y automatizado . Contenedores Docker son portables a cualquier sistema operativo que se ejecuta Docker .


###Instalación de Docker en Ubuntu 12.04

backported: Un Backport es la acción de hacer modificaciones o crear un parche a un software con una versión más antigua que la existente