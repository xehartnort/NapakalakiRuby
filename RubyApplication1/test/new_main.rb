#Diferencias entre el uso de require_relative y load
#require_relative solo actúa una vez y yata 
#load acúa tantas veces como aparezca en el código, es como cargar un script

require_relative 'main.rb'
require_relative 'main.rb'
require_relative 'main.rb'
print "así"