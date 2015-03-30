#!/usr/bin/env ruby
#encoding: UTF-8
# 
# 
# ó $KCODE = 'u'



#Descomentar para aquellas clases que ya existan también hacerlo en Cartas.rb ;)
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb' #require_relative -> respecto al path actual
require_relative 'Cartas.rb'         #Solo se realiza una vez aunque lo escribas 15 

class PruebaNapakalaki
  def self.main()
    cartitas=Cartas.new(10) #maximo número de objetos 10
#    puts "Todos los monstros con un nivel de combate > 10 "
#    PruebaNapakalaki.combatLevelGreaterThanTen(cartitas.monstruos)
#    
#    puts "Tdos los monstros que quitan una mano visible u oculta"
#    PruebaNapakalaki.onlyONEHAND(cartitas.monstruos)
#    
#    puts "Su buen rollo indique una ganancia de niveles superior a 1"
#    PruebaNapakalaki.levelPrizeGreatterThanOne(cartitas.monstruos)
#
    puts "Solo tiene por mal rollo la perdida de niveles"
    PruebaNapakalaki.onlyLevels(cartitas.monstruos)
    
  end
  
  #Mostrar todos los monstruos que tengas un nivel de combate superior a 10
  def self.combatLevelGreaterThanTen(monsterArray)
    monsterArray.each do |m| 
        if(m.combatLevel > 10)
          print m
        end
      end
  end
  
  #Mostrar todos los monstruos que tengan un mal rollo que implique sólo pérdida de niveles
  def self.onlyLevels(monsterArray)
    monsterArray.each do |m|
      if m.bc.death==false && 
         (m.bc.specificVisibleTreasures.empty? && m.bc.specificHiddenTreasures.empty?) && 
         ( m.bc.nVisibleTreasures==0 && m.bc.nHiddenTreasures==0)
        print m
      end
    end
  end
#  Su buen rollo indique una ganancia de niveles superior a 1
  def self.levelPrizeGreatterThanOne(monsterArray)
    monsterArray.each do |m|
      if m.prize.levels > 1
         print m
      end
    end
  end
# Su mal rollo solo supone la perdida de un ONEHAND
  def self.onlyONEHAND(monsterArray)
    monsterArray.each do |m|
      if m.bc.specificHiddenTreasures.include?(TreasureKind::ONEHAND) ||
         m.bc.specificHiddenTreasures.include?(TreasureKind::ONEHAND)
       print m
      end
    end
  end
  
end
PruebaNapakalaki.main
  
