require 'pry'

#created an apartment class

class Apartment
  #we are defining the getters and setters
  attr_accessor :name, :sqft, :bedrooms, :bathrooms, :renter, :rent
  #we are assigning information received to instance variables with the same name
  def initialize (name, sqft, bedrooms, bathrooms)
    @name = name
    @sqft = sqft
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @renter = nil
    @rent = nil
  end

  #we are overriding the default method, now we get this pretty thing instead
  #of the garbly goop string of letters and numbers
  #no whenver your print apartment, you'll get this

  def to_s
    "Apartment #{name} has #{sqft} square feet"
  end

#while debugging use "self" to call itseself in pry

#renter.nil? is a convention we can use

end
