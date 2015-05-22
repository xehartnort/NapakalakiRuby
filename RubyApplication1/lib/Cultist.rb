# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'Card.rb'
require_relative 'Player.rb'
require_relative 'BadConsequence.rb'
require_relative 'CultistPlayer.rb'
require_relative 'BCDeath.rb'
require_relative 'BCNumberOfTreasures.rb'
require_relative 'BCSpecificTreasures.rb'

module Model
  
  class Cultist
    include Card # interfaz

    def initialize(text, level)
      @text = text
      @gainedLevels = level
    end
    
    def getBasicValue
      gainedLevels;
    end
    
    def getSpecialValue
      getBasicValue*CultistPlayer.getTotalCultistPlayers
    end
    
  end
end