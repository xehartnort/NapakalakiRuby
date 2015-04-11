#!/usr/bin/env ruby
# encoding: UTF-8
require_relative 'TreasureKind.rb'

class Treasure
  
#  @name string
#  @goldCoins int
#  @minBonus int
#  @maxBonus int
#  @type TreasureKind
  
  attr_reader :name, :goldCoins, :minBonus, :maxBonus, :type
  
  def initialize(n, g, min, max, t)
    @name=n
    @goldCoins=g
    @minBonus=min
    @maxBonus=max
    @type=t
  end
end

#main
if __FILE__ == $0
  tesorito=Treasure.new("Anillo del poder", 1000000000, 9999, -2, TreasureKind::ONEHAND)
  puts "Mi tesoorooo: ", tesorito.name, tesorito.goldCoins, tesorito.minBonus, tesorito.maxBonus, tesorito.type
end
