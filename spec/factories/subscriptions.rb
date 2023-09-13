FactoryBot.define do
  factory :subscription do
    association :customer
    title { Faker::TvShows::Simpsons.quote }
    price { Faker::Number.decimal(l_digits: 2) }
    status { 0 }
    frequency { "Every other week" }
  end
end
