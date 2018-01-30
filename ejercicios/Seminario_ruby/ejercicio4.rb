#!/usr/bin/ruby

require 'net/http'
url = "www.ideal.es"

puts "URL: " + url
puts "Ultima modificacion"+ Net::HTTP.get_response(url,'/')['date'].to_s
puts "Server: "+ Net::HTTP.get_response(url,'/')['server'].to_s
puts "Content type: "+ Net::HTTP.get_response(url,'/')['content-type'].to_s

