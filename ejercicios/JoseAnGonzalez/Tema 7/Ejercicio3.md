#Ejercicio 3

### Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

La estructura queda descrita de la siguiente forma:

	---
	- uno: "dos"
  	  tres:
    	- 4
    	- 5
    	- "Seis"
    	-
      		- siete: 8
        	nueve:
          		- 10
          		- 11
