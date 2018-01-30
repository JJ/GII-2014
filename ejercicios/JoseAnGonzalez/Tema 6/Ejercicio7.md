#Ejercicio 7

#### Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Usaremos el hipervisor Xen que ya se encontraba instalado en el equipo. La instalación se realiza mediante las órdenes:

 	sudo apt-get install virtinst xen-hypervisor-4.4-amd64 bridge-utils 
Una vez instalado, para abrir el hipervisor, introducimos:    

	sudo apt-get install virt-manager
    virt-manager lvm2 qemu-system

Al abrirlo por primera vez, es posible que nos pida paquetes adicionales (por alguna razón, no encuentra el paquete qemu-system en mi equipo, cuando ya se ha utilizado en ejercicios anteriores). Seguimos el asistente para instalarlos.

Una vez instalados, pulsamos en el primer icono de la barra de herramientas, y seguimos el asistente para la creación de la máquina virtual con la imagen de LInuxMint (que puede ser cualquier otro SO).

