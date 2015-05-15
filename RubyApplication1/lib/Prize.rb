#!/usr/bin/env ruby
# encoding: UTF-8
module Model
  class Prize
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
