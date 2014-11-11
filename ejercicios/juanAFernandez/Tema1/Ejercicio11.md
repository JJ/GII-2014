####Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

La orden **kvm-ok** no podrá ser ejecutada directamente si no tenemos instalado el paquete cpu-checker. Para solucionarlo hacemos **sudo apg-get install cpu-checker**. Después ejecutamos:

```sh
$ kvm-ok
INFO: Your CPU does not support KVM extensions
INFO: For more detailed results, you should run this as root
HINT:   sudo /usr/sbin/kvm-ok
```

Que corrobora lo que veíamos en el anterior ejercicio. Si nuestra CPU soportara este tipo de virtualización tendríamos que ir hasta la BIOS para activarla.