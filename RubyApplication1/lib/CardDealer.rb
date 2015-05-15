#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'Treasures.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'Prize.rb'
require 'singleton'

module Model
class CardDealer
  include Singleton #Alé y a pastá
  
  def initTreasureCardDeck
    @usedTreasures = Array.new
    @unusedTreasures = Array.new
    @unusedTreasures<< Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)
    @unusedTreasures<< Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("A prueba de babas", 400, 2, 5, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Botas de lluvia ácida", 800, 1, 1, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Casco minero", 400, 2, 4, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Ametralladora Thompson", 600, 4, 8, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Camiseta de la UGR", 100, 1, 7, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Clavo de rail ferroviario", 400, 3, 6, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Cuchillo de sushi arcano", 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Fez alópodo", 700, 3, 5, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Hacha prehistórica", 500, 2, 5, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("El aparato del Pr. Tesla", 900, 4, 8, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Gaita", 500, 4, 5, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Insecticida", 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Escopeta de 3 cañones", 700, 4, 6, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Garabato místico", 300, 2, 2, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("La fuerza de Mr. T", 1000, 0, 0, TreasureKind::NECKLACE)
    @unusedTreasures<< Treasure.new("La rebeca metálica", 400, 2, 3, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Mazo de los antiguos", 200, 3, 4, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Necro-playboycon", 300, 3, 5, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Lanzallamas", 800, 4, 8, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Necro-comicón", 100, 1, 1, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Necronomicón", 800, 5, 7, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Linterna a 2 manos", 400, 3, 6, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Necro-gnomicón", 200, 2, 4, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Necrotelecom", 300, 2, 3, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Porra preternatural", 200, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Tentácula de pega", 200, 0, 1, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Zapato deja-amigos", 500, 0, 1, TreasureKind::SHOE)
    @unusedTreasures<< Treasure.new("Shogulador", 600, 1, 1, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Varita de atizamiento", 400, 3, 4, TreasureKind::ONEHAND)
  
  end

  def initMonsterCardDeck
    @usedMonsters = Array.new
    @unusedMonsters = Array.new
    # 3 Byakhees de bonanza
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCSpecificTreasures.new("Pierdes tu armadura visible y" +
                                        "otra oculta",0,
                                        [TreasureKind::ARMOR], 
                                        [TreasureKind::ARMOR])
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
  
  
    # Chibithulhu
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCSpecificTreasures.new("Embobados con el lindo" +
                                                        "\n\tprimigenio te descartas de tu casco" +
                                                        "\n\tvisible",0, 
                                                        [TreasureKind::HELMET], 
                                                        Array.new)
    prize = Prize.new(1, 1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Chibithulhu", 2, badConsequence, prize)
  
  
    # El sopor de Dunwich
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCSpecificTreasures.new("El primordial bostezo contaguioso." +
                                                        "\n\tPierdes el calzado visible",0, 
                                                        [TreasureKind::HELMET], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
  
    
    # Ángeles de la noche ibicenca
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCSpecificTreasures.new("Te atrapan para llevarte de fiesta" +
                                                        "\n\ty te dejan car en mitad del vuelo." +
                                                        "\n\tDescarta 1 mano visible y 1 mano oculta",0,
                                                        [TreasureKind::ONEHAND], 
                                                        [TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)
  
    
    # El gorrón en el umbral
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCNumberOfTreasures.new("Pierdes todos tus tesoros visibles.", 
                                                        1, 9999, 0)
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
  
    
    # H.P. Munchcraft
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCSpecificTreasures.new("Pierdes la armadura visible.",
                                                        0, [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
  
    
    # Bichgooth
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCSpecificTreasures.new("Sientes bichos bajo la ropa." +
                                                        "\n\tDescarta la armadura visible",0,
                                                        [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCNumberOfTreasures.new("Pierdes 5 niveles y 3 tesoros visibles",
                                                        5, 3, 0)
    prize = Prize.new(4,2)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BCNumberOfTreasures.new("Toses los pulmones y"+
                                                        "\n\tpierdes 2 niveles",
                                                        2, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("La que redacta en las tinieblas\n", 2, 
                              badConsequence, prize)
  
  
    #Los hondos
    badConsequence = BCDeath.new("Estos resultan "+
                                            "\n\tbastante superficiales y te aburren "+
                                            "\n\tmortalmente. Estas muerto")
    prize = Prize.new(2,1)
    
    @unusedMonsters << Monster.new("Los hondos", 8 ,badConsequence,prize)
    
    #Semillas Cthulhu
    badConsequence = BCNumberOfTreasures.new("Pierdes 2 niveles y 2 "+
                                                        "\n\ttesoros ocultos", 2, 0, 2)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)
   
   #Dameargo
   badConsequence = BCSpecificTreasures.new("Te intentas escaquear."+
                                                        "\n\tPierdes una mano visible",0,
                                                        [TreasureKind::ONEHAND],
                                                        Array.new)
   prize = Prize.new(2,1)
   # Añade un nuevo monstruo al final del array
   @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)

    #Pollipólipo volante
    badConsequence = BCNumberOfTreasures.new("Da mucho asquito."+
                                                        "\n\tPierdes 3 niveles", 
                                                        3, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize)
    
    #Yskhtihyssq-Goth
    badConsequence = BCDeath.new("No le hace gracia que"+
                                            "\n\tpronuncien mal su nombre. Estas"+
                                            "\n\tmuerto")
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Yskhtihyssq-Goth", 12, badConsequence, prize)
    
    
    #Familia feliz
    badConsequence = BCDeath.new("La familia te atrapa."+
                                            "\n\tEstas muerto")
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)
    
    #Roboggoth
    badConsequence = BCSpecificTreasures.new("La quinta directiva " +
                                                         "\n\tprimaria te obliga a perder 2 niveles y" +
                                                         "\n\tun tesoro 2 manos visible.",2,
                                                         [TreasureKind::ONEHAND,TreasureKind::ONEHAND],
                                                         Array.new)
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize)
    
    #El espia
    badConsequence = BCSpecificTreasures.new("Te asusta en la noche." +
                                                      "\n\tPierdes un casco visible.",0,
                                                      [TreasureKind::HELMET], Array.new)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El espia", 5, badConsequence, prize)
  
    #El lenguas
    badConsequence = BCNumberOfTreasures.new("Menudo susto te llevas."+
                                                         "\n\tPierdes 2 niveles y 5 tesoros visibles.",
                                                         2,5,0)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El lenguas", 20, badConsequence, prize)
  
    #Bicéfalo
    badConsequence = BCNumberOfTreasures.new("Te faltan manos para" +
                                                         "\n\ttanta cabeza. Pierdes 3 niveles y tus" +
                                                         "\n\ttesoros visibles de las manos.",
                                                         3,9999,0)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("Bicéfalo", 20, badConsequence, prize)

  end
  
  def shuffleTreasures
#    barajada = Array.new(@unusedTreasures.length)
#    @unusedTreasures.each do |t| 
#      barajada.insert(Random.rand(0...@unusedTreasures.length), t)
#    end
#    @unusedTreasures = barajada
  @unusedTreasures.shuffle!
  #@unusedTreasures  = @unusedTreasures.sort_by { rand }
  
  end

  def shuffleMonsters
#    barajada = Array.new(@unusedMonsters.length)
#    @unusedMonsters.each do |m| 
#      barajada.insert(Random.rand(0...@unusedMonsters.length), m)
#    end
#    @unusedMonsters = barajada
  @unusedMonsters.shuffle!
  #@unusedMonsters  = @unusedMonsters.sort_by { rand }
  end
  
  private :shuffleMonsters, :shuffleTreasures, :initMonsterCardDeck, :initTreasureCardDeck
  
  def nextTreasure()
    if @unusedTreasures.empty?
      @usedTreasures.shuffle!
      @unusedTreasures = @usedTreasures.clone
      @usedTreasures.clear
    end
      treasure = @unusedTreasures.pop
      @usedTreasures << treasure
      treasure #return
  end
  
  def nextMonster()
    if @unusedMonsters.empty?
      @usedMonsters.shuffle!
      @unusedMonsters = @usedMonsters.clone #Funciona porque copia la referencias de un nivel
      @usedMonsters.clear
    end
    monster = @unusedMonsters.pop
    @usedMonsters << monster
    monster #return
  end
  
  def initCards
    initMonsterCardDeck
    initTreasureCardDeck
    shuffleMonsters
    shuffleTreasures
  end
  
  def giveTreasureBack(t)
    @usedTreasures << t
    @unusedTreasures.delete(t)
  end
  
  def giveMonsterBack(m)
    @usedMonsters << m
    @unusedMonsters.delete(m)
  end
  
end

end