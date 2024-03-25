FactoryBot.define do
  factory :season do
    title { Faker::Name.name }
    original_title { Faker::Name.name }
    year { Faker::Date.between(from: '1960-01-01', to: '2024-03-25').year }
    number { 1 }
    tv_show { build(:tv_show) }
  end
end
