##Ejercicios Tema 2. [Francisco Javier Expósito Cruz](http://github.com/franexposito)

##Creando aplicaciones en la nube: Uso de PaaS y SaaS
###Ejercicio 1.
En mi caso he escogido [virtualenv](https://virtualenv.pypa.io/en/latest/virtualenv.html) para Python. Para ello seguiré el proceso de instalación descrito en la [documentacion](https://virtualenv.pypa.io/en/latest/virtualenv.html#installation).  

En primer lugar instalo Python-pip

	sudo apt-get install python-pip  

Ahora instalo **virtualenv**  

	sudo pip install virtualenv  

Activamos un nuevo entorno

	virtualenv ENV  

Ya podemos comenzar a utilizar el entorno de desarrollo.

###Ejercicio 2.
He decidido crear una cuenta en Heroku:  

![t2e2_a](imagenes/t2e2_a.png)  

###Ejercicio 3.
En primer lugar nos registramos en [OpenShift](https://www.openshift.com/):  

![t2e3_a](imagenes/t2e3_a.png)

Tras el registro, debemos crear una nueva aplicación. En nuestor caso seleccionamos WordPress:  

![t2e3_b](imagenes/t2e3_b.png)

Configuramos la aplicación:  

![t2e3_c](imagenes/t2e3_c.png)

En el siguiente paso ya solo queda configurar la instalación de wordpress:  

![t2e3_d](imagenes/t2e3_d.png)  
![t2e3_d](imagenes/t2e3_d.png)  

Y ya tenemos el sitio listo: [Wordpress for IV](https://wp-franexpiv.rhcloud.com/).

###Ejercicio 4.
Siguiendo el [tutorial](https://developers.google.com/apps-script/overview) de la documentación de Google, creamos el primer script de prueba:  

```javascript
function createAndSendDocument() {
  // Create a new Google Doc named 'Hello, world!'
  var doc = DocumentApp.create('Hola, mundo!');

  // Access the body of the document, then add a paragraph.
  doc.getBody().appendParagraph('Este documento fue creado por Google Apps Script.');

  // Get the URL of the document.
  var url = doc.getUrl();

  // Get the email address of the active user - that's you.
  var email = Session.getActiveUser().getEmail();

  // Get the name of the document to use as an email subject line.
  var subject = doc.getName();

  // Append a new string to the "url" variable to use as an email body.
  var body = 'Enlace a tu documento: ' + url;

  // Send yourself an email with a link to the document.
  GmailApp.sendEmail(email, subject, body);
}
```

Concedemos los permisos necesarios para ejecutar el script:  

![t2e4_a](imagenes/t2e4_a.png)

Y finalmente ejecutamos el script y vemos que recibimos un correo con el nuevo documento tal y como pone en nuestro código:  
![t2e4_b](imagenes/t2e4_b.png)

###Ejercicio 5.
En el caso de Python, que es el lenguaje que usaremos en nuestro PasS, existe un sistema de automatización llamado [Paver](http://paver.github.io/paver/).

###Ejercicio 6.
En el caso de Google App Engine utiliza [YAML](http://es.wikipedia.org/wiki/YAML), un lenguaje de serialización de datos. A través de un archivo situado en el directorio raiz llamado **app.yaml** donde se especifican una serie de campos obligatorios como:  

* project-id de la aplicación  
* versión  
* runtime  
* versión de la api  

A parte de estos campos, hay que indicarle a *GAE* de que manera debe actuar en caso de recibir una petición. Asi por ejemplo tenemos que indicarle que si alguien introduce la dirección *http://nombre-app./client* debe acudir a ./inc/client.py por ejemplo.  

Un ejemplo de este archivo es el siguiente:

```
application: nombre-app
version: 1
runtime: python27
api_version: 1
threadsafe: yes

handlers:
- url: /favicon\.ico
  static_files: favicon.ico
  upload: favicon\.ico

- url: .*
  script: main.app

libraries:
- name: webapp2
  version: "2.5.2"
```

###Ejercicio 7.
En el caso de GAE existe un entorno de desarrollo proporcionado por la propia Google la cual permite probar de manera local las aplicaciones antes de subirlas al sistema.  
