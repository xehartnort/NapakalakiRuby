#!/usr/bin/env ruby
#enconding: UTF-8

#Descomentar para aquellas clases que ya existan :)
#require_relative 'TreasureKind.rb'
#require_relative 'Prize.rb'
#require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'


malaCosa = BadConsequence.newBadConsequence("Es telible",false,7,16)
puts malaCosa.to_s
