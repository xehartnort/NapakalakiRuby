#!/usr/bin/env ruby
# encoding: UTF-8
module Model
class Prize
=begin
Constructor que crea y asigna las variables 
de instancia el primer valor sera el número
de tesoros y el segundo será los niveles que
gana el jugador al derrotar al mostruo
=end
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end

# Método to_s devuelve los variables de instacia en un String

  def to_s
    "\n\tNumero de tesoros: "+@treasures.to_s+"\n\tNiveles: "+@levels.to_s + "\n"#return
  end

# Método para leer valores de variables de instancia 

  attr_reader :treasures, :levels

end
end
