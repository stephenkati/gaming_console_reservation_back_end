FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :console do
    name { Faker::Name.name }
    purchase_price { Faker::Number.number(digits: 4) }
    rental_price { Faker::Number.number(digits: 2) }
    description { Faker::Lorem.paragraph }
    photo { Faker::Internet.url }
  end
end
