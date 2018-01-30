####Ejercicio3

######Escribir en YAML la siguiente estructura de datos en JSON

~~~yaml
{ uno: "dos",
tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }
~~~

Quedaría algo así:

~~~json
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
~~~
