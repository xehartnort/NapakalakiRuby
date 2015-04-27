#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'Cartas.rb'   
require_relative 'Treasures.rb'
require_relative 'CardDealer.rb'
require_relative 'Dice.rb'

class Player

  @@MAXHIDDENTREASURES=4

  attr_reader :visibleTreasures, :hiddenTreasures, :dead
  
  def initialize(name)
    @level = 1
    @name = name
    @dead = true
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
    @pendingBadConsequence = BadConsequence.newNumberOfTreasures("Vacio", 0, 0, 0)
    @dealer = CardDealer.instance
  end
  
  private
  def bringToLive 
    @dead = false
  end
  
  def incrementLevels(l)
     @level= @level+l
  end
  
  def decrementLevels(l)
    if @level-l < 1
      die #Mata si el nivel baja de 1? Sí, míralo
    else
      @level = @level - l
    end
  end
  
  def setPendingBadConsequence(b)
    @pendingBadConsequence = b
  end
  
  def die
    @level=1
    @visibleTreasures.each do |t| 
      discardVisibleTreasure(t)
    end
    @hiddenTreasures.each  do |t| 
      discardHiddenTreasure(t)
    end
  end
  
  def discardNecklaceIfVisible
    @visibleTreasures.each do |t|
      if t.type == TreasureKind::NECKLACE
        discardVisibleTreasure(t)
      end
    end
  end
  
  def dieIfNoTreasures
    if @visibleTreasures.empty? && @hiddenTreasures.empty?
      die
    end
  end
  
  def canIBuyLevels(l)
    @level+l<=9 # Gana cuando llega al nivel 10
  end
  
  protected
  def computeGoldCoinsValue(t)
    levels = 0.0
    t.each do |i|
      levels += (i.goldCoins/1000)
    end
    levels
  end
  
  public
  def applyPrize(p)
    incrementLevels(p.levels)
        for i in 1..p.treasures
          @hiddenTreasures << @dealer.nextTreasure
        end
  end
  
  def combat(m)
    combate = CombatResult::LOSEANDESCAPE
      if getCombatLevel > m.combatLevel
        applyPrize(m.prize)
        if @level > 9 
          combate = CombatResult::WINANDWINGAME
        else
          combate = CombatResult.WIN;
        end
#      else
#        if Dice.instance.nextNumber<5
      elsif Dice.instance.nextNumber<5
          if m.bc.death
              die
              combate = CombatResult::LOSEANDDIE
          else
              applyBadConsequence(m.bc)
              combate = CombatResult::LOSE
          end
      end
      discardNecklaceIfVisible
      combate
  end
  
  def applyBadConsequence(b)
#    if b.levels !=0
#      decrementLevels(b.levels)
#    end
    decrementLevels(b.levels) if b.levels!=0
    bad = b.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(bad)
  end
  
  def makeTreasureVisible(t)
    canI = canMakeTreasureVisible(t)
    if canI
      @visibleTreasures << t
      @hiddenTreasures.delete(t)
    end
    canI
  end
  
  def canMakeTreasureVisible(t)
    @visibleTreasure.insert(-1, t)#inserta al final del array el objeto t
    canI = true
    valido = [false, false, false, false, false, false]
    @vivibleTreasure.each do |i|
      case i.type
        when TreasureKind::ARMOR
          if valido[0]
            canI = false
          else
#          ¿¿¿¿ no es eso lo mismo que hacer ????
          valido[0] = true
#            valido.delete_at(0)
#            valido.insert(0, true)
          end
        when TreasureKind::BOTHHANDS
          if valido[3] || valido[4]
            canI = false
          else 
#           valido.delete_at(3)
#           valido.insert(3, true)
#           valido.delete_at(4)
#           valido.insert(4, true)
#          ¿¿¿¿ no es eso lo mismo que hacer ????
          valido[3] = true
          valido[4] = true
          end
        when TreasureKind::HELMET
          if valido[1]
            canI = false
          else
