#!/usr/bin/env ruby
# encoding: UTF-8

class Prize
=begin
Constructor que crea y asigna las variables 
de instancia el primer valor sera el numero
de tesoros y el segundo sera los niveles que
gana el juegador al derrotar al mostruo en batalla
=end
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end
=begin
Metodo to_s devuelve los variables de instacia en un String
=end
  def to_s
    string = "\n\tNumero de tesoros: "+treasures.to_s+"\n\tNiveles: "+levels.to_s
    return string
  end
=begin
Metodo para leer valores de variables de instancia 
=end
  attr_reader :treasures, :levels

end