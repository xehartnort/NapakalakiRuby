#!/usr/bin/env ruby
# encoding: UTF-8
require_relative 'Treasures.rb'

class BadConsequence
  
  ########## Constructores ##########
  
  def initialize(text, levels, nVisibleTreasures, nHiddenTreasures, specificVisibleTreasures, specificHiddenTreasures, death)
    @text = text
    @levels = levels
    @nVisibleTreasures = nVisibleTreasures
    @nHiddenTreasures = nHiddenTreasures
    @death = death
    @specificVisibleTreasures = specificVisibleTreasures
    @specificHiddenTreasures = specificHiddenTreasures
  end
  
  def self.newNumberOfTreasures(text, levels, nVisible, nHidden) 
    new(text, levels, nVisible, nHidden, Array.new, Array.new, false)
  end
  
  def self.newDeath(text)
    new(text, 0, 0, 0, Array.new, Array.new, true)
  end
  
  def self.newSpecificTreasures(text, levels, tVisible, tHidden)
    new(text, levels, 0, 0, tVisible, tHidden, false)
  end
  
  private_class_method :new # Efecto Wert, privatiza el método new
  
########## Getters ruby ##########
  
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures 
    
  def kills
    @death
  end
  
  def substractVisibleTreasure(t)#Treasure t
    if @nVisibleTreasures==0
      @specificVisibleTreasures.delete(t.type)
    else
      @nVisibleTreasures = (@nVisibleTreasures-1) < 0 ? 0 : @nVisibleTreasures-1 ;
#     Exactamente igual que en java, if else compacto
    end
  end
  
  def substractHiddenTreasure(t)#Treasure t
    if @nHiddenTreasures==0
      @specificHiddenTreasures.delete(t.type)
    else
      @nHiddenTreasures = (@nHiddenTreasures-1) < 0 ? 0 : @nHiddenTreasures-1 ;
#     Exactamente igual que en java, if else compacto
    end
  end
 
  def isEmpty
    return @levels==0 &&
           @nVisibleTreasures==0 &&
           @nHiddenTreasures==0 && 
           @specificVisibleTreasures.empty? &&
           @specificHiddenTreasures.empty? &&
           !@death
  end
#  Tengo aún que asegurar que la implementación en Java funciona correctamentes
#  def adjustToFitTreasureLists(v, h)#v:Treasure[], h:Treasure[]
#    
#  end
  
  def to_s
    textoInicial = "\n\tTexto = " + @text.to_s + 
         "\n\tLevels = " + @levels.to_s +
         "\n\tNumber of Visible Treasures = " + @nVisibleTreasures.to_s +
         "\n\tNumber of Hidden Treasures = " + @nHiddenTreasures.to_s +
         "\n\tDeath = " + @death.to_s
    textoArrayVisibleTreasures = " \n\tArray Specific Visible Treasures: "
    textoArrayHiddenTreasures = " \n\tArray Specific Hidden Treasures: "
    
    unless @specificVisibleTreasures.empty?  
      @specificVisibleTreasures.each do |tesoro|
        textoArrayVisibleTreasures += (tesoro.to_s + " ")
      end
    else  
      textoArrayVisibleTreasures += "No pierde ningún tesoro específico."
    end
    
    unless @specificHiddenTreasures.empty?
      @specificHiddenTreasures.each do |tesoro|
        textoArrayHiddenTreasures += (tesoro.to_s + " ")
      end
    else
      textoArrayHiddenTreasures += "No pierde ningún tesoro específico."
    end
    
    return textoInicial + textoArrayVisibleTreasures + textoArrayHiddenTreasures 
  end
  
end

