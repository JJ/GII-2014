####Ejercicio 1

######Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.


Antes de nada como bien se dice en la [guía](https://help.ubuntu.com/community/KVM/Installation) de instalación de KVM de la documentación de [Ubuntu](https://help.ubuntu.com/community/) debemos comprobar que nuestro procesador soporta la virtualización hardware para ejecutar KVM. Para eso ejecutamos ` egrep -c '(vmx|svm)' /proc/cpuinfo` y si el resultado es 0 nuestra CPU no lo soporta.
Por desgracia ni el *Intel(R) Core(TM)2 Duo CPU T5450 * de este equipo ni el *AMD [Opteron(tm)](http://en.wikipedia.org/wiki/List_of_AMD_Opteron_microprocessors) Processor 4171 HE* que ejecuta la máquina virtual que nos ofrece Azure nos permite virtualizar a nivel de hardware.

Otra forma de comprobarlo es con la orden `kvm-ok`, que se instala si no se tiene con `apt-get install cpu-checker`:


~~~bash
> kvm-ok
INFO: Your CPU does not support KVM extensions
INFO: For more detailed results, you should run this as root
HINT:   sudo /usr/sbin/kvm-ok
~~~


Como "en nuestro caso" no podemos virtualizar vamos a intentar paravirtualizar con [Xen](http://es.wikipedia.org/wiki/Xen).

Si hacemos la comprobación que Xen recomienda `grep 'vmx' /proc/cpuinfo` tampoco nos dará ningún resultado, porque no podemos hacer la virtualización completa en este equipo.



* [doc A](https://xen-orchestra.com/blog/cant-find-hypervisor-information-in-sysfs/)

* [doc B](http://tuxjm.net/docs/Administracion_de_Servidores_Virtuales_con_Xen_y_GNU_Linux/html-multiples/creacion-de-maquinas-virtuales-guest-en-xen.html)
