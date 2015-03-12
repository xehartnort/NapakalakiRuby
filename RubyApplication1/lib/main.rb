#!/usr/bin/env ruby
# encoding: UTF-8
# ó $KCODE = 'u'



#Descomentar para aquellas clases que ya existan también hacerlo en Cartas.rb ;)
#require_relative 'TreasureKind.rb'
#require_relative 'Prize.rb'
#require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'Cartas.rb'

malaCosa = BadConsequence.newDeath("Es telible")
print malaCosa # en lugar de poner puts malaCosa.to_s, con print ya se invoca a este método
