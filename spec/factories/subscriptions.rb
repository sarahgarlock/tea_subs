FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { "MyString" }
    status { 1 }
    frequency { "MyString" }
    customer { nil }
  end
end
