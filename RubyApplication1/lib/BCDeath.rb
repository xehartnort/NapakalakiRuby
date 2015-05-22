# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'BadConsequence.rb'
module Model
  class BCDeath < BadConsequence

    public_class_method :new

    def initialize(text, death)
      super(text, 0, death)
    end

    def isEmpty
      @death==false
    end

    def substractHiddenTreasure(t)
    end

    def substractHiddenTreasure(t)
    end

    def adjustToFitTreasureLists(v, h)
      self
    end

    def to_s
      @textoIntroduccion + "\n\tTexto = " + @text.to_s + "\n\tDeath = " + @death.to_s # return
    end

  end
end