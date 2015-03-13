#!/usr/bin/env ruby
# encoding: UTF-8

class Monster
=begin
Constructor que crea y asigna las variables 
de instancia el primer valor sera el nombre 
de mostruo, el segundo sera su nivel, el 
tercero el mal royo y el cuarto el premio
=end
  def initialize(name, level, bc, prize)
    @name = name
    @combatLevel=level
    @prize = prize
    @bc = bc
  end
=begin
Metodo to_s devuelve los variables de instacia en un String
=end
  def to_s
    string = "\nNombre: "+name+"\nNivel: "+combatLevel.to_s+"\nMal royo: "+bc.to_s+"\nPremios: "+prize.to_s
    return string
  end
=begin
Metodo para leer valores de variables de instancia 
=end
  attr_reader :name, :combatLevel, :bc, :prize

end