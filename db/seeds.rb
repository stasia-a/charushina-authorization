# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(login: 'stasia', email: 'stasia-a@tut.by', password: '111111', password_confirmation: '111111', full_name: 'Anastasia Charushina')
50.times do |n|
  login = "example-#{n+1}"
  email = "example-#{n+1}@example.com"
  full_name = Faker::Name.name
  password = '111111'
  User.create!(login: login, email: email, full_name: full_name, password: password, password_confirmation: password)
end