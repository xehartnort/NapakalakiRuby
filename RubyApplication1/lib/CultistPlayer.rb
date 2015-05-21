# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'Cartas.rb'   
require_relative 'Treasures.rb'
require_relative 'CardDealer.rb'
require_relative 'Dice.rb'

class CultistPlayer < Player
  
  def initialize(p,c)
    super.copyPlayer(p)
    @myCultistCard = c
    @@totalCultistPlayers+=1
  end
  
  def getCombatLevel
    super.getCombatLevel()+myCultistCard.getSpecialValue()
  end
  def self.getTotalCultistPlayers
    @@totalCultistPlayers
  end
  
 protected
 
  def shouldConvert
    false
  end
  
  def getOponentLevel(m)
      m.getSpecialValue
  end
  
  def computeGoldCoinsValue(t)
    super.computeGoldCoinsValue(t)*2
  end
  
end
