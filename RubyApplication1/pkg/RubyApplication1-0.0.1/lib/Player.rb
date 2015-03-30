#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb' #require_relative -> respecto al path actual
require_relative 'Cartas.rb'   
require_relative 'Treasure.rb'

class Dice
  
  @@MAXHIDDENTREASURES=4
  
  def initialize(name)
    @level =1
    @name = name
    @dead = true
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
    @pendingBadConsequence = BadConsequence.newNumberOfTreasures("Vacio", 0, 0, 0)
  end
  
  def bringToLive
    @dead = false
    @visibleTreasures.clear
    @hiddenTreasures.clear
    @level=1
    @pendingBadConsequence = BadConsequence.newNumberOfTreasures("Vacio", 0, 0, 0)
  end
  
  def incrementLevels(l)
     @level=@level+l
  end
  
  def decrementLevels(l)
    @level=@level-l
  end
  
  def setPendingBadConsequence(bc)
    @pendingBagConsequence = bc
  end
  
  attr_reader :dead

  def discardNecklaceIfVisible
    
  end
  
  def dieIfNoTreasures
    if visibleTreasure.isEmpty && hiddenTreasure.isEmpty
      @dead = true
    end
  end
  
  def canIBuyLevels(l)
    if(@level+l<9)
      return true
    else
      return false
    end
  end
  
  def computeGoldCoinsValue(t)
    
  end
  
  def applyPrize(p)
    
  end
  
  def combat(m)
    
  end
  
  def applyBadConsequence(bad)
  
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
    combatLevel = @level
    combatLevelCollar = @level
    collar=false
    @visibleTreasures.each do |t|
      if t.type==TreasureKind::NECKLACE
        collar=true
      end
      combatLevel = combatLevel + t.minBonus
      combatLevelCollar = combatLevelCollar + t.maxBonus
    end
    if collar
      return combatLevelCollar
    else
      return combatLevel
    end
  end
  def validState
    if @pendingBadConsequence.isEmpty && @hiddenTreasures.size<5
      return true
    else
      returnfalse
    end
  end
  
  def initTreasures
  
  end
  
  attr_reader :dead
  
  def hasVisibleTreasures
    if @visibleTreasures.size==0
      return true
    else
      return false
    end
  end
  
  attr_reader :visibleTreasures
  
  attr_reader :hiddenTreasures
  
end
