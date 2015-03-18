#!/usr/bin/env ruby
# encoding:UTF-8

require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'

class Cartas
#Plantilla de los monstruos al final del método
  attr_reader :monstruos
  # max = Máximo número de objetos
  def initialize(max)
    # Array con las cartas de los monstruos
    @monstruos = Array.new
    
    
    # 3 Byakhees de bonanza
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu armadura visible y" +
                                        "otra oculta",0,
                                        [TreasureKind::ARMOR], 
                                        [TreasureKind::ARMOR])
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
  
  
    # Chibithulhu
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Embobados con el lindo" +
                                                        "primigenio te descartas de tu casco" +
                                                        "visible",0, 
                                                        [TreasureKind::HELMET], 
                                                        Array.new)
    prize = Prize.new(1, 1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Chibithulhu", 2, badConsequence, prize)
  
  
    # El sopor de Dunwich
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("El primordial bostezo contaguioso." +
                                                        "Pierdes el calzado visible",0, 
                                                        [TreasureKind::HELMET], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
  
    
    # Ángeles de la noche ibicenca
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Te atrapan para llevarte de fiesta" +
                                                        "y te dejan car en mitad del vuelo." +
                                                        "Descarta 1 mano visible y 1 mano oculta",0,
                                                        [TreasureKind::ONEHAND], 
                                                        [TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)
  
    
    # El gorrón en el umbral
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesores visibles.", 
                                                        1, max, 0)
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
  
    
    # H.P. Munchcraft
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes la armadura visible.",
                                                        0, [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
  
    
    # Bichgooth
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Sientes bichos bajo la ropa." +
                                                        "Descarta la armadura visible",0,
                                                        [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",
                                                        5, 3, 0)
    prize = Prize.new(4,2)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Toses los pulmones y"+
                                                        "pierdes 2 niveles",
                                                        2, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("La que redacta en las tinieblas\n", 2, 
                              badConsequence, prize)
  
  
    #Los hondos
    badConsequence = BadConsequence.newDeath("Estos monstruos resultan "+
                                            "bastante superficiales y te aburren "+
                                            "mortalmente. Estas muerto")
    prize = Prize.new(2,1)
    
    @monstruos << Monster.new("Los hondos", 8 ,badConsequence,prize)
    
    #Semillas Cthulhu
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 2 niveles y 2 "+
                                                        "tesoros ocultos", 2, 0, 2)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)
   
   #Dameargo
   badConsequence = BadConsequence.newSpecificTreasures("Te intentas escaquear."+
                                                        " Pierdes una mano visible",0,
                                                        [TreasureKind::ONEHAND],
                                                        Array.new)
   prize = Prize.new(2,1)
   # Añade un nuevo monstruo al final del array
   @monstruos << Monster.new("Dameargo", 1, badConsequence, prize)

    #Pollipólipo volante
    badConsequence = BadConsequence.newNumberOfTreasures("Da mucho asquito."+
                                                        " Pierdes 3 niveles", 
                                                        3, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Pollipólipo volante", 3, badConsequence, prize)
    
    #Yskhtihyssq-Goth
    badConsequence = BadConsequence.newDeath("No le hace gracia que"+
                                            " pronuncien mal su nombre. Estas"+
                                            " muerto")
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Yskhtihyssq-Goth", 12, badConsequence, prize)
    
    
    #Familia feliz
    badConsequence = BadConsequence.newDeath("La familia te atrapa."+
                                            "Estas muerto")
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Familia feliz", 1, badConsequence, prize)
    
    #Roboggoth
    badConsequence = BadConsequence.newSpecificTreasures("La quinta directiva " +
                                                         "primaria te obliga a perder 2 niveles y" +
                                                         " un tesoro 2 manos visible.",2,
                                                         [TreasureKind::ONEHAND,TreasureKind::ONEHAND],
                                                         Array.new)
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    @monstruos << Monster.new("Roboggoth", 8, badConsequence, prize)
    
    #El espia
    badConsequence = BadConsequence.newSpecificTreasures("Te asusta en la noche." +
                                                      "Pierdes un casco visible.",0,
                                                      [TreasureKind::HELMET], Array.new)
    prize = Prize.new(1, 1)
    @monstruos << Monster.new("El espia", 5, badConsequence, prize)
  
    #El lenguas
    badConsequence = BadConsequence.newNumberOfTreasures("Menudo susto te llevas."+
                                                         "Pierdes 2 niveles y 5 tesoros visibles.",
                                                         2,5,0)
    prize = Prize.new(1, 1)
    @monstruos << Monster.new("El lenguas", 20, badConsequence, prize)
  
    #Bicéfalo
    badConsequence = BadConsequence.newNumberOfTreasures("Te faltan manos para" +
                                                         "tanta cabeza. Pierdes 3 niveles y tus" +
                                                         "tesoros visibles de las manos.",
                                                         3,max,0)
    prize = Prize.new(1, 1)
    @monstruos << Monster.new("Bicéfalo", 20, badConsequence, prize)

  end

end