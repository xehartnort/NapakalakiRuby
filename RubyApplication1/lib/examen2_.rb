# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Examen2_
  
  @@instance = nil
  
  private_class_method :new
# private :new
  def self.instance
    if @@instance==nil
      @@instance = new
    end
    @@instance
  end
  
  def initialize
    
  end
 
end

if __FILE__ == $0
  print Examen2_.instance.object_id, "\n"
  print Examen2_.instance.object_id
end