# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'BadConsequence'
module Model
  class BCSpecificTreasures < BadConsequence

    public_class_method :new

    def initialize(text, levels, specificVisibleTreasures, specificHiddenTreasures)
      super(text, levels, false)
      @specificVisibleTreasures = specificVisibleTreasures
      @specificHiddenTreasures = specificHiddenTreasures
    end

    def substractVisibleTreasure(t)#Treasure t
        if @specificVisibleTreasures.count(t.type)==1 #Si hay solo uno
          @specificVisibleTreasures.delete(t.type)
        else # si hay más de uno, sólo borramos el primero
          i = @specificVisibleTreasures.find_index(t.type)
          @specificVisibleTreasures.delete_at(i)
        end
    end

    def substractHiddenTreasure(t)#Treasure t
        if @specificHiddenTreasures.count(t.type)==1 #Si hay solo uno
          @specificHiddenTreasures.delete(t.type)
        else # si hay más de uno, sólo borramos el primero
          i = @specificHiddenTreasures.find_index(t.type)
          @specificHiddenTreasures.delete_at(i)
        end
    end

    def isEmpty
      @levels==0 &&
        @specificVisibleTreasures.empty? &&
        @specificHiddenTreasures.empty?
    end


    def adjustToFitTreasureLists(v, h)
      newVisibleTreasuresBad = Array.new
      newHiddenTreasuresBad = Array.new
      copyOfspecificVisibleTreasures = @specificVisibleTreasures.clone
      copyOfspecificHiddenTreasures = @specificHiddenTreasures.clone

      v.each do |t|
        if copyOfspecificVisibleTreasures.include? t.type
          index = copyOfspecificVisibleTreasures.index(t.type)
          puts index
          copyOfspecificVisibleTreasures.delete_at(index)
          newVisibleTreasuresBad << t.type
        end
      end

      h.each do |t|
        if copyOfspecificHiddenTreasures.include? t.type
          index = copyOfspecificHiddenTreasures.index(t.type)
          puts index
          copyOfspecificHiddenTreasures.delete_at(index)
          newHiddenTreasuresBad << t.type
        end
      end
      BCSpecificTreasures.new(@text, 0, newVisibleTreasuresBad, newHiddenTreasuresBad) #return
    end

    def to_s
      textoInicial = "\n\tTexto = " + @text.to_s + 
        "\n\tLevels = " + @levels.to_s +
      textoArrayVisibleTreasures = " \n\tArray Specific Visible Treasures: "
      textoArrayHiddenTreasures = " \n\tArray Specific Hidden Treasures: "
      textoArrayVisibleTreasures += @specificVisibleTreasures.to_s
      textoArrayHiddenTreasures += @specificHiddenTreasures.to_s 

      @textoIntroduccion+textoInicial+textoArrayVisibleTreasures+textoArrayHiddenTreasures #return
    end
  end

end