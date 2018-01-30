#Ejercicio 8

#### Instalar libvirt. TE puede ayudar esta guía para Ubuntu

INstalamos kvm (para ver si podemos ejecutar virsh), y otras librerías y utilidades:

	sudo apt-get install kvm libvirt-bin virtinst

COmprobamos que podemos ejecutar virsh comprobando la salida del comando "kvm-ok", que en este caso devuelve:

	INFO: /dev/kvm exists
	KVM acceleration can be used
Lo que indica que puede ser ejecutado. Para ello, escribimos la orden:

	virshE
