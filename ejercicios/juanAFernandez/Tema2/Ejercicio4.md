#Script para un documentos Google

Leemos la documentación de [Google Apps Script](https://developers.google.com/apps-script/overview), el lenguaje de scripting basado en JavaScript para poder interactuar con los Docs y los formularios de Google.

Para empezar a usarlo podemos acceder a [Script Google](https://script.google.com/) y probar con un sencillo ejemplo lo que podemos hacer:

```sh
function createAndSendDocument() {
  // Crea un nuevo documento de Google Drive llamado 'Hello, world!'.
  var doc = DocumentApp.create('Hello, world!');

  // Accede al cuerpo del documento, entonces añade un párrafo.
  doc.getBody().appendParagraph('Este documento ha sido creeado con un script de Google Apps.');

  // Extraemos la url del documento.
  var url = doc.getUrl();

  // Obtiene el email del usuario activo - nosotros mismos.
  var email = Session.getActiveUser().getEmail();

  // Obtiene el nombre del documento para usarlo en el email
  var subject = doc.getName();

  // Incluimos el enlace al documento en el cuerpo del email.
  var body = 'Enlace a tu documento: ' + url;

  // Nos enviamos a nostros mismo un email con el mensaje.
  GmailApp.sendEmail(email, subject, body);
}
```

Después accedemos a nuestro correo y vemos cómo nos ha enviado el mensaje con el enlace al documento. Esto es sólo una muestra de lo que con estos scripts podemos llegar a hacer.