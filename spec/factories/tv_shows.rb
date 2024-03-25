FactoryBot.define do
  factory :tv_show do
    title { Faker::Movie.title }
    original_title { Faker::Movie.title }
    year { Faker::Date.between(from: '1960-01-01', to: '2024-03-25').year }
    number { 1 }
  end
end
