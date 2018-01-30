#!/usr/bin/ruby

require 'net/http'

# Creamos la clase Cabecera que incluye las diferentes funciones para acceder a los campos
# de la cabecera de la página que le pasamos al inicializar la clase con la uri
class Cabecera

	def initialize(uri)
		@response = Net::HTTP.get_response(uri, '/')     				
	end

	def direccion()
		return @response['location'].to_s
	end

	def fecha()
		return @response['date'].to_s
	end

	def tipo_contenido()
		return @response['content-type'].to_s
	end

	def longitud_contenido()
		return @response['content-length'].to_s
	end

	def servidor()
		return @response['server'].to_s
	end
end	

# Creamos el objeto para acceder a las funciones de la clase
cabecera_test = Cabecera.new(ARGV[0])

# Devolvemos los resultados
puts "Direccion: " + cabecera_test.direccion()
puts "Fecha: "+ cabecera_test.fecha()
puts "Tipo de contenido: "+ cabecera_test.tipo_contenido()
puts "Longitud del contenido: "+ cabecera_test.longitud_contenido()
puts "Servidor: "+ cabecera_test.servidor()

