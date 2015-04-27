#!/usr/bin/env ruby
# encoding: UTF-8

require 'singleton'

class Dice
  
  include Singleton
  
#  def setf.getInstance
#    return Dice.instance
#  end
  
  def nextNumber
    return rand(6)+1
  end
  
end

#main
if __FILE__== $0
  print Dice.instance.nextNumber
end