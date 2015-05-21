#!/usr/bin/env ruby
# encoding: UTF-8
require_relative 'Treasures.rb'
module Model
  class BadConsequence

    def initialize(text, levels, death)
      @textoIntroduccion = "Esto es un mal rollo con el siguiente contenido: \n"
      @text = text
      @levels = levels
      @death = death
    end

    protected @textoIntroduccion, @text, @levels, @death

    private_class_method :new # Efecto Wert, privatiza el método new

    ########## Getters ruby ##########

    attr_reader :text, :levels, :death 

    def kills
      @death
    end

    def isEmpty
      raise NotImplementedError.new
    end

    def adjustToFitTreasureLists(v, h)#v:Treasure[], h:Treasure[]
      raise NotImplementedError.new
    end

    def to_s
      raise NotImplementedError.new
    end

  end
end
