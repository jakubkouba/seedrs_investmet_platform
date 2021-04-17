# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  Campaign.create(name: Faker::Company.name,
                  percent_raised: rand(100),
                  target_amount: rand(100_000_000),
                  sector: Faker::Commerce.department(max: 1),
                  country: Faker::Address.country,
                  investment_multiple: rand(50_000))
end
