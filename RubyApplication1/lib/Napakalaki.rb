#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'Treasures.rb'
require_relative 'Monster.rb'
require_relative 'Player.rb'
require_relative 'BadConsequence.rb'
require_relative 'Prize.rb'
require_relative 'Dice.rb' 
require_relative 'CombatResult.rb'
require 'singleton'

class Napakalaki
  include Singleton

# !!! Cuidado, estas variables son de instancia de clase,
# distintas a las variables de instacia ¡¡¡
# --------------------
#  @currentPlayer
#  @currentPlayerIndex
#  @currentMonster
#  @players
# --------------------

# Sin embargo esta variable es solo de clase y así no origina
# ningún problema :)
  @@firstTurn=true

  attr_reader :currentPlayer, :currentMonster
  
  def initPlayers(names)#Array
    @players = Array.new
      names.each do |n|
        @players.push(Player.new(n));
      end
  end
  
  def nextPlayer
    if @@firstTurn
      @@firstTurn=false;
      @currentPlayerIndex = Dice.instance.nextNumber
    else
      @currentPlayerIndex++
      @currentPlayerIndex %= @players.size
    end
  end
  
  private :initPlayers, :nextPlayer
  
  def combat 
    @currentPlayer.combat(@currentMonster)
  end
  
  def discardVisibleTreasure(t)#Treasure
    @currentPlayer.discardVisibleTreasure(t)
  end
  
  def discardHiddenTreasure(t)#Treasure
    @currentPlayer.discardHiddenTreasure(t)
  end
  
  def makeTreasureVisible(t)#Treasure
    @currentPlayer.canMakeTreasureVisible(t)
  end
  
  def buyLevels(visible, hidden)#Array, Array
    @currentPlayer.buyLevels(visible, hidden)
  end
  
  def initGame(players)#Array
    initPlayers(players)
    CardDealer.instance.initCards
    nextTurn
  end
  
#  def getVisibleTreasures
#    
#  end
#  
#  def getHiddenTreasures
#    
#  end
#  
  def nextTurn
    if nextTurnIsAllowed
      @currentMonster = CardDealer.instace.nextMonster
      @currentPlayer = nextPlayer
      if @currentPlayer.isDead
        @currentPlayer.initTreasures
      end
    end
    nextTurnIsAllowed
  end
  
  def nextTurnIsAllowed
    @currentPlayer.validState
  end
  
  def endOfGame(result)#CombatResult
    result==CombatResult::WINANDWINGAME
  end
  
end