#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'Treasures.rb'
require_relative 'Monster.rb'
require_relative 'Player.rb'
require_relative 'BadConsequence.rb'
require_relative 'Prize.rb'
require 'singleton'

class Napakalaki
  include Singleton
  
  @currentPlayer
  @currentMonster
  @players #Array de players
  
  attr_reader :currentPlayer, :currentMonster
  
  def initPlayers(names)
    @players = Array.new
      names.each do |n|
        @players.push(Player.new(n));
      end
  end
  
#  def nextPlayer
#    
#  end
  
  private :initPlayers, :nextPlayer
  
#  def combat 
#    
#  end
#  
#  def discardVisibleTreasure(t)
#    
#  end
#  
#  def discardHiddenTreasure(t)
#    
#  end
#  
#  def makeTreasureVisible(t)
#    
#  end
#  
#  def buyLevels(visible, hidden)
#    
#  end
#  
#  def initGame(players)
#    
#  end
#  
  #  def canMakeTreasureVisible(t)
#    
#  end
#  
#  def getVisibleTreasures
#    
#  end
#  
#  def getHiddenTreasures
#    
#  end
#  
#  def nextTurn
#    
#  end
#  
#  def nextTurnAllowed
#    
#  end
#  
#  def endOfGame
#    
#  end
end