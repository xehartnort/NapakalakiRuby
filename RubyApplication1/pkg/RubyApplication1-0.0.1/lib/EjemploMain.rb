# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "Napakalaki.rb"
require_relative "GameTester.rb"

module Model

  class EjemploMain
   
      def self.main
        
       test = Test::GameTester.instance
     
       game = Napakalaki.instance
   
       #Se prueba el juego con 2 jugadores
   
       test.play(game, 1);
       
      end
      
  end

end

if $0 == __FILE__
  Model::EjemploMain.main()
end
