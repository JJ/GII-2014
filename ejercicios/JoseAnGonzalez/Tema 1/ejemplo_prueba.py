#!/usr/bin/python
# encoding: utf-8

### Ejercicio 4 Practica 2 DAI: Manejo de formularios
import web
from web import form

urls = ('/', 'index')
app = web.application(urls, globals())

login = form.Form(
	form.Textbox('Nombre'),
	form.Textbox('Edad'),
		#form.notnull,
		#form.regexp('\d+', 'Debe ser un dígito')),
		#form.Validator('Debe ser mayor que 1', lambda x:int(x)>5)),
	form.Button('Comprobar')
)

class index: 
	def GET(self): 
		form = login()
        # Hay que hacer una copia del formuario (linea superior)
        # O los cambios al mismo serían globales
		return """<html><body>
		<form name="input" action="/" method="post">
		%s
		</form>
		</body></html>
		""" % (form.render())

	def POST(self): 
		form = login() 
		if not form.validates(): 
			return render.formtest(form)		
		else:
			if int(form['Edad'].value) > 17:
				return "Hola %s, eres mayor de edad CAMBIADO" % (form.d.Nombre)
			else:
				return "Hola %s, eres menor de edad" % (form['Nombre'].value)

				
if __name__=="__main__":
    app.run()
