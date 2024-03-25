FactoryBot.define do
  factory :content do
    title { Faker::Lorem.word } 
    original_title { Faker::Lorem.word }
    year { Faker::Date.between(from: '1960-01-01', to: '2024-03-25').year }
    number { 1 }
  end
end
