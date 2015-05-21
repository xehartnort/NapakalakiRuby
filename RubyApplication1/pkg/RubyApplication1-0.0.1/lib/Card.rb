#Esto es una interfaz
module Model
  module Card
    def getBasicValue
      raise NotImplementedError.new
    end

    def getSpecialValue
      raise NotImplementedError.new
    end
  end
end
