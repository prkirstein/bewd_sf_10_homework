require_relative 'lib/building'
require_relative 'lib/apartment'
require_relative 'lib/renter'

require 'pry'

#put variables into the nil instead so that you can
#test with binding.pry

#create a building
def create_building
  puts "----------- New Building ---------"
  # test_building = Building.new(nil,nil) <-- this is another way to do the last line
  puts "What is the name of the building?"
  name = gets.strip
  puts "What is the address of the building?"
  address = gets.strip
  building = Building.new(name, address)
  add_units_to_building(building)
  building.apartments.each do |apartment|
    assign_renter(apartment)
  end
  puts building
  #I need to work with the to_s methods in the individual documents to make this out put prettier
end

#create a bunch of apartments
def create_apartment
  puts "---------- New Apartment ---------"
  puts "What is the name of the apartment"
  name = gets.strip
  puts "How many sq ft is the apartment?"
  sqft = gets.strip
  puts "How many bedrooms does the apartment have?"
  bedrooms = gets.strip
  puts "How many bathrooms does the apartment have?"
  bathrooms = gets.strip
  apartment = Apartment.new(name, sqft, bedrooms, bathrooms)
  return apartment
end

#gather a bunch of renters
def create_renter
  puts "---------- New Renter -------"
  puts "What is the name of the renter?"
  name = gets.strip
  puts "What is the renter's credit score?"
  credit_score = gets.strip
  puts "What is the renter's salary?"
  salary = gets.strip
  renter = Renter.new(name, credit_score, salary)
end


#assign renters to apartments
def add_units_to_building(building)
  puts "How many apartments do you want?"
  units = gets.strip.to_i
  units.times do
    building.apartments << create_apartment
  end
  #we built this in the other class b/c it doesn't need any help from other classes
  building.list_units
end

# we need to add renters
# see if it's occupied
# if it's not occupied, let's rent it!
# there are an ugly amount of if statements down here. It works, but I think the next step would be to maybe
# split into several different methods?

def assign_renter(apartment)
    if apartment.renter == nil
      puts "Apartment #{apartment.name} is vacant"
      puts "Do you know someone who wants to rent this apartment?"
      if gets.strip.upcase == "YES"
        apartment.renter = create_renter
        if renter_requirements(apartment.renter) == true
          puts "#{apartment.renter} is approved to rent this apartment."
        else
          apartment.renter = nil
          puts "#{apartment.name} will remain vacant" # this violates never repeat yourself, eek!
        end
      else
        puts "#{apartment.name} will remain vacant"
      end
    else
      puts "#{apartment.renter} is currently renting #{apartment.name}"
    end
end

#here we define what you need in order to be a renter
def renter_requirements(renter)
#in order to rent an apartment you must have ...
  if renter.credit_score.to_i > 680 && renter.salary.to_i > 50000
    true
  else
    false
  end
end
# puts create_building
# puts create_apartment
# puts create_renter
create_building
