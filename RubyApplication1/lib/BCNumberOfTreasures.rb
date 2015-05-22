# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'BadConsequence.rb'
module Model
  class BCNumberOfTreasures < BadConsequence

    public_class_method :new

    def initialize(text, levels, nVisibleTreasures, nHiddenTreasures)
      super(text, levels, false)
      @nVisibleTreasures = nVisibleTreasures
      @nHiddenTreasures = nHiddenTreasures
    end

    def substractVisibleTreasure(t)#Treasure t
      @nVisibleTreasures = (@nVisibleTreasures-1) < 0 ? 0 : @nVisibleTreasures-1 ;
  #     Exactamente igual que en java, if else compacto
    end

    def substractHiddenTreasure(t)#Treasure t
      @nHiddenTreasures = (@nHiddenTreasures-1) < 0 ? 0 : @nHiddenTreasures-1 ;
  #     Exactamente igual que en java, if else compacto
    end

    def isEmpty
      @levels==0 &&
        @nVisibleTreasures==0 &&
        @nHiddenTreasures==0
    end

    def adjustToFitTreasureLists(v, h)
  #   Número de tesoros visibles a quitar 
      minVisibleTreasures =  @nVisibleTreasures > v.length ? v.length : @nVisibleTreasures
  #   Número de tesoros ocultos a quitar
      minHiddenTreasures = @nHiddenTreasures > h.length ? h.length : @nHiddenTreasures
      BadConsequence.newNumberOfTreasures(@text, 0, minVisibleTreasures, minHiddenTreasures) #return
    end

    def to_s
      @textoIntroduccion + "\n\tTexto = " + @text.to_s + 
           "\n\tLevels = " + @levels.to_s +
           "\n\tNumber of Visible Treasures = " + @nVisibleTreasures.to_s +
           "\n\tNumber of Hidden Treasures = " + @nHiddenTreasures.to_s # return
    end

  end
end
