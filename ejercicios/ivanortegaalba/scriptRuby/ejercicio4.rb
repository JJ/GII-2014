#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'net/http'

def metodosPermitidos()
  response = Net::HTTP.get_response(ARGV[0],'/')
  return response['access_control_allow_methods'].to_s
end

def fecha()
  response = Net::HTTP.get_response(ARGV[0],'/')
  return response['date'].to_s
end

def servidor()
  response = Net::HTTP.get_response(ARGV[0],'/')
  return response['server'].to_s
end

def length()
  response = Net::HTTP.get_response(ARGV[0],'/').to_s
  return response['content_length'].to_s
end

def tipoConexion()
  response = Net::HTTP.get_response(ARGV[0],'/').to_s
  return response['connection'].to_s
end

puts "Metodos Permitidos:" + metodosPermitidos()
puts "Fecha :" + fecha()
puts "Servidor:" + servidor()
puts "Longitud :" + length()
puts "Tipo de conexión :" + tipoConexion()
