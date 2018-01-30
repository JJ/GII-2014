#!/usr/bin/ruby

array_hashes = {
  "clave1" => [1,2,3,4],
  "clave2" => [5,6,7,8],
  "clave3" => [9]
}

puts array_hashes.to_s

array_hashes.keys().each do |i|
  puts array_hashes[i]
end
