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
    malaCosa = BadConsequence.newDeath("Es telible")
    print malaCosa # en lugar de poner puts malaCosa.to_s, con print ya se invoca a este método
  end
  
  #Mostrar todos los monstruos que tengas un nivel de combate superior a 10
  def combatLevelGreaterThanTen(monsterArray)
    resultado = Array.new  
    monsterArray.each do |m| 
        if(m.combatLevel < 10)
          resultado.push(m)
        end
      end
    return resultado
  end
  
  #Mostrar todos los monstruos que tengan un mal rollo que implique sólo pérdida de niveles
#  def onlyLevels(monsterArray)
#    resultado = Array.new
#    monsterArray.each do |m|
#      m.bc. 
#    end
#    return resultado
#  end
    
end
PruebaNapakalaki.main
  
