# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing the database"

Shift.destroy_all
Employment.destroy_all
User.destroy_all
Organisation.destroy_all

puts "Database clean"


puts "Creating organisations"

organisation_num = 1

10.times do
  organisation = Organisation.new(
    name: Faker::Company.name,
    hourly_rate: rand(8.85..50.00).round(2)
  )
  organisation.save
  puts "Created organisation #{organisation_num}"
  organisation_num += 1
end

puts "Organisations created: #{Organisation.count}"



puts "Creating users"

user_num = 1
employment_num = 1

3.times do
  user = User.new(
    full_name: Faker::Name.name ,
    email: "test#{user_num}@test.com",
    password: "123456"
  )
  user.save
  puts "Created user #{user_num}"
  user_num += 1
  
  puts "Creating employments for user #{user_num}"
  

  rand(1..2).times do
    employment = Employment.new(
      user_id: user.id ,
      organisation_id: Organisation.all.sample.id,
     
    )
    employment.save
    puts "Created employment #{employment_num}"
    employment_num += 1
  end
  
  puts "Employments created: #{Employment.count} for user #{user_num}"

end

puts "Users created: #{User.count}"
puts "Employments created: #{Employment.count}"
