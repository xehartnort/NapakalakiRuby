# enconding
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#EXAMEN

require_relative 'Player.rb'
require_relative 'CultistPlayer.rb'
require_relative 'Cultist.rb'
require_relative 'CardDealer.rb'
require_relative 'Card.rb'
require_relative 'BadConsequence.rb'
require_relative 'BCDeath.rb'
require_relative 'BCNumberOfTreasures.rb'
require_relative 'BCSpecificTreasures.rb'

module Model
  
class Examen4
  
  def initialize
    
  end
  
  def self.run
    p = Player.new("Paul")
    
    p.setHiddenTreasureList([Treasure.new("Varita de atizamiento", 400, 3, 4, TreasureKind::ONEHAND), 
                            Treasure.new("Linterna a 2 manos", 400, 3, 6, TreasureKind::BOTHHANDS),
                            Treasure.new("Porra preternatural", 200, 2, 3, TreasureKind::ONEHAND)])
    
    p.makeTreasureVisible(p.getHiddenTreasures.at(1))
    p.makeTreasureVisible(p.getHiddenTreasures.at(2))
    p.makeTreasureVisible(p.getHiddenTreasures.at(3))
    puts p.to_s
    
    p2 = Player.new("Anne")
    
    p2.setHiddenTreasureList([Treasure.new("La rebeca metalica", 400, 2, 3, TreasureKind::ARMOR),
                             Treasure.new("Camiseta de la UGR", 100, 1, 7, TreasureKind::ARMOR),
                             Treasure.new("La fuerza de Mr. T", 1000, 0, 0, TreasureKind::NECKLACE)])
    
    p2.makeTreasureVisible(p2.getHiddenTreasures.at(1))
    p2.makeTreasureVisible(p2.getHiddenTreasures.at(2))
    p2.makeTreasureVisible(p2.getHiddenTreasures.at(3))
    puts p2.to_s
    
    cartaPaul = Cultist.new("+1",1)
    p = CultistPlayer.new(p,cartaPaul)
    puts p.to_s
    
    cartaAnne = Cultist.new("+2",2)
    p2 = CultistPlayer.new(p2,cartaAnne)
    puts p2.to_s
    
    malRollo = BCNumberOfTreasures("Pierdes 3 tesoros visibles",3,0)
    malRollo = malRollo.adjustToFitTreasureLists(p.getVisibleTreasures, p.getHiddenTreasures)
    puts malRollo.to_s
  end
  
end

if __FILE__ == $0
  Examen4.run

end
end

#FIN EXAMEN