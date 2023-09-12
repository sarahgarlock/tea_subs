FactoryBot.define do
  factory :customer do
    first { Faker::Name.first_name }
    last { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end
end
