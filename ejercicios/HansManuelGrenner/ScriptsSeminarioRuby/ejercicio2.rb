#!/usr/bin/ruby

# Creamos una estructura que contiene diferentes arrays
estructuraMixta = {
  :humano =>{
    :cuerpo => "dinamico",
    :gravedad => 9.8,
    :masa => 80,
    :esMortal => true
  },
  :piedra =>{
    :cuerpo => "dinamico",
    :gravedad => 9.8,
    :masa => 20,
    :esMortal => false
  },
  :plataforma =>{
    :cuerpo => "estatico",
    :gravedad => 0,
    :esMortal => false,
    :rangoMovimiento =>{ :valores =>{ :min => -5 , :max => 5 }}
  }
}

# Devolvemos los datos
estructuraMixta.keys().each() do |contenido|
  puts estructuraMixta[contenido]
end