FactoryBot.define do
  factory :tea do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentences(number: 1) }
    temperature { Faker::Number.between(from: 100, to: 212) }
    brew_time { Faker::Number.between(from: 1, to: 5) }
  end
end
