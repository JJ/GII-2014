Ejercicio 8
-----------

**Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente.**

Una vez tenemos una cuenta de Azure, en mi caso, una cuenta creada para el proyecto Virtual Vulcano, seguimos la [documentación](http://azure.microsoft.com/en-us/documentation/articles/xplat-cli/) de la pagina oficial de Azure.

Primero, instalamos azure-cli con npm:

```bash
sudo npm install azure-cli -g
```

Descargamos el fichero de configuracion de la cuenta con el siguiente comando:
```bash
azure account download
```

Una vez descargado, usamos este fichero para importar la configuracion
```bash
azure account import "fichero"
```

![t5ej8.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej8.png)