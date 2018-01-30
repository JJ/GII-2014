####Ejercicio4

######Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.


Hacer esto con ansible es muy fácil. Sólo tenemos que crear un playbook como este:

~~~bash
---
- hosts: all
sudo: true
tasks:

- name: Comprueba la existencia del repositorio
git: >
repo=https://github.com/juanAFernandez/prueba.git
dest=/srv/checkout
- name: Pull códigos desde GitHub
git: >
repo=https://github.com/juanAFernandez/prueba.git
dest=/home/prueba
~~~

fuente [aquí](https://github.com/freelinuxdistrodeployed/LDT/blob/81fddb329abdc42a4b6891eef4d195f3dcc30aaa/playbooks/git.yml).

La ejecución se hace también de forma muy simple así:
~~~bash
#Realizamos la instalación con un playbook
ansible-playbook /etc/ansible/playbooks/git.yml
~~~

Se puede ver más sobre el uso de Ansible en el proyecto [**LDT**](https://github.com/freelinuxdistrodeployed/LDT).
