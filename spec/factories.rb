FactoryBot.define do
  factory :console do
    name { Faker::Name.name }
    purchase_price { Faker::Number.number(digits: 4) }
    rental_price { Faker::Number.number(digits: 2) }
    description { Faker::Lorem.paragraph }
    photo { Faker::Internet.url }
  end
end