#           valido.delete_at(1)
#           valido.insert(1, true)
            valido[1] = true
          end
        when TreasureKind::NECKLACE
          if valido[2]
            canI = true;
          else
#            valido.delete_at(2)
#            valido.insert(2, true)
            valido[2] = true
          end
        when TreasureKind::ONEHAND
          if valido[3]
            if valido[4]
              canI = false
            else
#            valido.delete_at(4)
#            valido.insert(4, true)
              valido[4] = true
            end
          else
#          valido.delete_at(3)
#          valido.insert(3, true)
            valido[3] = true
          end
        else
          if valido[5]
            canI = true
          else
#            valido.delete_at(5)
#            valido.insert(5, true)
            valido[5] = true
          end
      end
    end
    @visibleTreasures.delete(t)
    canI  #return
  end
  
  def discardVisibleTreasure(t)
    @visibleTreasures.delete(t)
    if (@pendingBadConsequence!=nil) && (!@pendingBadConsequence.isEmpty)
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    @dealer.giveTreasureBack(t)
    dieIfNoTreasures
  end
  
  def discardHiddenTreasure(t)
    @hiddenTreasures.delete(t)
    if (@pendingBadConsequence!=nil) && (!@pendingBadConsequence.isEmpty)
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
    @dealer.giveTreasureBack(t)
    dieIfNoTreasures
  end
  
  def buyLevels(visible, hidden)
    levels = computeGoldCoinsValue(visible)
    levels += computeGoldCoinsValue(hidden)
    canI = canIBuyLevels(levels)
    if canI
      incrementLevels(levels)
      visible.each do |t|
        discardVisibleTreasure(t)
      end
      hidden.each do |t|
        discardHiddenTreasure(t)
      end 
    end
    canI  #return
  end
  
  def getCombatLevel
    combatLevel = combatLevelCollar = @level 
    collar = false
    
    @visibleTreasures.each do |t|
      collar=true if t.type==TreasureKind::NECKLACE    
      combatLevel += t.minBonus
      combatLevelCollar += t.maxBonus
    end
    
    collar==true ? combatLevelCollar : combatLevel
  end
  
  def validState
    @pendingBadConsequence.isEmpty && @hiddenTreasures.size<=@@MAXHIDDENTREASURES
  end
  
  def initTreasures
    bringToLive
    tirada = Dice.instance.nextNumber
    numeroTesoros = 2
#    if tirada==6
#      numeroTesoros=3
#    end
#    if tirada==1
#      numeroTesoros=1
#    end
#   Versión compacta
    numeroTesoros = 3 if tirada==6
    numeroTesoros = 1 if tirada == 1
    for i in 1..numeroTesoros
      @hiddenTeasure.insert << @dealer.nextTreasure
    end
  end
  
  def hasVisibleTreasures
    !@visibleTreasures.empty?
  end
  
  def to_s
    text = "\n\tName = " + @name.to_s+" \n\tLevel = " + @level.to_s(10) + " \n\tPendingBadConsequence: { " + @pendingBadConsequence.to_s + "\n\t} \n\tDead = " + @dead.to_s
    textoHiddenTreasures = " \n\tArray Hidden Treasures: { "
    textoVisibleTreasures = " \n\tArray Visible Treasures: { "
    unless @visibleTreasures.empty?
      @visibleTreasures.each do |t|
        textoVisibleTreasures += t.to_s + " "
      end 
    else
      textoVisibleTreasures += "No tiene ningún tesoro visible. "
    end
    unless @hiddenTreasures.empty?
      @hiddenTreasures.each do |t|
        textoHiddenTreasures += t.to_s + " "
      end 
    else
      textoHiddenTreasures += "No tiene ningún tesoro oculto. "
    end
    text += textoHiddenTreasures + "}" + textoVisibleTreasures + "}"
  end 
end

#main
if __FILE__ == $0 
  for i in 0..15
    puts i
  end
end
