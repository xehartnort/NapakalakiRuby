#!/usr/bin/env ruby
# encoding: UTF-8
module Model
  class Monster

    include Card # interfaz

    attr_reader :name, :combatLevel, :bc, :prize

    def initialize(name, level, bc, prize, levelChangeAgainstCultistPlayer)
      @name = name
      @combatLevel=level
      @prize = prize
      @bc = bc
      @levelChangeAgainstCultistPlayer = levelChangeAgainstCultistPlayer
    end

    def to_s
      "Nombre: "+@name+"\nNivel: "+@combatLevel.to_s+"\nMal rollo: "+@bc.to_s+"\nPremios: "+@prize.to_s#return
    end

    def getSpecialValue
      @combatLevel+@levelChangeAgainstCultistPlayer #return
    end

    def getBasicValue
      @combatLevel #return
    end
  end
end