# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all

20.times do 
	User.create(name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::Number.leading_zero_number(digits: 10), description: Faker::Hipster.sentence(word_count: 70))
end

10.times do
	array = ["Paris","Lyon","Marseille","Grenoble","Montcuq","Cassis","Plaisir","St-Denis","Tours","Angles"]
	City.create(name: array.sample, zip_code: Faker::Number.number(digits: 5))
end

50.times do
Listing.create(available_bed: rand(1..5) ,price: rand(10..120) ,description: Faker::JapaneseMedia::OnePiece.quote , has_wifi: Faker::Boolean.boolean, admin: User.all.sample, city: City.all.sample)
end

10.times do 
	Reservation.create(start_date: Date.today, end_date: Faker::Date.backward(days: 90) , guest: User.all.sample, listing: Listing.all.sample)
end
puts "Base de données crée chef !"