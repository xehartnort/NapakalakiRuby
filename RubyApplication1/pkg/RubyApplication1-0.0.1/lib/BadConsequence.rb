#!/usr/bin/env ruby
# encoding: UTF-8

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
  #=begin
  # Primera implementación posible de constructores, cada constructor tiene un nombre distinto
  # ¿Sugerencias para nombres de constructores? 
  # SOLUCIONADO -> Las prácticas dan el nombre y todo
  def self.newNumberOfTreasures(text, levels, nVisible, nHidden) 
    new(text, levels, nVisible, nHidden, Array.new(0, nil), Array.new(0, nil), false)
  end
  
  def self.newDeath(text)
    new(text, 0, 0, 0, Array.new(0, nil), Array.new(0, nil), true)
  end
  
  def self.newSpecificTreasures(text, levels, tVisible, tHidden)
    new(text, levels, 0, 0, tVisible, tHidden, false)
  end
#=end
  
=begin
  # "Constructor inteligente"
  def self.newBadConsequence(*args)
    case args.size
    when 4
      # Si los argumentos 2 y 3 son arrays (empezando desde 0)
      if [2].kind_of?(Array) && args[3].kind_of?(Array) 
        #args[0]=text, args[1]=levels, args[2]=tVisible, args[3]=tHidden
        new(args[0], args[1], 0, 0, args[2], args[3], false)
      else 
        #args[0]=text, args[1]=levels, args[2]=nVisibleTreasures, args[3]=nHiddenTreasures
        new(args[0], args[1], args[2], args[3], Array.new(0, nil), Array.new(0, nil), false)
      end
    when 2
      #args[0]=text, args[1]=death
      new(args[0], 0, 0, 0, Array.new(0, nil), Array.new(0, nil), args[1])
    else 
      # Caso por defecto
      print "BadConsequence constructor error: Incorrect number of args: ", args.size, "\n" # o una excepción
    end
  end
=end  

  private_class_method :new # Efecto Wert, privatiza el método new
  
########## Getters ruby ##########
  
  attr_reader :text, :levels, :nVisible, :nHidden, :death, :specificHiddenTreasures, :specificVisibleTreasures 
  
  def to_s
    textoInicial = "\n\tTexto = " + @text.to_s + 
         "\n\tLevels = " + @levels.to_s +
         "\n\tNumber of Visible Treasures = " + @nVisibleTreasures.to_s +
         "\n\tNumber of Hidden Treasures = " + @nHiddenTreasures.to_s +
         "\n\tDeath = " + @death.to_s
    textoArrayVisibleTreasures = " \n\tArray Specific Visible Treasures: "
    textoArrayHiddenTreasures = " \n\tArray Specific Hidden Treasures: "
    
    unless @specificVisibleTreasures.empty?
#      Este bloque comentado no hace lo que parece, no itera sobre el array      
#      for @specificVisibleTreasures in 0..@specificVisibleTreasures.size do
#        textoArrayVisibleTreasures += (@specificVisibleTreasures.to_s + " ")
#      end
#      Este que está a continuación sí
# =>  Para cada componente del array(each) hace (do) con cada componente 
#     (|tesoro|) las senticas  
      @specificVisibleTreasures.each do |tesoro|
        textoArrayVisibleTreasures += (tesoro.to_s + " ")
      end
    else  
      textoArrayVisibleTreasures += "No pierde ningún tesoro específico."
    end
    
    unless @specificHiddenTreasures.empty?
#      Este bloque comentado no hace lo que parece, no itera sobre el array
#      for @specificHiddenTreasures in 0..@specificHiddenTreasures.size do
#        textoArrayHiddenTreasures += (@specificHiddenTreasures.to_s + " ")
#      end
#      Este que está a continuación sí
# =>  Para cada componente(|tesoro|) del array(each) hace (do) ... (end)
      @specificHiddenTreasures.each do |tesoro|
        textoArrayHiddenTreasures += (tesoro.to_s + " ")
      end
    else
      textoArrayHiddenTreasures += "No pierde ningún tesoro específico."
    end
    
    return textoInicial + textoArrayVisibleTreasures + textoArrayHiddenTreasures 
  end
  
end

