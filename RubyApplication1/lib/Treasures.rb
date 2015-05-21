#!/usr/bin/env ruby
# encoding: UTF-8
require_relative 'TreasureKind.rb'
require_relative 'Card.rb'
module Model
  class Treasure

    include Card # interfaz

    attr_reader :name, :goldCoins, :minBonus, :maxBonus, :type

    def initialize(n, g, min, max, t)
      @name=n
      @goldCoins=g
      @minBonus=min
      @maxBonus=max
      @type=t
    end

    def getBasicValue
      @minBonus
    end

    def getSpecialValue
      @maxBonus
    end

    def to_s
      "\n\tTesoro: " + @name + 
      "\n\t\tGoldBonus: " + @goldCoins.to_s + 
      "\n\t\tMinBonus: " + @minBonus.to_s + 
      "\n\t\tMaxBonus: " + @maxBonus.to_s +
      "\n\t\tTreasureKind: " + @type.to_s
    end
end

#main
if __FILE__ == $0
  tesorito=Treasure.new("Anillo del poder", 1000000000, 9999, -2, TreasureKind::ONEHAND)
  puts "Mi tesoorooo: ", tesorito.name, tesorito.goldCoins, tesorito.minBonus, tesorito.maxBonus, tesorito.type
end
end