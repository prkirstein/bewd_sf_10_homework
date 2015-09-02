require 'pry'

class Renter
  attr_accessor :name, :credit_score, :salary, :pets, :vehicle
  def initialize(name, credit_score, salary)
    @name = name
    @credit_score = credit_score
    @salary = salary #transform into commas
    @pets = nil
    @vehicle = nil
  end

  def to_s
    "#{name}"
  end
end


  #later give everyone 800 and $300K
