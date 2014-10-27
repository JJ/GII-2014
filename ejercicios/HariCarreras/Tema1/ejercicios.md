###Ejercicio 1 ###
He escogido este servidor: http://configure.euro.dell.com/dellstore/config.aspx?oc=pet110ii_solea&model_id=poweredge-t110-2&c=es&l=es&s=bsd&cs=esbsdt1&
Su precio es de 629€ sin IVA.
Si lo comprasemos a principios del año, para amortizarlo en 4 años sería el 25% cada año. 
Por lo que cada año se amortizaría 157,25€
En 7 años se amortizaría un 14,28% al año, lo que equivale a 89,82€ al año.

###Ejercicio 2 ###
Voy a coparar un VPS en [atlantic](https://www.atlantic.net/vps/vps-hosting/) con [amazon EC2](http://aws.amazon.com/es/ec2/pricing/)

En Atlantic podemos tambien pagar por hora, por lo que estmiraremos las dos opciones

Atlantic Small
1GB RAM 1vCPU 40 GB SSD 3TB transfer precio por hora: $0.0273 mes: $19.94

Amazon
1 CPU 2GB RAM precio $0.028 por hora

Usando un 1% del tiempo 
Atlantic precio por mes: $19,94 ó si pagamos por hora: $0,19
Amazon: $0,20

Usando 10% del tiempo
Atlantic precio por mes: $19,94 ó si pagamos por hora: $1,96
Amazon: $2,01

###Ejercicio 3.1###
Comentado en el foro:
alojar varios clientes en un sólo servidor: Virtualización de sistema operativo. De esta forma tenemos la ventaja de que los clientes comparten el SO, haciendo que todo sea mas mantenible. Por otro lado, los clientes están aislados entre si y del servidor, lo que hace que sea más seguro.
crear un sistema eficiente de web + middleware + base de datos: Como lo que se busca es eficiencia, lo mejor sería una virtualización plena. Ya que es la que obtiene mayor rendimiento.
un sistema de prueba de software e integración continua: virtualización de entornos de desarrollo. Ya que reproduce fielmente el entorno de producción.

###Ejercicio 3.2###
He seguido este [tutorial](http://blog.desdelinux.net/como-crear-aplicaciones-portables-de-linux/)
[Resultado](http://s12.postimg.org/9nwngd199/cde.png)
###Ejercicio 4###
![captura](http://s28.postimg.org/67zo81pp9/docker_tutorial.png)


### Ejercicio 5 ###
Inslatado en mi nueva VM ubuntu 14 con:
$sudo apt-get install git

### Ejercicio 6 ###
Primero creo el repositio en github llamado "readme-test"
Lo clono: 
$git clone git@github.com:hcarreras/readme-test.git
Cambio el readme y escribo "Just a test"
lo añado con:
$git add .
Hago un commit:
$git commit -m "Readme changed"
Lo subo:
$git push origin master
[Repo](https://github.com/hcarreras/readme-test)

### Ejercicio 7 ###
Si venía instalado. Dentrod e la carpeta cgroups se encuentra una carpeta llamada "systemd" y dentro de ella hay varios [archivos](http://s14.postimg.org/c9y8zj1i9/cgroup.png)

### Ejercicio 9.1 ###
El mejor ejemplo para limitar recursos es en los sistemas compartidos. Por ejemplo, un Servidor con varios VPs puede limitar recurso según lo que pague el usuario.
Otro ejemplo es un servidor que hacer también de base de datos. Quizás podría ser interesante distribuir los recuros para optimizar el servicio y que no haya cuellos de botella.

### Ejercicio 10 ###
$egrep '^flags.*(vmx|svm)' /proc/cpuinfo
Lo cual quiere decir que mi procesor no tiene esa funcionalidad o está desactivada.

### Ejercicio 11 ###
$sudo apt-get install cpu-checker
$kvm-ok:
INFO: Your CPU does not support KVM extensions
KVM acceleration can NOT be used

###Ejercicio 12###
SaaS o Software as a Service es una modalidad software que ofrece un servicio. Normalmente este software está centralizado. 
A lo que ya han dicho algunos de mis compañeros, puedo añadir que:
Este servicio está normalmente asociado a un servicio web, en el cual los clientes acceden con su navegador y pueden usar su servicio. Sin embargo esto no es siempre así, ya que algunos servicios son APIs que pueden usarse por otros servicios, haciendo así una abstracción de un proceso el cual se usa bajo una petición http. Otras, disponen de un ligero cliente que se conecta con el servicio.
SaaS está creciendo en los últimos años, y cada vez más empresas deciden desarrollar su servicio bajo este modelo, lo cual hace que cada vez tengamos menos aplicaciones de escritorio. 
Una de las ventajas que tiene es la gran disponibilidad desde cualquier lugar.
Un ejemplo de SaaS es LinkeIn
