#!/usr/bin/env ruby
# encoding: UTF-8

require 'singleton'
module Model
class Dice
  
  include Singleton
  
#  def setf.getInstance
#    return Dice.instance
#  end
  
  def nextNumber
    return rand(6)+1
  end
  
end

end