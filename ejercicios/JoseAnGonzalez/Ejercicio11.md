#Ejercicio 11

#### Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

No podemos ejecutar la orden kvm-ok sin tener antes el programa cpu-checker instalado. Para ello:

	sudo apt-get install cpu-checker

Y una vez instalado, ejecutamos kvm-ok:

	joseantonio@joseantonio-Aspire-5820TG:~$ kvm-ok 
	INFO: /dev/kvm exists
	KVM acceleration can be used