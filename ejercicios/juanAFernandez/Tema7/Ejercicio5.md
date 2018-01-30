####Ejercicio5

######1. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

El despliegue de una apliación como la que los compañeros están realizando para la asignatura de DAI sería seguir la idea del ejercicio anterior (Ejercicio4.md). Tendríamos que construir un playbook que ejecutándose sobre una máquina descargarse el código alojado en github y realizase las instalaciones necesarias en la máquina donde se va a desplegar, como Django, nginx o Apache, Ruby o cualquier cosa que fuera necesaria. Esto podría ser en un o varios playbooks, a su vez estos pueden ejecutar script de bash para poder realizar cualquier configuración que sea necesaria en la máquina. Esto se hace a través de los módulos que dispone el núcleo de ansible y de algunas otras funcionalidades que se pueden ver en su [página](http://www.ansible.com/home). Si se quiere ver el uso de estos playbooks puede ver el proyecto [LDT](https://github.com/freelinuxdistrodeployed/LDT), la sección de [playbooks](https://github.com/freelinuxdistrodeployed/LDT/tree/master/playbooks) en concreto.

Por otra parte también disponen de una galería de playbooks que la gente ha ido confeccionando y colocando a disposición del público en lo que ellos llaman [Ansible Galaxy](https://galaxy.ansible.com/).

######2. ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Personalmente no puedo decantarme por otro que no sea Ansible, ya que ha sido el que he usado en el proyecto de la asignatura. Sin embargo si echamos un vistazo a los proyectos que hacen algo pareceido a Ansible, Chef es mucho más recomendado, usado y documentado que Ansible. Ansible es bastante más fácil de utilizar aunque habría que notar si Chef es más potente que este. Desde luego para comenzar con la orquestación y despliegues automáticos de máquinas Ansible sería la mejor opción, además no requiere de ningún tipo de instalación en las máquinas finales lo que sería otro punto a favor de este.
