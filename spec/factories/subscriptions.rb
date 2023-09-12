FactoryBot.define do
  factory :subscription do
    title { Faker::TvShows::Simpsons.quote }
    price { Faker::Number.decimal(l_digits: 2) }
    status { 0 }
    frequency { "Every other week" }
    customer { FactoryBot.create(:customer) }
  end
end
