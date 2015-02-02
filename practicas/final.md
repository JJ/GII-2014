#Entrega del proyecto de la asignatura.

###Transparente-Servidor-UGR. Entrega de Práctica final.

- Enlace al **repositorio**: [repo de Github](https://github.com/TransparenciaUGR/Proyecto-IV).
- Enlace a la aplicación desplegada en **IAAS**: [Transparente en Azure](http://ugrtransparente.cloudapp.net:3000/).
- Enlace a la aplicación desplegada en Heroku: [Transparente en Heroku](https://transparente-ugr.herokuapp.com/).
- Build automatizado para despliegue local descargable desde [Docker](https://registry.hub.docker.com/u/am83/proyecto-iv/).
- Para detalles, instrucciones de uso, capturas y más info, ver el fichero **README**: [README.md](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/README.md).
- Publicado bajo **Licencia GNU**: [Licencia GNU](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/LICENSE).


-----------------------------------------------------------------------------------------------------------------------------

####Alberto Mesa Navarro
@AM83

**Ha hecho estos scripts de aprovisionamiento (enlace a los commits):**

- Script para Ansible: [transparente.yml](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/Ansible/transparente.yml) .  [Enlace commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/f5341b490994d38f73520e639472c54963575092).

- Script básico para Vagrant, por si el usuario quisiera utilizar Vagrant: [Vagrantfile](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/vagrant/vagrantfile). [Enlace commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/c0a1a5f4423d2737b97e74c8565f04051a4eecb3).


**Ha participado en estos tests (o issues):**

- Test timeout: [test.js](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/scenarios/timeoutOption/test.js).

- [Gruntfile.js](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/scenarios/timeoutOption/Gruntfile.js). 

- [grunt-mocha-test.js](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/tasks/grunt-mocha-test.js). <br /><br />
[Enlace commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/6072118145501ada751f2ec426862177fac9e488#diff-b9221b9eb6cfaa61362b4c4c6eaea53d).

- Issues y test (resolución de problemas e intentos de mejora) relativos al uso de vnc, xvfb (falso display) y posibles configuraciones de GUI ligeras como Minimal Gnome Core para la plataforma. <br />
[Commit principal](https://github.com/TransparenciaUGR/Proyecto-IV/commit/6702d317bf95e08908162649a5dd194162576102) y algunos otros como por ejemplo: [Enlace commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/9a404bc103cfb8028851c24e3a6e960eb4c815c3) , [Enlace a commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/8b79650503cce67cd39a876bbc3b9791b5dc3d35) , [Enlace a commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/2055633d5d8d5593f4991492855bf3c3d19491c6) .

- Adición de extensibilidad postgresql-server-dev-X.Y para extensión server-side y libpq-dev para aplicación client-side. Son detalles importantes ya que con ello se facilita la extensibilidad deseable de este tipo de proyectos.<br />
[Enlace commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/9d71758177735a3bb98807dfad735f6ed7a3bace) . 

- Puesta en marcha del servidor y funcionamiento consistente mediante solución de ejecución permanente del servidor y en segundo plano con multiplexor de terminales [tmux](http://tmux.sourceforge.net/). [Enlace a ejemplo](https://camo.githubusercontent.com/8b047ad7945797b7e9b1579b05bb329bb9717117/687474703a2f2f73392e706f7374696d672e6f72672f6d79357078396934662f417a7572655f576f726b696e672e706e67). 

- Pruebas de instalación y configuración de herramientas que luego implementé en los scripts de despliegue automático correspondientes. Pruebas, pruebas y más pruebas antes de integrar a la repo y de las que no hay commits.	

**Ha participado en esta integración continua y PaaS:**

- Realizado el despliegue integral en el PAAS Azure. Creación, configuración y despliegue de la máquina en Azure, apertura de extremos, ejecución permanente de servidor, pruebas y puesta en marcha del servicio hasta lograr que esté disponible. [Puede accederse desde su enlace en Azure](http://ugrtransparente.cloudapp.net:3000/) . Más info en el [README.md](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/README.md).

- Integración en tiempo real y de manera totalmente automatizada a nuestra abstracción en Docker a través de la simbiosis Github - Docker para despliegues automáticos actualizados. Hacer el pull de am83/Proyecto-IV:latest .

- Aportaciones y modificaciones del fichero [shippable.yml](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/shippable.yml) . Ejemplo de [Enlace a commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/bc4ae48f6fa88858558b336a91f0729d5c050521).


**Ha participado en esta configuración de despliegue automático** 
(Trabajamos en Azure pero es válido para cualquier otra plataforma como servicio).

- Estudio, instalación, uso y configuración de herramientas Azure, Vagrant y Ansible.

- Script inicial para despliegue mediante scriptado seguro y paso de argumentos y ejecutables a la máquina Azure (o cualquier otra): [levantaAzure](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/scripts/levantaAzure).

- Script de despliegue automático mediante scriptado seguro en Azure (o cualquier otro PAAS): [maquinaNube](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/scripts/maquinaNube)

-**Nota**: los scripts de aprovisionamiento, como parte de la automatización, están en su sección correspondiente y por eso no se han incluido en este punto. 

- Automatización de despliegue con 1 solo comando desde Docker, listo para ejecutar y desplegar el servidor de forma totalmente automática: script [IniciarDespliegue](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/IniciarDespliegue) y [Dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/Dockerfile). <br />

[Enlace a commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/e2288c48441a93092aaf7c4185202d4e96d16072#diff-c93bf64f0da08a198dce8900728ec5d0) y [Enlace a commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/098e044944775c7f295a4c65a46c801f389a1ddb#diff-c93bf64f0da08a198dce8900728ec5d0) , por ejemplo.

- Entre otras, scripts para "recoger la casa" de despligues locales: [EliminarImagenes](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/scripts/EliminarImagenes), [EliminarContainers](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/scripts/EliminarContainers). <br /> <br />
[Enlace a commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/1d50febffa012ab3891e617ac2baf05527f326ce#diff-70bf79e207171206e221dd1e0209112f) .

-----------------------------------------------------------------------------------------------------------------------------


####Marcos Jiménez Fernández
@MarcosJF

Ha participado en lo siguiente:

- Detección de errores en el archivo infoEco.jade, localizado [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/views/infoEco.jade) El commit se puede ver [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/commit/5dc47f890e95b41d8f05b62154437f629d69c7d3).

- Actualización del fichero [shippable.yml](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/shippable.yml) con la opción para poder hacer test con grunt. Se puede ver el commit [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/commit/a45064c87dc47462362360c1886a788abb5cacaa).

- Creación del fichero mocha-test.js para realizar tests con mocha. El fichero se puede consultar [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/blob/a855a81a116f903cbb85d2d0d3768facce907ffa/tasks/mocha-test.js) y el commit correspondiente [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/commit/a855a81a116f903cbb85d2d0d3768facce907ffa).

- Creación del fichero test.js en el test de conexionFallida. El fichero puede consultarse [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/scenarios/conexionFallida/test.js). El commit correspondiente se puede consultar pinchando [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/commit/2c2c0188634ace12f874e4cb0a32056750272996).

- Creación del fichero Gruntfile.js para el test de conexionFallida. El fichero puede consultarse [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/scenarios/conexionFallida/Gruntfile.js). El commit correspondiente se consulta pinchando [aquí](https://github.com/TransparenciaUGR/Proyecto-IV/commit/aac101b0418cd52cb1be5be9375f228672f41dde).

-------------------------------------------------------------------------------------------------------------------------------------

####Jose Carlos Sánchez Hurtado
@josecsh

Ha participado en lo siguiente:

- Modificaciones y actualizaciones del fichero [Dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/Dockerfile) cuyos commits se puede ver en la siguiente lista:

	* [Update Dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/commit/bea47f8b184d2f82467de23b77c2a5a9ae11ec77)
	* [Update Dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/commit/cc6b9a8be2cc1109294e064a0321acda266ae1e1)
	* [Reparando Dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/commit/907eb27c14b5119f4e84c83da70c10193967a645)
	* [Update Dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/commit/9a0e53d5eab4ee6a222a3aed064e75741e0a75a5)
	* [Arreglando dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/commit/9b960bcd4c41579057f865c7a25e150064cbd04b)
	* [Mejorando instalación global](https://github.com/TransparenciaUGR/Proyecto-IV/commit/2cab25a2c963431b3d7e1dbab95004c472d858e4)

- Creación de la carpeta [tests](https://github.com/TransparenciaUGR/Proyecto-IV/tree/master/test/scenarios/tests), para la creación de dos test unitarios. 

- Dentro de dicha carpeta **tests** realizo la creación del fichero [Gruntfile.js](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/scenarios/tests/Gruntfile.js) usado para dos de los test creados, cuyo commit es: [Creando gruntfile de los test](https://github.com/TransparenciaUGR/Proyecto-IV/commit/59fea8c2415397c249329ac7f64db4429c2da229), y la creación de los dos test correspondientes, [test1.js](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/scenarios/tests/test1.js) y [test2.js](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/test/scenarios/tests/test2.js), y cuyo commit es: [Creando test](https://github.com/TransparenciaUGR/Proyecto-IV/commit/027ad149fbdc27ad02854fe3f56ec73c1d882680).

- Aportación en el fichero [shippable.yml](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/shippable.yml), cuyo commit es: [Modificado shippable](https://github.com/TransparenciaUGR/Proyecto-IV/commit/f09af1ae1c41d419055e54df34ca08e78ef0be0d).

Aportaciones y pruebas sobre el fichero [package.json](https://github.com/TransparenciaUGR/Proyecto-IV/commit/5c14e7bbef7c6a7df94d408b255e87728143e74a), cuyos commit son: [Introducida nueva dependencia](https://github.com/TransparenciaUGR/Proyecto-IV/commit/2b3eb5a1fd1c18e1cacdb0c852aec05e8e6c04aa) y [Mejorado package.json](https://github.com/TransparenciaUGR/Proyecto-IV/commit/5c14e7bbef7c6a7df94d408b255e87728143e74a).


---------------------------------------------------------------------------------------------------------------------------------

####Jesús Navarro Guzmán
@Jesux11

Ha participado en lo siguiente: 

- Script de configuración shippable.yml [Archivo shippable.ylml](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/shippable.yml)[commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/77b4af89ba4b01ae8d55ccd7c93e846e88cfbbb9) este script es usado para configurar shippable mediante shippable podemos detectar si se producen errores al modificar determinados módulos críticos de la aplicación.

- Contribución activa en la elboración del [Archivo package.json](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/package.json) [commit](https://github.com/TransparenciaUGR/Proyecto-IV/commits/master/package.json?author=Jesux11)

- Contribución en la detección de errores del archivo [Archivo npm-debug.log](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/npm-debug.log) [commit](https://github.com/TransparenciaUGR/Proyecto-IV/commits/master/npm-debug.log?author=Jesux11)

- Contribución en el archivo [DockerFile] (https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/Dockerfile) [commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/1664fb4a00661cd603142f3bbb1a1f8fb5f4c117)

- Elaboración de test haciendo uso de mocha [test con mocha](https://github.com/TransparenciaUGR/Proyecto-IV/tree/master/tasks) [commit]()

- Elaboración del script [lanzarTransparenteHeroku](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/scripts/lanzarTranparenteHeroku.sh) el objetivo de este script es subir la aplicación desarrollada en este caso Transparente - ugr al PaaS Heroku para poder probarla y determinar cual ha sido el resultado final. [commit](https://github.com/TransparenciaUGR/Proyecto-IV/commit/cc9bd1c99d0589531a6fc9eb8b92d54c94540709)

- Elaboración del script [scriptJaulaUbuntu.sh](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/scripts/scriptJaulaUbuntu.sh) mediante este script creamos una jaula en la cual vamos a ejecutar ubuntu, al instalar todas las herramientas necesaria podemos realizas pruebas sobre nuestra aplicación sin la necesidad de tener que realizar pruebas en un sistema completo. [commit](https://github.com/TransparenciaUGR/Proyecto-IV/commits/master/scripts/scriptJaulaUbuntu.sh?author=Jesux11)

- Elaboración de un mini tutorial sobre como registrarse en Amazon Web service y configuración de una máquina en la nuebe para desplejar una aplicación. [commit](https://github.com/TransparenciaUGR/Proyecto-IV/commits/master/README.md?author=Jesux11)

- Script para desplejar desplegar una aplicación en Amazon Web Services, script [ScriptAmazon](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/scripts/servicioAmazonEc2.sh) el script no funciona completamente ya que para poder conectarse a amazon se necesita un archivo de identificacion suministrado por Amzaon archivo.pem de todas formas se detalla paso a paso las pautas a seguir para conseguir desplejar una apliación en una máquina de amazon EC2. 

- Estudio llevado a cabo sobre shippable, uso y configuración:[commit](https://github.com/TransparenciaUGR/Proyecto-IV/commits/master/README.md?author=Jesux11)


---------------------------------------------------------------------------------------------------------------------------------

####Francisco Toranzo Santiago
@toranzo

Ha participado en lo siguiente: 

- Modificación del archivo package.json:

    * [Completa reestructuración y creación]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/b343b08212872228037a22dcfdaa0ddcdf977c89)

    * [Introducir dependencias con Grunt]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/43c87b8bab95310c1e2c29ba29ae27600e7e8215)

    * [Introducir dependencias con Mocha]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/449536ca8c080699e8b9b15a9aa7dbe9f9e9cead)

- Modificación del archivo Dockerfile:

    * [Arreglo de Dockerfile]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/84d0d37ad1b763a7de82850f6d126abe9cdf1f22)

    * [Modificación comandos grunt]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/450ae36d4fa896ea344ba5597921be22c47372bf)

- Creación de test unitarios:

    * [Creación de fichero grunt-mocha-test.js]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/467603017d008178a4bff3041e8f002a47b96b01)

    * [Creación el fichero test.js del TestFailure]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/460bd70d4401b41693e94f41124d006f0d1c6f92)

    * [Creación del fichero Gruntfile.js del TestFailure]( https://github.com/TransparenciaUGR/Proyecto-IV/commit/accbe816324b4b149dff184f065e5a659d49b256)


---

###[Sistema de Distribución Remota de Software](https://github.com/freeLinuxDistroDeployed)
###[LDT Linux Deployed Tool](http://freelinuxdistrodeployed.github.io/freelinuxdistrodeployed/)

Integrantes:

* Jose Antonio Gonzalez Cervera @Ja-Gonz
* Juan Antonio Moraleda Ocon @juanantc
* Juan Antonio Fernández Sánchez @juanAFernandez
* Mario Ortega Aguayo @mortega87
* Ruben Adrados Breton @rubenadrados


[Web del proyecto, blog de desarrollo, documentación, **instalación** y **testing**.](http://freelinuxdistrodeployed.github.io/freelinuxdistrodeployed/) 

Detalles del **Hito4** en issue [#26](https://github.com/freelinuxdistrodeployed/LDT/issues/26)


-----------------------------------------------------------------------------------------------------------------------------

###[Gestion de Empresa Deportiva - GED](https://github.com/felixparra/ProyectoIV)
+ Repositorio del proyecto: [Github](https://github.com/felixparra/ProyectoIV)
+ Aplicación desplegada en:
	+ Enlace en Openshift: [Openshift](http://ged-parra.rhcloud.com/)
	+ Enlace en Koding:  [Koding](http://felixparra.koding.io:8080/)
+ Despliegue a través de openshift: [Despliegue openshift](https://github.com/felixparra/ProyectoIV#openshift)
+ Despliegue a través de docker: [Despliegue docker](https://github.com/felixparra/ProyectoIV#openshift)
+ Despliegue a través de koding: [Despliegue koding](https://github.com/felixparra/ProyectoIV#que-es-2)
+ Automated buil repository de docker: [Docker hub](https://registry.hub.docker.com/u/felixparra/ged/)
+ Test e integración continua: [Shippable](https://github.com/felixparra/ProyectoIV#test-unitarios-e-integraci%C3%B3n-continua)
+ Licencia: [GNU v.3](https://github.com/felixparra/ProyectoIV/blob/master/LICENSE.md)
+ Descripción detallada del proyecto: [README](https://github.com/felixparra/ProyectoIV/blob/master/README.md)

###### Autor: Félix Parra Martínez @felixparra

-----------------------------------------------------------------------------------------------------------------------------



# [Repositorio para backend de mensajería de Si2.info](https://github.com/iblancasa/BackendSI2-IV)

Participantes:

+ Israel Blancas Álvarez @iblancasa
+ José Cristóbal López Zafra @JCristobal 
+ Pablo Casado Arenas @ramako 

[Aplicación funcionando en OpenShift](http://backendsi2-iblancasa.rhcloud.com/)
[Aplicación funcionando en Azure](http://backendsi2.cloudapp.net:8080/)


### Israel Blancas Álvarez, (@iblancasa)

* **Ha participado en estos scripts de provisionamiento:**
Issues
[Despliegue utilizando Ansible o similares](https://github.com/iblancasa/BackendSI2-IV/issues/84)
Commits
[Modificando playbook y preparando para provisionamiento](https://github.com/iblancasa/BackendSI2-IV/commit/656104a5f4e11e08ff0e6daedb5a3bd48967192d)
[Creación de ansible_host](https://github.com/iblancasa/BackendSI2-IV/commit/fe04c45b73ce0bdc355e4e2f657249906160741f)
[Arreglando problemas para iniciar servicio](https://github.com/iblancasa/BackendSI2-IV/commit/db32f8a4d1eff82ae0a157c61d242cd3fbd80c5d)
[Cambiando la forma de instalar dependencias de NodeJS y haciendo asíncrono el arranque de servicio](https://github.com/iblancasa/BackendSI2-IV/commit/4afa4631b1dd5cc2adaad7961a021e7e3bddd200)
[Acabando documentación sobre provisionamiento](https://github.com/iblancasa/BackendSI2-IV/commit/c1c1366807962b8b83552cd0ae2d6998cada0c28)

* **Ha participado en los tests con:**
Issues
[Crear nuevos test y documentarlos](https://github.com/iblancasa/BackendSI2-IV/issues/80)
Commits
[Primera hilera de test](https://github.com/iblancasa/BackendSI2-IV/commit/c26c84769a9286560794015979ebd56b066baa61) (algunos de estos test se usaban para la aplicación de prueba que teníamos con socket.io)
[Arreglando un problema con un test que estaba doble](https://github.com/iblancasa/BackendSI2-IV/commit/4baceceb5e3692478d7e81e6cbf885033eb2b408)
[Script para instalar las herramientas necesarias para ejecutar test](https://github.com/iblancasa/BackendSI2-IV/blob/master/test/installTestSuite.sh)

* **Ha participado en esta integración continua y PaaS:**
Issues
[Integración continua](https://github.com/iblancasa/BackendSI2-IV/issues/82)
[Cambio a OpenShift](https://github.com/iblancasa/BackendSI2-IV/issues/77)
[Problemas desplegar OpenShift](https://github.com/iblancasa/BackendSI2-IV/issues/90)
Commits
[Arreglando problema con ejecución de Mocha e instalación de Ansible en Travis](https://github.com/iblancasa/BackendSI2-IV/commit/918b88a95799927ae158d5fe41926511b5ae72ae)
[Arreglando problema con permisos de scripts en Travis](https://github.com/iblancasa/BackendSI2-IV/commit/9b5b3f5a5e4f08be52edfb5a8d9c7c3cd8be2053)
[Arreglando problemas con integración continua](https://github.com/iblancasa/BackendSI2-IV/commit/2626fabe9297d10dd0359fd654d6395c31ae6012)
[Añadiendo despliegue en OpenShift en Travis](https://github.com/iblancasa/BackendSI2-IV/commit/0e5697bd5e51dae840eed58a6398fb18787e2d8d)
[Editando package.json para arreglar problemas de integración continua](https://github.com/iblancasa/BackendSI2-IV/commit/1ec2f2252184fb0615799b97f6f216b4bb305c86)

* **Ha participado en esta configuración de despliegue automático con:**
Issues
[Despliegue utilizando Ansible o similares](https://github.com/iblancasa/BackendSI2-IV/issues/84) (este issue ha sido mencionado anteriormente, pero cubría varios aspectos)
Commits
[Eliminando problema de bloqueo tras despliegue en Azure](https://github.com/iblancasa/BackendSI2-IV/commit/4afa4631b1dd5cc2adaad7961a021e7e3bddd200)
[Documentar cómo se el despliegue automático en el IaaS y en el PaaS desde Travis](https://github.com/iblancasa/BackendSI2-IV/commit/d5a8a1cacbdad7dfe22fb8099f19b53781ca599a)


* **También a participado en:**
[Documentación](https://github.com/iblancasa/BackendSI2-IV/issues/91)
[Correcciones en la documentación realizada por los compañeros](https://github.com/iblancasa/BackendSI2-IV/commit/c329e67fea0b473dc85a9be45298eaecaa92dc09)


### José Cristóbal López Zafra  (@JCristobal)

* **Ha participado en estos scripts de provisionamiento:**
Issues:
[Despligue usando Ansible o similares](https://github.com/iblancasa/BackendSI2-IV/issues/84)
Commits:
[Añado playbook.yml](https://github.com/iblancasa/BackendSI2-IV/commit/adfb6e21cf66a6a049b8220eb6989fac137a51cf)

* **Ha participado en los tests con:**
Issues:
[Tests](https://github.com/iblancasa/BackendSI2-IV/issues/80)
Commits:
[Añado algunos test](https://github.com/iblancasa/BackendSI2-IV/commit/ea7c06cb5299bab7b234b4c0d6d32ae317433661)
[Corrección de los test recién añadidos](https://github.com/iblancasa/BackendSI2-IV/commit/d043a2fa652bf24c221f42c5392fe40e3d77715a)
[Test unitario del servidor](https://github.com/iblancasa/BackendSI2-IV/commit/8ce488d4e3fbd1592ac417d41415300bae7a5227)
[Arreglo de un fallo en los test](https://github.com/iblancasa/BackendSI2-IV/commit/ae0b0ee418f16a6665985fa018c2ea4733b58357) (aquí reescribo mucho código, pero lo explico en el comentario del commit)
[Documentación de los test](https://github.com/iblancasa/BackendSI2-IV/commit/b0af63b53142c041267eff420d22bc38b3328142)

* **Ha participado en esta integración continua y PaaS:**
Issues:
[Problemas con el PaaS](https://github.com/iblancasa/BackendSI2-IV/issues/90)
[Añadir fichero de claves al PaaS](https://github.com/iblancasa/BackendSI2-IV/issues/81)


* **Ha participado en esta configuración de despliegue automático con:**
Commits:
[Se añade la opción de despligue automático al playbook](https://github.com/iblancasa/BackendSI2-IV/commit/2816786fc08815d1468d43370a9ad1a8e8113d28)
[Correcciones al playbook](https://github.com/iblancasa/BackendSI2-IV/commit/1eab44f4badcf2c8815d7f967e31f44b23c5fd2b)

* **También he participado en otros issues:**
[Documentación](https://github.com/iblancasa/BackendSI2-IV/issues/91)
["Frontend": issue donde se mencionan los commits sobre éste](https://github.com/iblancasa/BackendSI2-IV/issues/52) y la [validación de sus formularios](https://github.com/iblancasa/BackendSI2-IV/issues/65)


### Pablo Casado Arenas, (@ramako).

### Participación en issues:
[Despliegue](https://github.com/iblancasa/BackendSI2-IV/issues/84#issuecomment-72320039)
[Documentación](https://github.com/iblancasa/BackendSI2-IV/issues/91)
[Tests](https://github.com/iblancasa/BackendSI2-IV/issues/80)
[Código BDD](https://github.com/iblancasa/BackendSI2-IV/issues/89)

### Commits

* **Ha participado en los tests con:**

[Tests](https://github.com/iblancasa/BackendSI2-IV/commit/a2bb6b0b4fcfb36916645ebd9108312fa722b330)
[Tests](https://github.com/iblancasa/BackendSI2-IV/commit/5da457ab6185d4a6d8c8188e70af66e079837f1c)
[Tests y dependencias](https://github.com/iblancasa/BackendSI2-IV/commit/e914aae0f5d770c13ed520830cee6ca009ae1cd9)

* **Ha participado en esta integración continua y PaaS:**
[Travis](https://github.com/iblancasa/BackendSI2-IV/commit/6ebf7232e87da85ed099524c532c9d7313d99ec4)
[Travis](https://github.com/iblancasa/BackendSI2-IV/commit/df062e578f2807455032e176446f1adf800b0c80)

* **Ha participado en esta configuración de despliegue automático con:**
[Despliegue](https://github.com/iblancasa/BackendSI2-IV/commit/0e731918b0345d850f5391e96cfc70af73c6653f)
[Despliegue](https://github.com/iblancasa/BackendSI2-IV/commit/dac95519f6acfa6cf86a3165050e1aa32f4286e3)
[Playbook](https://github.com/iblancasa/BackendSI2-IV/commit/852ff98ca4dc3fe4ecab0c00492eeb585def3534)

* **Ha participado en estos scripts de provisionamiento:**
[Provisionamiento](https://github.com/iblancasa/BackendSI2-IV/commit/c219ef735199197574b714d06a4797042b6c4a11)

* **Ha participado en el código de la aplicación:**
[Código] (https://github.com/iblancasa/BackendSI2-IV/commit/612d0d848df76aaf9d4b0c924729b61858c94917)
[Código](https://github.com/iblancasa/BackendSI2-IV/commit/7f73edade9a94cdafb9722a5aa369107fa1ee33b)
[Código](https://github.com/iblancasa/BackendSI2-IV/commit/b8de2c9a858be84027ff17209ae70d919ee7a19c)

* **Ha participado en la documentación:**
[Documentación Test](https://github.com/iblancasa/BackendSI2-IV/commit/795fb4b97d07d8d05cdc4bff7947888818472729)
[Documentacion Ansible] (https://github.com/iblancasa/BackendSI2-IV/commit/b6b73cea82f172ade7d82c233be08e499d711fa8)






Algunos commits no se han incluido por tener solo pequeñas modificaciones para corregir comportamientos del sistema o errores (que se iban intentando solucionar con otros commits precedentes) y que no suponen grandes aportes respecto a los aquí presentados. Además, se ha tratado de listar los contenidos que son solo de la asignatura

-------------------------------------------------------------------------------------------------------------

###IV Aerospace. Entrega de Práctica final.

* [Repositorio IV_Aerospace](https://github.com/julioxus/iv-aerospace)

* [Aplicación desplegada en Google App Engine](http://ugraerospaceprogram.appspot.com/)

* [Aplicación desplegada en un IaaS (Koding)](http://ivaerospace.koding.io/) (Si la máquina se ha quedado ausente durante una hora, se apaga automáticamente)


####Integrantes:


####Juan Francisco Rodríguez Vílchez
 
Ha participado en estos scripts de provisionamiento (enlace a los commits).
 
* [Issue Provisionamiento](https://github.com/julioxus/iv-aerospace/issues/56)
* [Issue Docker para ver todos los arreglos](https://github.com/julioxus/iv-aerospace/issues/69)
    
* [Arreglando Docker](https://github.com/julioxus/iv-aerospace/commit/e422b275cc4d01e7f11956f0c080615f73f8336d)
* [Arreglos Docker](https://github.com/julioxus/iv-aerospace/commit/5b7d02f1817e45c7e70e6d042b83d0c9b504c58f)
* [Mejorando Dockerfile](https://github.com/julioxus/iv-aerospace/commit/75400050584c8b83a44785754a7f0fa7586d46e4)
* [Mejorando Dockerfile](https://github.com/julioxus/iv-aerospace/commit/15c5a59f38263b9b4d4c66d3254f1dbb4926a7dc)
* [Dockerfile](https://github.com/julioxus/iv-aerospace/commit/4363fe973b263ea87030c5e252e750b38954278b)
* [Demonio necesario para el provisionamiento y despliegue en Koding](https://github.com/julioxus/iv-aerospace/commit/4d5a2ec7bd548a472464e562b63e81095a4e1b97)
     
Ha participado en estos tests (o issues)
 
* [Issue Test para ver los distintos arreglos](https://github.com/julioxus/iv-aerospace/issues/55)
    
* [Test](https://github.com/julioxus/iv-aerospace/commit/c1eb14beab405337b030dc9effb3458f04d07288)
* [Test](https://github.com/julioxus/iv-aerospace/commit/a38e3aba564930c13d57c860f4f182787b347950)
* [Test](https://github.com/julioxus/iv-aerospace/commit/7919d7736276242ba85c9d4446ad1f57ccaa6480)
     
Ha participado en esta integración continua y PaaS
     
* [Issue integración continua para ver los distintos arreglos](https://github.com/julioxus/iv-aerospace/issues/54)
    
* [Realización del script de Shippable](https://github.com/julioxus/iv-aerospace/commit/41b11e7293ec617242ab740eab1ed98cc4d4009e)

Ha participado en esta configuración de despliegue automático.

* [Issue Despliegue Koding](https://github.com/julioxus/iv-aerospace/issues/72)
    
* [Script de despliegue automático en Koding](https://github.com/julioxus/iv-aerospace/commit/a34a75f640b1e63fb92ed0d771ec35baea528a67)
* [Script de despliegue automático en GAE](https://github.com/julioxus/iv-aerospace/commit/a6706785b77627be091f3f8036b7ac2d7c58d9e2)

####Jose Antonio Plata Muñoz

Ha participado en estos scripts de provisionamiento (enlace a los commits)

* https://github.com/julioxus/iv-aerospace/commit/da3eb1d9f5b76c352b8ca770f2d28915fc640b75
* https://github.com/julioxus/iv-aerospace/commit/d801f595564a3c7acfad7594f473eed2a005bb17
* https://github.com/julioxus/iv-aerospace/commit/0aea9a410ac71dfa0fe393414ef549e2f87f7bc5
* https://github.com/julioxus/iv-aerospace/commit/6acc847c569b15a0e49475674e3549be5cff58fd
* https://github.com/julioxus/iv-aerospace/issues/69

Ha participado en esta integración continua y PaaS

* https://github.com/julioxus/iv-aerospace/issues/54

Ha participado en esta configuración de despliegue automático.

* https://github.com/julioxus/iv-aerospace/commit/9d1d360c2a612d3feaeeb4b493d47cce778a7328
* https://github.com/julioxus/iv-aerospace/commit/c32d8c58a1a7c719a53e2caaeeb6735a36e1603f

####Julio Martínez Martínez-Checa
 
Ha participado en estos scripts de provisionamiento:
 
* [Jaula](https://github.com/julioxus/iv-aerospace/commit/59449e67ef650df9795a7ae6494c94b2c348a38e)
* [Jaula](https://github.com/julioxus/iv-aerospace/commit/34eed7bbb8fe4a082a8bd64bf4a5c9784f910ec9)
* [Docker](https://github.com/julioxus/iv-aerospace/commit/6835b93ebd10ca5106f835a0c0906b1132b36839)
* [Demonio](https://github.com/julioxus/iv-aerospace/commit/678d2ea3f41991460b7ab4db77251382eb28993f)
* [Shippable/Koding/Ansible](https://github.com/julioxus/iv-aerospace/commit/0e5bbdcff2ee331b649fbbf8c5def31e378ff0f6)
* [Ansible](https://github.com/julioxus/iv-aerospace/commit/d7590ffedc1fa8224859d82efc7c51bb7245ca14)

* [Issue Docker](https://github.com/julioxus/iv-aerospace/issues/69)
* [Issue pregunta](https://github.com/julioxus/iv-aerospace/issues/71)
* [Issue scripts provisionamiento](https://github.com/julioxus/iv-aerospace/issues/58)
     
Ha participado en estos tests (o issues)
 
* [Tests](https://github.com/julioxus/iv-aerospace/commit/f57153240f6b62169445f645202d7e4a45943f4e)
* [Tests](https://github.com/julioxus/iv-aerospace/commit/7423ecf0af66829263d4fd3e5a75facc6554b402)
* [Tests](https://github.com/julioxus/iv-aerospace/commit/556c6f28d468ee4a7d251b656cef20c9cc71c541)
* [Tests](https://github.com/julioxus/iv-aerospace/commit/8344169f9002840e9b789de0ebd4ef87020c9a1a)
* [Tests](https://github.com/julioxus/iv-aerospace/commit/d381099be6e5e4c7a531db1f3a795388f1e89af3)
* [Tests](https://github.com/julioxus/iv-aerospace/commit/21dae535cb645037fc03fcdbefe7798e29bdae93)

* [Issue tests](https://github.com/julioxus/iv-aerospace/issues/55)
     
Ha participado en esta integración continua y PaaS

* [Autenticación automática](https://github.com/julioxus/iv-aerospace/commit/67e3ad99298ecd8a321b9386211e48e87ff74992)
* [Autenticación automática](https://github.com/julioxus/iv-aerospace/commit/0b2345745dbc65f300efec29bfab91803cafc088)


* [Issue integración contínua](https://github.com/julioxus/iv-aerospace/issues/54)
     

Ha participado en esta configuración de despliegue automático.

* [Koding](https://github.com/julioxus/iv-aerospace/commit/6eabc869193f0d66df333311d99ec5a8e1e83462)
* [Shippable/Koding](https://github.com/julioxus/iv-aerospace/commit/3d1af3f104a1b743a328f325c08da111c5d5bb58)
* [Shippable/Koding/Ansible](https://github.com/julioxus/iv-aerospace/commit/0e5bbdcff2ee331b649fbbf8c5def31e378ff0f6)
* [Shippable/Koding](https://github.com/julioxus/iv-aerospace/commit/c35384ac5dfc14033a9aaac04d3cef6ad84b4142)
* [Vagrant](https://github.com/julioxus/iv-aerospace/commit/b8b1c4fd884dabf5260930cbbf2d0d617c4f1d54)

* [Issue Koding](https://github.com/julioxus/iv-aerospace/issues/72)
* [Issue despliegue IaaS](https://github.com/julioxus/iv-aerospace/issues/56)

####Cristina Rosillo Arenas

Ha participado en estos scripts de provisionamiento: 

* [Docker](https://github.com/julioxus/iv-aerospace/commit/90e7bd24db0c5f38d05dd4bcd36525d3edc976ce)
* [Despliegue automático](https://github.com/julioxus/iv-aerospace/commit/49b4904a4df6a4ab71ba641b85fa6ce93a6ddf7b) ,issues: #67
	
Ha participado en estos tests: 
			
* [Test conexiones máximas](https://github.com/julioxus/iv-aerospace/blob/master/test/test-conex-simultaneas.py) ,issues: #55
* [Test en shippable](https://github.com/julioxus/iv-aerospace/commit/4d789258e6b0c2a9c9e4db7ce1959b1ee3a7143e) ,issues: #55

Ha participado en esta integración continua y PaaS:

* [Base de Datos](https://github.com/julioxus/iv-aerospace/commit/a40612da0f12e140505d9ff49ed0b58fddff01bc) , issues: #51

####Miguel Martinez Castellanos

Ha participado en estos scripts de provisionamiento:

* [Docker](https://github.com/julioxus/iv-aerospace/commit/245287d56062edc2af6a7b3ab2b9e2c4b54c3e15) (issue #69)
* [Docker](https://github.com/julioxus/iv-aerospace/commit/b05ab41faa878d680e5f571709228c23bbb8b61b) (issue #69)

Ha participado en esta integración continua y PaaS:

* [Base de datos ndb](https://github.com/julioxus/iv-aerospace/commit/6871b7a8a3fbd26f45c3157cacf3f4b56bcede98) (issue #51)

Ha participado en esta configuración de despliegue automático:

* [Despliegue automático en Koding](https://github.com/julioxus/iv-aerospace/commit/f5e763025d58abc1dace375943d3cdaceb16540e) (issue #72)
   
####Óscar Sánchez Martínez
 
Ha participado en estos scripts de provisionamiento:

* [playbook de ansible](https://github.com/julioxus/iv-aerospace/commit/52333c0f60900d0d8c20f7f5a88e07dc5dda1072)
* [script de docker](https://github.com/julioxus/iv-aerospace/commit/7565d8e23ea6a48605570eb60372ceadc2d489af)
* [Issues Dockerfile](https://github.com/julioxus/iv-aerospace/issues/69)
     
Ha participado en estos tests (o issues):
 
* [Documentación test navegación](https://github.com/julioxus/iv-aerospace/commit/6fe18d10ec691520f4164e1813aba01f68bd1a37)
* [Test navegación automática](https://github.com/julioxus/iv-aerospace/commit/ee950e02b85072a5604aa3ef1f2d54eb13d7d6d6)
* [Issues desarrollo de test](https://github.com/julioxus/iv-aerospace/issues/55)

Ha participado en esta integración continua y PaaS:
     
* [Archivo de requerimientos para Shippable](https://github.com/julioxus/iv-aerospace/commit/b2e3b33045296431e6cdaa76977898711d76639f)
* [Issues integración con travis](https://github.com/julioxus/iv-aerospace/issues/73)

Ha participado en esta configuración de despliegue automático:

* [Despliegue con vagrant - ficheros](https://github.com/julioxus/iv-aerospace/commit/388ce90dc887e6c68b0dbdd30288c33f3a644824)
* [Despliegue con vagrant - correción](https://github.com/julioxus/iv-aerospace/commit/8841b91c69bb6f99d9203faffd4c54ddb446c38c)


####Hans Manuel Grenner Noguerón
 
Ha participado en estos scripts de provisionamiento:
 
* [Script eliminar proceso del servidor, modificar install_dock](https://github.com/julioxus/iv-aerospace/commit/cc21f69d6d95645fa10ade6deb75fdf29020390f)
* [**Docker**](https://github.com/julioxus/iv-aerospace/commit/6200c0eec098aca8a57b612e0bd2e3139a6708e9)

* [**Issue Docker**](https://github.com/julioxus/iv-aerospace/issues/69)

Ha participado en estos tests (o issues)
 
* [**Test** para comprobar URL's de la aplicación](https://github.com/julioxus/iv-aerospace/commit/215004ef87472653cc0f5a84d5d3927c9e3e95bc)
    
* [**Issue Tests**](https://github.com/julioxus/iv-aerospace/issues/55)

Ha participado en esta integración continua y PaaS
     
* [Integracion continua en **Travis**](https://github.com/julioxus/iv-aerospace/commit/3d3e29059269e28eea7009da0943b7092b73d395)
    
* [**Issue Travis**](https://github.com/julioxus/iv-aerospace/issues/73)

Ha participado en esta configuración de despliegue automático.

* [Creación del playbook de **Ansible**](https://github.com/julioxus/iv-aerospace/commit/75497d83bcb2b924ce444bf7090c479791498bf9)
* [**Vagrant**](https://github.com/julioxus/iv-aerospace/commit/9e6e074d6d2269e9b1846f9f93c4c93d204c04fa)
    
* [**Issue Koding**](https://github.com/julioxus/iv-aerospace/issues/56)


---------------------------------------------------------------------------------------------------------------------------------
