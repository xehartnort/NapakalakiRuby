# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Cultist.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'Treasures.rb'
require_relative 'CardDealer.rb'
require_relative 'Dice.rb'
require_relative 'Player.rb'

module Model

class CultistPlayer < Player
  
  @@totalCultistPlayers=0
  
  def initialize(p, c)
    Player.copy(p) #con super no funciona ¿Estaría bien así? -> no da errores pero no se si hace todo bien 
    @myCultistCard = c
    @@totalCultistPlayers+=1
  end
  
  def getCombatLevel
    super.getCombatLevel()+myCultistCard.getSpecialValue()
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
    super.computeGoldCoinsValue(t)*2
    #super(t)*2
  end
  
end
if __FILE__ == $0
  yo = Player.new("juan")
  puts yo.isDead
  puts CultistPlayer.getTotalCultistPlayers
#  CultistPlayer.new(yo, CardDealer.instance.nextCultist)
end

end