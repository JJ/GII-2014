###Ejercicio1

**Instalar chef en la máquina virtual que vayamos a usar**

La instalación especificada en los apuntes de la asignatura no está disponible para Ubuntu 14.04 o Linux Mint 17, sistemas operativos en los que he intentado realizar la instalación. Tras buscar por internet, he optado por descargar una versión más antigua de Ubuntu, en este caso al 12.04 de 32 bits e intentar realizarlo de esa manera.

Por tanto ejecutamos en primer lugar:

<pre>sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems</pre>

Y posteriormente, tras instalar curl:


<pre>sudo apt-get install curl</pre>
<pre>curl -L https://www.opscode.com/chef/install.sh | bash</pre>

Tras esto ya tendremos instalado chef.
