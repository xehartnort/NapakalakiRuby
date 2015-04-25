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
      @currentPlayerIndex = Dice.instance.nextNumber%@players.size
    else
      @currentPlayerIndex+=1
      @currentPlayerIndex %= @players.size
    end
  end
  
  private :initPlayers, :nextPlayer
  
  def combat 
    @currentPlayer.combat(@currentMonster) #return
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
    @currentPlayer.buyLevels(visible, hidden) #return
  end
  
  def initGame(players)#Array
    initPlayers(players)
    CardDealer.instance.initCards
    nextTurn
  end

  def nextTurn
    if nextTurnIsAllowed
      @currentMonster = CardDealer.instace.nextMonster
      @currentPlayer = nextPlayer
      if @currentPlayer.isDead
        @currentPlayer.initTreasures
      end
    end
    nextTurnIsAllowed #return
  end
  
  def nextTurnIsAllowed
    @currentPlayer==nil ? true : @currentPlayer.validState #return
  end
  
  def endOfGame(result)#CombatResult
    result==CombatResult::WINANDWINGAME #return
  end
  
end