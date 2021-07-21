

5.times do
Owner.create(username: Faker::Name.name, password: "1234") 
end


Vehicle.create(year: 2014, make: "Ram", model: "1500", vin: "4RD43-RR56-2231-X5R5T", mileage: 74403, oil_type: "10W-40", oil_filter: "KN-5")
Vehicle.create(year: 2016, make: "Nissan", model: "Altima", vin: "54343-RR56-2RF1-HG556", mileage: 55043, oil_type: "5W-20", oil_filter: "MP-22")


Routine.create

puts "Seeding complete"


