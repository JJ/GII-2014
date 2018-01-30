####Ejercicio8

######Configurar tu máquina virtual usando vagrant con el provisionador ansible

De forma muy similar al ejecicio anterior (Ejercicio7.md) lo que debemos de hacer es volver a modificar el fichero Vagrantfile espeficicando que el provisionamiento nos vendrá desde ansible por un playbook, de una forma parecida a esta:

~~~bash
config.vm.provision "ansible" do |ansible|
ansible.playbook = "conf.yml"
~~~


Ahora sólo restaria montar el **conf.yml**:

Podriamos añadir algunos ficheros desde algún lugar:

~~~bash
---
- hosts: all
sudo: true
tasks:
- name: Copiar ficheros a los host
copy: src=../{{fichero}} dest=/home/{{fichero}} owner=root group=root mode=644
~~~

...realizar alguna instalación...

~~~bash
- name: Instalación de atom
apt: pkg=atom state=latest
~~~

o crear algun usuario concreto.

~~~bash
---
- hosts: all
sudo: true
vars:
usuario: 'usuario'
password: '1122334455'
tasks:
- name: Creacion de usuario
command: useradd -m {{ usuario }} creates=/home/{{ usuario }}
sudo: true

- name: Configuracion password
shell: usermod -p $(echo '{{ password }}' | openssl passwd -1 -stdin) {{ usuario }}
sudo: true
~~~

entre todas las cosas que podemos hacer.


Este fichero puede realmente estar presente en el equipo o estar alojado en gitHub o algun contendor de código en la red.
