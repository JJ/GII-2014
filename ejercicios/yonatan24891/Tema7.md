TEMA 7
=========


##Ejercicio 1##

`apt-get install ruby1.9.1 ruby1.9.1-dev rubygems`

`gem install ohai chef`


##Ejercicio 2##

```
.
├── cookbooks
│   ├── vim
│   │   ├── metadata.rb
│   │   └── recipes
│   │       └── default.rb
│   ├── fichero
│   │   ├── metadata.rb
│   │   └── recipes
│   │       └── default.rb
│   └── nginx
│       ├── metadata.rb
│       └── recipes
│           └── default.rb
├── node.json
└── solo.rb
```

En los default.rb de vim y nginx ponemos según el caso:

`package 'nginx/vim'`

En el default.rb del fichero:

```
directory '/home/fichero'
file "/home/fichero/fichero.md" do
owner "yonatan24891"
group "yonatan24891"
mode 00777
action :create
content "Hola, mundo"
end
```
En los metada.rb, cambiando descripción y la ultima línea en cada caso:

```
maintainer              "Jonathan Mulero Lopez"
maintainer_email        "yonatan24891@hotmail.com"
description             "Descripcion"
version                 "0.0.1"

recipe "nginx", "Instala nginx"
```

Solo.rb:

```
cookbook_path File.expand_path("../cookbooks", __FILE__)
json_attribs File.expand_path("../node.json", __FILE__)
```

node.json:

```
{
    "nginx": {
            "version"       : "1.4.4",
            "user"          : "www-data",
            "port"          : "80"
    },

    "vim": {
            "version"       : "7.3.429"
    },

    "fichero": {
            "name"          : "fichero"
    },

    "run_list": [
            "recipe[nginx]",
            "recipe[vim]",
            "recipe[fichero]"
            ]
}
```

Ejecutamos:

`$ sudo chef-solo -c solo.rb`



##Ejercicio 3##

```
- uno: "dos" 
  tres: 
    - 4 
    - 5 
    - "Seis" 
    - 
      - siete: 8 
        nueve: 
          - 10 
          - 11
```

##Ejercicio 4##

Instalamos ansible:

`apt-get install python-pip`
`pip install ansible`

Añadimos el host:

`echo -e "[azure]\nombre_de_la_maquina.cloudapp.net" >> /etc/ansible/hosts`

Desplegamos:

`ansible azure -u yonatan24891 -m git -a "repo=https://github.com/yonatan24891/"GIT" dest="DESTINO"`


##Ejercicio 6##

Instalamos Vagrant:

`apt-get install vagrant`

Descargamos la imagen:

`vagrant box add debian https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box`

Iniciamos y nos conectamos a ella:
```
vagrant init debian
vagrant up
vagrant ssh
```


##Ejercicio 7##

##Ejercicio 8##


Modificamos el fichero Vagrantfile:

```
Vagrant::Config.run do |config| 
  config.vm.box = "debian" 

  config.vm.provision "ansible" do |ansible| 
    ansible.playbook = "playbook.yml" 
    ansible.inventory_path = "hosts"
  end 

  config.vm.box_url = "https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box" 

  config.vm.network :hostonly, "192.168.33.10" 
end
```
Creamos un playbook:

```
- hosts: vagrant 
  sudo: yes 
  tasks: 
    - name: Instalar última versión de nginx 
      apt: name=nginx state=latest 
      notify: 
      - restart nginx 
  handlers: 
    - name: restart nginx 
      service: name=nginx state=restarted 
```

Añadimos el host:

    echo -e "[vagrant]\n192.168.33.10 " >> hosts

De esta forma, ansible se encargará de instalar nginx:

    vagrant provision





























