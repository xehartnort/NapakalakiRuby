#!/usr/bin/env ruby
# encoding: UTF-8

# Sazonar a gusto
#require_relative 'TreasureKind.rb'
#require_relative 'Prize.rb'
#require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'

# ¡¡¡¡¡¡¡¡ ATENCIÓN !!!!!!!!
# -En la práctica 3 hay que usar constructores diferentes a new para 
# los objetos BadConsequence, estos cambios ya están añadidos
# -Para evitar problemas de sincronización con dropbox, trabajar con copias
# y luego pegar los cambios en este fichero





#Plantilla de los monstruos al final del método

  # max = Máximo número de objetos
  def initializeMonstruos(max)
    # Array con las cartas de los monstruos
    monstruos = Array.new
    
    
    # 3 Byakhees de bonanza
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu armadura visible y\n" +
                                        "otra oculta\n",0,
                                        [TreasureKind::ARMOR], 
                                        [TreasureKind::ARMOR])
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
  
  
    # Chibithulhu
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Embobados con el lindo\n" +
                                                        "primigenio te descartas de tu casco\n" +
                                                        "visible\n",0, 
                                                        [TreasureKind::HELMET], 
                                                        Array.new)
    prize = Prize.new(1, 1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Chibithulhu", 2, badConsequence, prize)
  
  
    # El sopor de Dunwich
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("El primordial bostezo contaguioso.\n" +
                                                        "Pierdes el calzado visible\n",0, 
                                                        [TreasureKind::HELMET], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
  
    
    # Ángeles de la noche ibicenca
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Te atrapan para llevarte de fiesta\n" +
                                                        "y te dejan car en mitad del vuelo.\n" +
                                                        "Descarta 1 mano visible y 1 mano oculta\n",0,
                                                        [TreasureKind::ONEHAND], 
                                                        [TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)
  
    
    # El gorrón en el umbral
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesores visibles.\n", 
                                                        max, 0)
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
  
    
    # H.P. Munchcraft
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes la armadura visible.\n",
                                                        0, [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
  
    
    # Bichgooth
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Sientes bichos bajo la ropa.\n" +
                                                        "Descarta la armadura visible\n",0,
                                                        [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles\n",
                                                        5, 3, 0)
    prize = Prize.new(4,2)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Toses los pulmones y\n"+
                                                        "pierdes 2 niveles\n",
                                                        2, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("La que redacta en las tinieblas\n", 2, 
                              badConsequence, prize)
  
  
    #Los hondos
    badConsequence = BadConsequence.newDeath("Estos monstruos resultan \n"+
                                            "bastante superficiales y te aburren \n"+
                                            "mortalmente. Estas muerto\n")
    prize = Prize.new(2,1)
    
    monstruos << Monster.new("Los hondos", 8 ,badConsequence,prize)
    
    #Semillas Cthulhu
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 2 niveles y 2 \n"+
                                                        "tesoros ocultos\n", 2, 0, 2)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)
   
   #Dameargo
   badConsequence = BadConsequence.newSpecificTreasures("Te intentas escaquear.\n"+
                                                        " Pierdes una mano visible\n",0,
                                                        TreasureKind::ONEHAND,
                                                        Array.new)
   prize = Prize.new(2,1)
   # Añade un nuevo monstruo al final del array
   monstruos << Monster.new("Dameargo", 1, badConsequence, prize)

    #Pollipólipo volante
    badConsequence = BadConsequence.newNumberOfTreasures("Da mucho asquito.\n"+
                                                        " Pierdes 3 niveles\n", 
                                                        3, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Pollipólipo volante", 3, badConsequence, prize)
    
    #Yskhtihyssq-Goth
    badConsequence = BadConsequence.newDeath("No le hace gracia que\n"+
                                            " pronuncien mal su nombre. Estas\n"+
                                            " muerto\n")
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Yskhtihyssq-Goth", 12, badConsequence, prize)
    
    
    #Familia feliz
    badConsequence = BadConsequence.newDeath("La familia te atrapa.\n"+
                                            "Estas muerto\n")
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("Familia feliz", 1, badConsequence, prize)



=begin PLANTILLA
    # Nombre del monstruo
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.[const específico]("DESCRIPCION", nivelesQueQuita, 
                                        [TreasureKind::XXXXX, TreasureKind::XXXXX, ...], 
                                        [TreasureKind::XXXXX, TreasureKind::XXXXX, ...])
    prize = Prize.new(Tesoros,Niveles)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("NOMBRE", nivel, badConsequence, prize)
=end

    return monstruos
  end