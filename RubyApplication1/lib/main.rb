#!/usr/bin/env ruby
# encoding: UTF-8

  # max = Máximo número de objetos
  def initialize(max)
    # Array con las cartas de los monstruos
    monstruos = Array.new(0, Monster)
    
    
    # 3 Byakhees de bonanza
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Pierdes tu armadura visible y" + 
                                        "otra oculta.", 0, 
                                        [TreasureKind.ARMOR], 
                                        [TreasureKind.ARMOR])
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
  
  
    # Chibithulhu
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Embobados con el lindo" +
                                        "primigenio te descartas de tu casco" +
                                        "visible.", 0, 
                                        [TreasureKind.HELMET], 
                                        Array.new)
    prize = Prize.new(1, 1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Chibithulhu", 2, badConsequence, prize)
  
  
    # El sopor de Dunwich
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("El primordial bostezo contaguioso." +
                                        "Pierdes el calzado visible.", 0, 
                                        [TreasureKind.HELMET], 
                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
  
    
    # Ángeles de la noche ibicenca
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Te atrapan para llevarte de fiesta" +
                                        "y te dejan car en mitad del vuelo." +
                                        "Descarta 1 mano visible y 1 mano oculta.",
                                        0, 
                                        [TreasureKind.ONEHAND], 
                                        [TreasureKind.ONEHAND])
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)
  
    
    # El gorrón en el umbral
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Pierdes todos tus tesores visibles.", 0, 
                                        max, 0)
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
  
    
    # H.P. Munchcraft
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Pierdes la armadura visible.", 0, 
                                        [TreasureKind.ARMOR], 
                                        Array.new)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
  
    
    # Bichgooth
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Sientes bichos bajo la ropa. " +
                                        "Descarta la armadura visible.", 0, 
                                        [TreasureKind.ARMOR], 
                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles.",
                                        5, 3, 0)
    prize = Prize.new(4,2)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("Toses los pulmones y pierdes 2 niveles",
                                        2, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("La que redacta en las tinieblas", 2, 
                              badConsequence, prize)
  
=begin PLANTILLA
    # Nombre del monstruo
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.new("DESCRIPCION", nivelesQueQuita, 
                                        [TreasureKind.XXXXX, TreasureKind.XXXXX, ...], 
                                        [TreasureKind.XXXXX, TreasureKind.XXXXX, ...])
    prize = Prize.new(Tesoros,Niveles)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("NOMBRE", nivel, badConsequence, prize)
=end
    return monstruos
  end


#Descomentar para aquellas clases que ya existan :)
#require_relative 'TreasureKind.rb'
#require_relative 'Prize.rb'
#require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'


malaCosa = BadConsequence.newBadConsequence("Es telible",false,7,16)
puts malaCosa.to_s
