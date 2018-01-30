###Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Instalamos el paquete qemu-kvm:

	sudo apt-get install qemu-kvm libvirt-bin

Añadimos nuestro usuario a los grupos de usuarios kvm y libvirt para poder manejar máquinas virtuales:

	sudo adduser USUARIO kvm
	sudo adduser USUARIO libvirtd

