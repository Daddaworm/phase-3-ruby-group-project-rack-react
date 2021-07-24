require 'faker'

puts "Deleting previous data"

Vehicle.destroy_all
Owner.destroy_all
Routine.destroy_all

puts "Creating owner and vehicles"

Owner.create(username: "Ethan", password: "1234") 

5.times do
Owner.create(username: Faker::Name.name, password: "1234") 
end

20.times do
Vehicle.create(year: Faker::Vehicle.year, make: Faker::Vehicle.make , model: Faker::Vehicle.model, vin: Faker::Vehicle.vin, mileage: Faker::Vehicle.mileage, oil_type: "10W-40", oil_filter: "KN-5", owner_id: rand(1..11))
end

# Vehicle.create(year: 2013, make: "Ram", model: "1500", vin: "54343-RR56-2RF1-HG556", mileage: 55043, oil_type: "5W-20", oil_filter: "MP-22")


Routine.create

puts "Seeding complete"


