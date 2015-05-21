# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Model
  class Cultist < Player
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