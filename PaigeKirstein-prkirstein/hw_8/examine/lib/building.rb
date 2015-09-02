require 'pry'

class Building
  attr_accessor :address, :apartments, :name
  def initialize (name, address)
    @name = name
    @address = address
    @apartments = []
  end


  def list_units
    puts "There are #{apartments.count} units in #{name}"
    apartments.each do |apartment|
      puts "Unit #{apartment.name} has #{apartment.bedrooms} bedrooms"
    end
  end

  def to_s
    "#{list_units}"
  end

end
