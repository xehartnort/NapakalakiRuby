#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb' #require_relative -> respecto al path actual
require_relative 'Cartas.rb'   
require_relative 'Treasures.rb'

class Player
# 
#  Muy recomendable poner al principio las variables de la clase
#  junto con su tipo
#  @level # int
#  @name # string
#  @visibleTreasures # array
#  @hiddenTreasures # array
#  @pendingBadConsequence # BadConsequence
  @@MAXHIDDENTREASURES=4 # const int

  #Tambien muy recomendable poner los getters/setters al principio
  attr_reader :visibleTreasures, :hiddenTreasures, :dead
  
  def initialize(name)
    @level = 1
    @name = name
    @dead = true
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
    @pendingBadConsequence = BadConsequence.newNumberOfTreasures("Vacio", 0, 0, 0)
  end
  
  def bringToLife 
    @dead = false
  end
  
  def incrementLevels(l)
     @level= @level+l
  end
  
  def decrementLevels(l)
    if @level-l <= 0
      die
    else
      @level = @level - l
    end
  end
  
  def setPendingBadConsequence(b)
    @pendingBagConsequence = b
  end

  def discardNecklaceIfVisible
    
  end
  
  def dieIfNoTreasures
    if @visibleTreasures.empty? && @hiddenTreasures.empty?
      @dead = true
    end
  end
  
  def canIBuyLevels(l)
    @level+l<=9 # Gana cuando llega al nivel 10
  end
  
  def computeGoldCoinsValue(t)
    
  end
  
  def applyPrize(p)
    
  end
  
  def combat(m)
    
  end
  
  def applyBadConsequence(b)
  
  end
  
  def makeTreasureVisible(t)
    
  end
  
  def canMakeTreasureVisible(t)
    
  end
  
  def discardVisibleTreasure(t)
    
  end
  
  def discardHiddenTreasure(t)
    
  end
  
  def buyLevels(visible, hidden)
    
  end
  
  def getCombatLevel
#   las asignaciones se pueden hacer en cadena
    combatLevel = combatLevelCollar = @level 
    collar = false
    @visibleTreasures.each do |t|
#      if t.type==TreasureKind::NECKLACE
#        collar = true
#      end
#      Versión compacta, solo Ruby 
      collar=true if t.type==TreasureKind::NECKLACE
#     {    "     } if CONDICION    
      combatLevel += t.minBonus
      combatLevelCollar += t.maxBonus
    end
    
#    if collar
#      return combatLevelCollar
#    else
#      return combatLevel
#    end
#    Versión compacta, mismo funcionamiento que en java
    collar==true ? combatLevelCollar : combatLevel
  end
  
  def validState
    @pendingBadConsequence.empty? && @hiddenTreasures.size<=@@MAXHIDDENTREASURES
  end
  
  def initTreasures
  
  end
  
  def hasVisibleTreasures
    !@visibleTreasures.empty?
  end
  
end

#main
if __FILE__ == $0 
  yo = Player.new("Dani")
  print "Estoy muerto? ", yo.dead, "\n"
  yo.bringToLife
  print "Y ahora? ", yo.dead, "\n"
  yo.incrementLevels(20)
  print "Con nivel ", yo.getCombatLevel," puedo comprar niveles? ", yo.canIBuyLevels(1), "\n"
  yo.decrementLevels(11)
  print "Y con nivel ", yo.getCombatLevel, "? ", yo.canIBuyLevels(1), "\n"
  yo.decrementLevels(2)
  print "Pero con ", yo.getCombatLevel," niveles sí, verdad? ", yo.canIBuyLevels(1), "\n"
  print "Tengo algún tesoro visible? ", yo.hasVisibleTreasures, "\n"
  print "Perooo estoy en un estado válido???? ", yo.validState, "\n"
  print "Pues bueno, estuvo bonito mientras duró, adios mundo cruel ", yo.dieIfNoTreasures, "\n"
  print "Venga ya, enserio, qué me he muerto? ", yo.dead, "\n"
end
