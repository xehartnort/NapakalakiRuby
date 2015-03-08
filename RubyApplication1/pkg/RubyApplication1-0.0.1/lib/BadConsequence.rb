#!/usr/bin/env ruby
# encoding: UTF-8

class BadConsequence
  
  ########## Constructores ##########
  
  def initialize(text, levels, nVisibleTreasures, nHiddenTreasures, death, specificVisibleTreasures, specificHiddenTreasures)
    @text = text
    @levels = levels
    @nVisibleTreasures = nVisibleTreasures
    @nHiddenTreasures = nHiddenTreasures
    @death = death
    @specificVisibleTreasures = specificVisibleTreasures
    @specificHiddenTreasures = specificHiddenTreasures
  end
=begin
  # Primera implementación posible de constructores, cada constructor tiene un nombre distinto
  # ¿Sugerencias para nombres de constructores?
  def self.newBadConsequence1(text, levels, nVisible, nHidden) 
    new(text, levels, nVisible, nHidden, false, Array.new(0, nil), Array.new(0, nil))
  end
  
  def self.newBadConsequence2(text, death)
    new(text, 0, 0, 0, death, Array.new(0, nil), Array.new(0, nil))
  end
  
  def self.newBadConsequence3(text, levels, tVisible, tHidden)
    new(text, levels, 0, 0, false, tVisible, tHidden)
  end
=end
  
#=begin
  # "Constructor inteligente"
  def self.newBadConsequence(*args)
    case args.size
    when 4
      #Si los argumentos 2 y 3 son arrays (empezando desde 0)
      if [2].kind_of?(Array) && args[3].kind_of?(Array) 
        #args[0]=text, args[1]=levels, args[2]=tVisible, args[3]=tHidden
        new(args[0], args[1], 0, 0, false, args[2], args[3])
      else 
        #args[0]=text, args[1]=levels, args[2]=nVisibleTreasures, args[3]=nHiddenTreasures
        new(args[0], args[1], args[2], args[3], false, Array.new(0, nil), Array.new(0, nil))
      end
    when 2
      #args[0]=text, args[1]=death
      new(args[0], 0, 0, 0, args[1], Array.new(0, nil), Array.new(0, nil))
    else 
      #Caso por defecto
      puts "Constructor error: Incorrect number of args " + args.size.to_s # o una excepción
    end
  end
#=end  

#{NO FUNCIONA} BadConsequence.method :new ~ deshabilita el uso de initialize [new], los únicos constructores son/es newBadConsequence1,2,3/newBC
  
  ########## Getters ruby ##########
  
  attr_reader :text, :levels, :nVisible, :nHidden, :death, :specificHiddenTreasures, :specificVisibleTreasures 
  
=begin
  ########## Getters estilo Java ##########
  def text
    @text
  end
  
  def levels
    @levels
  end
  
  def nVisibleTreasures
    @nVisibleTreasures
  end
  
  def nHiddenTreasures
    @nHiddenTreasures
  end
  
  def death
    @death
  end
=end
  
  def to_s
    textoInicial = "\n\tTexto = " + @text.to_s + 
         "\n\tLevels = " + @levels.to_s +
         "\n\tNumber of Visible Treasures = " + @nVisibleTreasures.to_s +
         "\n\tNumber of Hidden Treasures = " + @nHiddenTreasures.to_s +
         "\n\tDeath = " + @death.to_s
    textoArrayVisibleTreasures = " \n\tArray Specific Visible Treasures: "
    textoArrayHiddenTreasures = " \n\tArray Specific Hidden Treasures: "
    
    if !@specificVisibleTreasures.empty?
      for @specificVisibleTreasures in 0..@specificVisibleTreasures.size do
        textoArrayVisibleTreasures += (@specificVisibleTreasures.to_s + " ")
      end
    else  
      textoArrayVisibleTreasures += "No pierde ningún tesoro específico."
    end
    
    if !@specificHiddenTreasures.empty?
      for @specificHiddenTreasures in 0..@specificHiddenTreasures.size do
        textoArrayHiddenTreasures += (@specificHiddenTreasures.to_s + " ")
      end
    else
      textoArrayHiddenTreasures += "No pierde ningún tesoro específico."
    end
    
    return textoInicial + textoArrayVisibleTreasures + textoArrayHiddenTreasures 
  end
  
end

