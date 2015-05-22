# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Player'
require_relative 'Cultist.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'Dice.rb'


module Model

class CultistPlayer < Player
  @@totalCultistPlayers=0
  def initialize(p,c)
    super(p.name, p.level, p.isDead, p.getVisibleTreasures, p.getHiddenTreasures, p.getPendingBadConsequence)
    @myCultistCard = c
    @@totalCultistPlayers+=1
  end
  
  def getCombatLevel
    super+myCultistCard.getSpecialValue()
    #creo que la siguiente línea tambien está bien
    #super+myCultistCard.getSpecialValue()
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
#    super.computeGoldCoinsValue(t)*2
    super(t)*2
  end
  
end

end
